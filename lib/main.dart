import 'package:flutter/material.dart';
import 'package:my_first_project/page1.dart';
import 'package:my_first_project/page2.dart';
import 'package:my_first_project/page3.dart';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),

      home: BtnNavigation(),
    );
  }
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

class BtnNavigation extends StatefulWidget {
  const BtnNavigation({super.key});

  @override
  State<BtnNavigation> createState() => _BtnNavigationState();
}

class _BtnNavigationState extends State<BtnNavigation> {
  var _currentState = 0;

  final pages = [Page1(), Page2(), Page3()];
  final List<AppBar> appBars = [
    AppBar(title: Text('Page 1'), backgroundColor: Colors.amberAccent),
    AppBar(title: Text('Page 2'), backgroundColor: Colors.greenAccent),
    AppBar(title: Text('Page 3'), backgroundColor: Colors.blueAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBars[_currentState],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        currentIndex: _currentState,

        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,

        items: const [
          BottomNavigationBarItem(label: 'Page- 1', icon: Icon(Icons.message)),
          BottomNavigationBarItem(label: 'Page- 2', icon: Icon(Icons.call)),
          BottomNavigationBarItem(label: 'Page- 3', icon: Icon(Icons.list_alt)),
        ],
        onTap: (index) {
          setState(() {
            _currentState = index;
          });
        },
      ),

      body: pages[_currentState],
    );
  }
}
