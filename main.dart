import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("@pratikkor"),
          backgroundColor: Colors.amber,
        ),
        // bottomNavigationBarItem always required labels with Icons
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.copy), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_rounded), label: ""),
        ]),
        body: Center(
          child: Image.network(
              "https://logowik.com/content/uploads/images/flutter5786.jpg"),
        ),
      ),
      // when false, is used to remove debug banner 
      debugShowCheckedModeBanner: false,
    );
  }
}
