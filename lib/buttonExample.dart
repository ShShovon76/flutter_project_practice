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
      title: 'button example',
      home: ButtonDemoPage(),
    );
  }
}

class ButtonDemoPage extends StatelessWidget {
  const ButtonDemoPage({super.key});
  void showMessage(String msg) {
    Fluttertoast.showToast(
      msg: 'This is a toast $msg',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.blueAccent,
      textColor: Colors.white,
      fontSize: 16,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Button Demo")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showMessage("Floating Action Button Clicked"),
        splashColor: Colors.redAccent,
        child: Icon(Icons.add_box_rounded, color: Colors.lightGreen, size: 50),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                showMessage("Elevated Button Clicked");
              },
              child: Text("Elevated Button"),
            ),

            OutlinedButton(
              onPressed: () => showMessage("Outline Button Clicked"),
              style: OutlinedButton.styleFrom(backgroundColor: Colors.blue),
              child: Text(
                "OutLine Button",
                style: TextStyle(color: Colors.white),
              ),
            ),

            IconButton(
              onPressed: () => showMessage("Icon Button Clicked"),
              icon: Icon(Icons.business, color: Colors.red, size: 60),
            ),

            MaterialButton(
              onPressed: () => showMessage("Button clicked"),
              color: Colors.cyan,
              child: const Text(
                "Material Button",
                style: TextStyle(color: Colors.white),
              ),
            ),

            InkWell(
              onTap: () => showMessage("InkWell button clicked"),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Custom InkWell Button',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
