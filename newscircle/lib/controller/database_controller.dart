import 'package:newscircle/model/news_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseController {
  // database private instance
  static Database? _database;

  // getter for database instance
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // database initialization
  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'recent_news.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS recent_news (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            sourceName TEXT,
            title TEXT,
            author TEXT,
            publishedAt TEXT,
            description TEXT,
            url TEXT NOT NULL,
            content TEXT,
            urlToImage TEXT,
            timestamp INTEGER,
            CONSTRAINT unique_news UNIQUE (url)
          )
        ''');
      },
    );
  }

  Future<void> insertNews(Map<String, dynamic> news) async {
    final db = await database;
    await db.insert('recent_news', news);
    await _limitRecords(db);
    recentViewedNewsData.insert(
      0,
      NewsModel(
        sourceName: news['sourceName'],
        title: news['title'],
        author: news['author'],
        publishedAt: news['publishedAt'],
        description: news['description'],
        url: news['url'],
        content: news['content'],
        urlToImage: news['urlToImage'],
      ),
    );
  }

  Future<void> _limitRecords(Database db) async {
    final count = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM recent_news'),
    );

    if (count != null && count > 15) {
      // maintaining the length upto 15 recent news
      await db.rawDelete(
        '''
        DELETE FROM recent_news
        WHERE id IN (
          SELECT id FROM recent_news
          ORDER BY timestamp ASC
          LIMIT ?
        )
      ''',
        [count - 15],
      );
    }
  }

  Future<void> getRecentNews() async {
    final db = await database;
    List<Map<String, Object?>> data = await db.query(
      'recent_news',
      orderBy: 'timestamp DESC',
    );
    // filling NewsModel
    for (Map<String, dynamic> news in data) {
      recentViewedNewsData.add(
        NewsModel(
          sourceName: news['sourceName'],
          title: news['title'],
          author: news['author'],
          publishedAt: news['publishedAt'],
          description: news['description'],
          url: news['url'],
          content: news['content'],
          urlToImage: news['urlToImage'],
        ),
      );
    }
  }

  Future<void> clearAllNews() async {
    final db = await database;
    await db.delete('recent_news');
  }
}
