import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.all(8),
          color: Colors.amberAccent,
          height: 250,
          width: 250,
          child: TextButton(onPressed: () {}, child: Text('Routing--1')),
        ),
        Container(
          margin: EdgeInsets.all(8),
          color: Colors.orange,
          height: 250,
          width: 250,
          child: TextButton(onPressed: () {}, child: Text('Routing--2')),
        ),
        Container(
          margin: EdgeInsets.all(8),
          color: Colors.red,
          height: 250,
          width: 250,
          child: TextButton(onPressed: () {}, child: Text('Routing--3')),
        ),
        Container(
          margin: EdgeInsets.all(8),
          color: Colors.grey,
          height: 250,
          width: 250,
          child: TextButton(onPressed: () {}, child: Text('Routing--4')),
        ),
      ],
    );
  }
}
