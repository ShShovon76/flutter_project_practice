import 'package:flutter/material.dart';

// class Page1 extends StatelessWidget {
//   const Page1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView
//     (
//       children: [
//         ListTile(
//           title: Text('list tile 1'),
//           subtitle: Text('list tile practice '),
//           leading: CircleAvatar(
//             child: Icon(Icons.add_call),
//           ),
//           trailing: Icon(Icons.account_circle, size: 50),
//         ),
//         ListTile(
//           title: Text('list tile 1'),
//           subtitle: Text('list tile practice '),
//           leading: CircleAvatar(
//             child: Icon(Icons.add_call),
//           ),
//           trailing: Icon(Icons.account_circle, size: 50,),
//         ),
//         ListTile(
//           title: Text('list tile 1'),
//           subtitle: Text('list tile practice '),
//           leading: CircleAvatar(
//             child: Icon(Icons.add_call),
//           ),
//           trailing: Icon(Icons.account_circle, size: 50),
//         ),
//         ListTile(
//           title: Text('list tile 1'),
//           subtitle: Text('list tile practice '),
//           leading: CircleAvatar(
//             child: Icon(Icons.add_call),
//           ),
//           trailing: Icon(Icons.account_circle, size: 50),
//         ),
//         ListTile(
//           title: Text('list tile 1'),
//           subtitle: Text('list tile practice '),
//           leading: CircleAvatar(
//             child: Icon(Icons.add_call),
//           ),
//           trailing: Icon(Icons.account_circle, size: 50),
//         ),
//         ListTile(
//           title: Text('list tile 1'),
//           subtitle: Text('list tile practice '),
//           leading: CircleAvatar(
//             child: Icon(Icons.add_call),
//           ),
//           trailing: Icon(Icons.account_circle, size: 50),
//         ),
//         ListTile(
//           title: Text('list tile 1'),
//           subtitle: Text('list tile practice '),
//           leading: CircleAvatar(
//             child: Icon(Icons.add_call),
//           ),
//           trailing: Icon(Icons.account_circle, size: 50),
//         ),
//         ListTile(
//           title: Text('list tile 1'),
//           subtitle: Text('list tile practice '),
//           leading: CircleAvatar(
//             child: Icon(Icons.add_call),
//           ),
//           trailing: Icon(Icons.account_circle, size: 50),
//         ),
//         ListTile(
//           title: Text('list tile 1'),
//           subtitle: Text('list tile practice '),
//           leading: CircleAvatar(
//             child: Icon(Icons.add_call),
//           ),
//           trailing: Icon(Icons.account_circle, size: 50),
//         ),
//          ListTile(
//           title: Text('list tile 1'),
//           subtitle: Text('list tile practice '),
//           leading: CircleAvatar(
//             child: Icon(Icons.add_call),
//           ),
//           trailing: Icon(Icons.account_circle, size: 50),
//         ),
//         ListTile(
//           title: Text('list tile 1'),
//           subtitle: Text('list tile practice '),
//           leading: CircleAvatar(
//             child: Icon(Icons.add_call),
//           ),
//           trailing: Icon(Icons.account_circle, size: 50),
//         ),
//          ListTile(
//           title: Text('list tile 1'),
//           subtitle: Text('list tile practice '),
//           leading: CircleAvatar(
//             child: Icon(Icons.add_call),
//           ),
//           trailing: Icon(Icons.account_circle, size: 50),
//         ),
//         ListTile(
//           title: Text('list tile 1'),
//           subtitle: Text('list tile practice '),
//           leading: CircleAvatar(
//             child: Icon(Icons.add_call),
//           ),
//           trailing: Icon(Icons.account_circle, size: 50),
//         ),
//          ListTile(
//           title: Text('list tile 1'),
//           subtitle: Text('list tile practice '),
//           leading: CircleAvatar(
//             child: Icon(Icons.add_call),
//           ),
//           trailing: Icon(Icons.account_circle, size: 50),
//         ),
//         ListTile(
//           title: Text('list tile 1'),
//           subtitle: Text('list tile practice '),
//           leading: CircleAvatar(
//             child: Icon(Icons.add_call),
//           ),
//           trailing: Icon(Icons.account_circle, size: 50),
//         ),

//       ],
//     );
//   }
// }

// class Page1 extends StatelessWidget {
//   const Page1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: 15, // number of items
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text('List tile ${index + 1}'),
//           subtitle: const Text('List tile practice'),
//           leading: const CircleAvatar(
//             child: Icon(Icons.add_call, color: Colors.blueAccent),
//           ),
//           trailing: const Icon(
//             Icons.account_circle,
//             size: 50,
//             color: Colors.blueAccent,
//           ),
//         );
//       },
//     );
//   }
// }

class Page1ex extends StatelessWidget {
  const Page1ex({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("List View ${index + 1}"),
          titleTextStyle: TextStyle(color: Colors.blue),
          subtitle: Text("This is a sub title"),
          leading: CircleAvatar(
            child: Image.asset('assets/man.png', height: 50, width: 50),
          ),
          trailing: IconButton(
            onPressed: () {
              print('Icon Pressed ${index}');
            },
            icon: Icon(Icons.add_ic_call),
          ),
        );
      },
    );
  }
}
