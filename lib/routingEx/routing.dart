import 'package:flutter/material.dart';
import 'package:my_first_project/routingEx/about.dart';
import 'package:my_first_project/routingEx/contact.dart';
import 'package:my_first_project/routingEx/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter routing demo',
      initialRoute: '/',
      routes: {
       '/' : (context) => const HomePage(),
       '/about': (context) => const AboutPage(),
       '/contact': (context) => const ContactPage(),
      },
    );
  }
}
