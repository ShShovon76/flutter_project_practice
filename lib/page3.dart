import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          color: Colors.amberAccent,
          height: 250,
          width: 250,
          child: TextButton(onPressed: () {}, child: Text('Routing--1')),
        ),
        Container(
          color: Colors.orange,
          height: 250,
          width: 250,
          child: TextButton(onPressed: () {}, child: Text('Routing--1')),
        ),
        Container(
          color: Colors.red,
          height: 250,
          width: 250,
          child: TextButton(onPressed: () {}, child: Text('Routing--1')),
        ),
        Container(
          color: Colors.grey,
          height: 250,
          width: 250,
          child: TextButton(onPressed: () {}, child: Text('Routing--1')),
        ),
      ],
    );
  }
}
