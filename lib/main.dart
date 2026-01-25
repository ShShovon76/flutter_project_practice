import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'My First Project',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
          ),
          centerTitle: true,
          toolbarOpacity: 1,
          titleSpacing: 10,
          elevation: 10,
          toolbarHeight: 100,
          backgroundColor: Colors.deepPurpleAccent,
          actions: [
            IconButton(
              onPressed: () {
                print("Button 1 Clicked");
              },
              icon: Icon(Icons.home, color: Colors.amberAccent),
            ),
            SizedBox(width: 15),
            IconButton(
              onPressed: () {
                print("Button 2 Clicked");
              },
              icon: Icon(Icons.ac_unit_rounded, color: Colors.amberAccent),
            ),
            SizedBox(width: 15),
            IconButton(
              onPressed: () {
                print("Button 3 Clicked");
              },
              icon: Icon(Icons.access_alarms_sharp, color: Colors.amberAccent),
            ),
            SizedBox(width: 15),
            IconButton(
              onPressed: () {
                print("Button 4 Clicked");
              },
              icon: Icon(
                Icons.accessibility_outlined,
                color: Colors.amberAccent,
              ),
            ),
            SizedBox(width: 15),
            IconButton(
              onPressed: () {
                print("Button 5 Clicked");
              },
              icon: Icon(Icons.accessible_outlined, color: Colors.amberAccent),
            ),
            SizedBox(width: 15),
          ],
        ),
        body: Center(child: Text('Hello World!')),
      ),
    );
  }
}
