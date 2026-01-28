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

      home: MyWidgetDrawer(),
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

  final pages = [Page1ex(), Page2(), Page3()];
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

class BtnNavigationEX extends StatefulWidget {
  const BtnNavigationEX({super.key});

  @override
  State<BtnNavigationEX> createState() => _BtnNavigationEXState();
}

class _BtnNavigationEXState extends State<BtnNavigationEX> {
  var _currentState = 0;
  final pages = [Page1ex(), Page2(), Page3()];
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
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: false,
        currentIndex: _currentState,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(label: 'Messages', icon: Icon(Icons.message)),
          BottomNavigationBarItem(label: 'Call', icon: Icon(Icons.call)),
          BottomNavigationBarItem(label: 'List', icon: Icon(Icons.list)),
        ],
        onTap: (value) {
          setState(() {
            _currentState = value;
          });
        },
      ),
      body: pages[_currentState],
    );
  }
}

class MyWidgetDrawer extends StatelessWidget {
  const MyWidgetDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Drawer example"),
        backgroundColor: Colors.amber.shade700,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blueAccent),
              accountName: Text(
                "Shovon",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                'shshovonnct@gmail.com',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              currentAccountPicture: SizedBox(
                width: 80,
                height: 80,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/man.png'),
                ),
              ),
            ),
            ListTile(
              title: Text("Page-1"),
              leading: Icon(Icons.home, color: Colors.blue),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Page-2"),
              leading: Icon(Icons.list, color: Colors.green),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            AboutListTile(
              icon: Icon(Icons.info, color: Colors.amber),
              applicationName: 'My App',
              applicationVersion: '1.0.0',
              applicationIcon: Icon(Icons.apps, color: Colors.amber),
              applicationLegalese: '© 2026 Shovon',
              aboutBoxChildren: [
                SizedBox(height: 10),
                Text(
                  'This app is built using Flutter.\nThank you for using it!',
                ),
              ],
            ),
            ListTile(
              title: Text("Page-3"),
              leading: Icon(Icons.notifications, color: Colors.redAccent),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: Center(child: Text("hello")),
    );
  }
}
