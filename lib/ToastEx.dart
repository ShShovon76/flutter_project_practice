import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete, color: Colors.red),
            ),

            ElevatedButton(
              onPressed: () {
                Fluttertoast.showToast(
                  msg: 'this is a toast message',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.amber,
                  textColor: Colors.white,
                  fontSize: 16,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.white,
              ),
              child: const Text('Show Toast'),
            ),

            ElevatedButton(
              onPressed: () {
                Fluttertoast.showToast(
                  msg: 'this is a toast message',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // button color
                foregroundColor: Colors.white, // text/icon color
              ),
              child: const Text('Show message'),
            ),

            // Alert dialog
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,

                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.amberAccent,
                    title: const Text(
                      "Alert",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: const Text(
                      "This is an alret dialog",
                      style: TextStyle(color: Colors.black),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('ok'),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey, // button color
                foregroundColor: Colors.black, // text/icon color
              ),
              child: const Text('Show Alert message'),
            ),

            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'This is a Snakbar',
                      style: TextStyle(color: Colors.amber),
                    ),
                    backgroundColor: Color.fromARGB(255, 4, 93, 165),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // button color
                foregroundColor: Colors.white, // text/icon color
              ),
              child: const Text('Show SnackBar'),
            ),

            // Alert dialog
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,

                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.amberAccent,
                    title: const Text(
                      "Confirm",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: const Text(
                      "This is an alret dialog",
                      style: TextStyle(color: Colors.black),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('ok'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('cancel'),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // button color
                foregroundColor: Colors.white, // text/icon color
              ),
              child: const Text('Show Dialog message'),
            ),

            // Bottom sheet
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: 500,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "modal bottom sheet",
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Close"),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan, // button color
                foregroundColor: Colors.white, // text/icon color
              ),
              child: const Text('Show Bottom sheet'),
            ),
          ],
        ),
      ),
    );
  }
}
