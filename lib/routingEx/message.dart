import 'package:flutter/material.dart';
import 'package:my_first_project/routingEx/about.dart';
import 'package:my_first_project/routingEx/contact.dart';
import 'package:my_first_project/routingEx/home.dart';

class MessagePage extends StatelessWidget {
  final String message;
  const MessagePage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(title: Text("Message page"), backgroundColor: Colors.blue),
      body: Padding(
        padding: EdgeInsets.all(8),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                message,
                style: TextStyle(color: Colors.red, fontSize: 50),
              ),
            ),

            SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
              child: Text('go to Profile page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: Text('go to Home page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
              child: Text('go to About page'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactPage()),
                );
              },
              child: Text('go to Contact page'),
            ),
          ],
        ),
      ),
    );
  }
}
