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
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),

      home: PracticeImages(),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const MyAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.cyan,
      title: const Text('flutter Popup examples'),
      actions: [
        PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'Add',
              child: Row(
                children: [
                  Icon(Icons.add, size: 18, color: Colors.green),
                  SizedBox(width: 8),
                  Text('Add', style: TextStyle(color: Colors.green)),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'Delete',
              child: Row(
                children: [
                  Icon(Icons.delete, size: 18, color: Colors.red),
                  SizedBox(width: 8),
                  Text('Delete', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'Edit',
              child: Row(
                children: [
                  Icon(Icons.edit, size: 18, color: Colors.blue),
                  SizedBox(width: 8),
                  Text('Edit', style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),
          ],
          onSelected: (value) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.blue,
                content: Row(
                  children: [
                    Icon(Icons.add_card, color: Colors.amber),
                    SizedBox(width: 8),
                    Text(' Selected Option: $value'),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class Practice2 extends StatelessWidget {
  const Practice2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Practice 2')),

      body: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.blueAccent,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}

class Practice3 extends StatelessWidget {
  const Practice3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "practice 3"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      color: Colors.lightGreen,
                    ),

                    Container(height: 200, width: 200, color: Colors.blueGrey),
                    Container(height: 200, width: 200, color: Colors.blue),
                    Container(height: 200, width: 200, color: Colors.red),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.amber,
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.blueGrey,
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Pracrice4 extends StatelessWidget {
  const Pracrice4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(width: double.infinity, height: 100, color: Colors.amber),
            Container(width: double.infinity, height: 100, color: Colors.red),
            Container(width: double.infinity, height: 100, color: Colors.blue),
            Container(width: double.infinity, height: 100, color: Colors.green),
            Container(width: double.infinity, height: 100, color: Colors.red),
            Container(width: double.infinity, height: 100, color: Colors.blue),
            Container(
              margin: EdgeInsets.all(8),
              width: double.infinity,
              height: 100,
              color: Colors.green,
            ),
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(11),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        "Hello",
                        style: TextStyle(color: Colors.blue, fontSize: 21),
                      ),
                    ),

                    SizedBox(width: 8),
                    Icon(Icons.drive_eta),
                    SizedBox(width: 8),
                    Icon(Icons.do_not_disturb_alt_rounded),
                    SizedBox(width: 8),
                    Icon(Icons.drive_eta),
                  ],
                ),
              ),
            ),
            Container(width: double.infinity, height: 100, color: Colors.blue),
            Container(width: double.infinity, height: 100, color: Colors.green),
            Container(width: double.infinity, height: 100, color: Colors.blue),
            Container(width: double.infinity, height: 100, color: Colors.green),
          ],
        ),
      ),
    );
  }
}

class PracticeImages extends StatelessWidget {
  final bool loadFromNetwork;
  const PracticeImages({super.key, this.loadFromNetwork = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Images"),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn2nmWoa-66Yo5xylQwIiAxtvMrK2pB2l4CA&s",
            ),
            fit: BoxFit.cover, // important to fill
          ),
        ),
        child: Center(
          child: loadFromNetwork
              ? Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn2nmWoa-66Yo5xylQwIiAxtvMrK2pB2l4CA&s",
                  height: 400,
                  width: 400,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  'assets/man.png',
                  height: 400,
                  width: 400,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
