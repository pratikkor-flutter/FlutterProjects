import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newscircle/model/news_model.dart';

class ApiManipulation {
  // to get data for top headlines
  static void getTopHeadlines() async {
    // url specific to top-headlines
    Uri getUrl = Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=7ff4cd849b54403cae86d03fc8e1c10f',
    );
    http.Response response = await http.get(getUrl);

    if (response.statusCode != 200) {
      getTopHeadlines();
    }

    Map<String, dynamic> jsonData = json.decode(response.body);
    // filling NewsModel
    for (Map<String, dynamic> news in jsonData['articles']) {
      if (!news.values.contains(null)) {
        topHeadlinesData.add(
          NewsModel(
            sourceName: news['source']['name'],
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
  }

// to get data for specific category selected by user
  static void getNewsOfCategory(String category) async {
    if (category == 'healthcare') {
      category = 'health';
    }
    // url specific to top-headlines
    Uri getUrl = Uri.parse(
      'https://newsapi.org/v2/top-headlines?category=$category&apiKey=7ff4cd849b54403cae86d03fc8e1c10f',
    );
    http.Response response = await http.get(getUrl);
    Map<String, dynamic> jsonData = json.decode(response.body);

    // since categorial data canbe mixed, empty the list
    categoryNewsData.clear();

    // filling NewsModel
    for (Map<String, dynamic> news in jsonData['articles']) {
      if (!news.values.contains(null)) {
        categoryNewsData.add(
          NewsModel(
            sourceName: news['source']['name'],
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
  }

// to get data for specific channel selected by user
  static void getNewsFromChannel(String channel) async {
    // url specific to top-headlines
    Uri getUrl = Uri.parse(
      'https://newsapi.org/v2/top-headlines?sources=$channel&apiKey=7ff4cd849b54403cae86d03fc8e1c10f',
    );
    http.Response response = await http.get(getUrl);
    Map<String, dynamic> jsonData = json.decode(response.body);

    // since channel data canbe mixed, empty the list
    categoryNewsData.clear();

    // filling NewsModel
    for (Map<String, dynamic> news in jsonData['articles']) {
      if (!news.values.contains(null)) {
        categoryNewsData.add(
          NewsModel(
            sourceName: news['source']['name'],
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
  }
}
