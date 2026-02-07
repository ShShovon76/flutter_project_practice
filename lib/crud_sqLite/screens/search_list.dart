import 'package:flutter/material.dart';

class SearchListScreen extends StatefulWidget {
  const SearchListScreen({super.key});

  @override
  State<SearchListScreen> createState() => _SearchListScreenState();
}

class _SearchListScreenState extends State<SearchListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                label: Text('Search'),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderSide: BorderSide()),
              ),
            ),
          ),
          SizedBox(height: 16),
          ListTile(leading: Image.asset('assets/man.png')),
        ],
      ),
    );
  }
}
