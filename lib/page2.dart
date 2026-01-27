import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 10,

        children: [
          Container(
            color: Colors.amber,
            height: 205,
            width: 250,
            child: TextButton(onPressed: () {}, child: Text("Routing --1")),
          ),
          Container(
            color: Colors.amber,
            height: 205,
            width: 250,
            child: TextButton(onPressed: () {}, child: Text("Routing --1")),
          ),
          Container(
            color: Colors.greenAccent,
            height: 205,
            width: 250,
            child: TextButton(onPressed: () {}, child: Text("Routing --2")),
          ),
          Container(
            color: Colors.blue,
            height: 205,
            width: 250,
            child: TextButton(onPressed: () {}, child: Text("Routing --3")),
          ),
          Container(
            color: Colors.deepOrange,
            height: 205,
            width: 250,
            child: TextButton(onPressed: () {}, child: Text("Routing --4")),
          ),
        ],
      ),
    );
  }
}
