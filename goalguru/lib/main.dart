import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:goalguru/view/boarding_screen.dart';

dynamic db;

class UserData {
  /// this is the model class for the user authentication table
  final String name;
  final String username;
  final String password;

  const UserData({
    required this.name,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> getUserMap() {
    return {
      'NAME': name,
      'USER_NAME': username,
      'PASSWORD': password,
    };
  }
}

Future<List<Map<String, dynamic>>> getUserData() async {
  /// returns user auth data
  final localDB = await db;
  List<Map<String, dynamic>> userMapData = await localDB.query('USERDATA');
  return userMapData;
}

Future<Map<String, bool>> checkUserCredentials(
    String username, String password) async {
  /// check for the auth credentials which are provided from sign in screen
  final localDB = await db;

  // await localDB.rawQuery('''DROP TABLE IF EXISTS USERDATA;''');

  final validUser = await localDB.rawQuery(
      '''SELECT * FROM USERDATA WHERE USER_NAME = '$username' AND PASSWORD = '$password';''');

  // print(await localDB.rawQuery('''SELECT * FROM USERDATA;'''));

  if (await validUser.isNotEmpty) {
    // print("IN CHECK USER CRED $validUser");
    return {username: true};
  }
  return {username: false};
}

Future<String> getName() async {
  final localDB = await db;
  final nameData = await localDB.rawQuery('''SELECT NAME FROM USERDATA;''');
  return nameData[0]["NAME"]!;
}

Future<void> insertUserData(UserData obj) async {
  /// insert new user auth credentials
  final localDB = await db;

  localDB.insert(
    'USERDATA',
    obj.getUserMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

class GoalData {
  /// this is the model class for the goal data table
  final String title;
  final String description;
  final String date;

  const GoalData({
    required this.title,
    required this.description,
    required this.date,
  });

  Map<String, dynamic> getGoalMap() {
    return {
      'GOAL_TITLE': title,
      'GOAL_DESCRIPTION': description,
      'GOAL_DATE': date,
    };
  }
}

Future<List<Map<String, dynamic>>> getGoalData() async {
  /// returns goal data
  final localDB = await db;
  List<Map<String, dynamic>> goalMapData = await localDB.query('GOALDATA');
  return goalMapData;
}

Future<void> insertGoalData(GoalData obj) async {
  /// insert new goal
  final localDB = await db;

  localDB.insert(
    'GOALDATA',
    obj.getGoalMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> updateGoalData(GoalData obj) async {
  // update existing goal
  final localDB = await db;

  await localDB.update(
    'GOALDATA',
    obj.getGoalMap(),
    where: 'GOAL_TITLE = ?',
    whereArgs: [obj.title],
  );
}

Future<void> deleteGoalData(String title) async {
  // remove goal
  final localDB = await db;

  await localDB.delete(
    'GOALDATA',
    where: 'GOAL_TITLE = ?',
    whereArgs: [title],
  );
}

class GoalGuru extends StatelessWidget {
  const GoalGuru({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BoardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const GoalGuru());

  db = openDatabase(
    join(await getDatabasesPath(), 'GOALGURU.db'),
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(
          '''CREATE TABLE IF NOT EXISTS GOALDATA(GOAL_ID INTEGER PRIMARY KEY AUTOINCREMENT, GOAL_TITLE TEXT NOT NULL, GOAL_DESCRIPTION TEXT NOT NULL, GOAL_DATE TEXT NOT NULL)''');
      await db.execute(
          '''CREATE TABLE USERDATA(NAME TEXT NOT NULL, USER_NAME TEXT PRIMARY KEY NOT NULL,PASSWORD TEXT NOT NULL)''');
    },
  );
}
