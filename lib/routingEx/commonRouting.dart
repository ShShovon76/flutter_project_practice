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
      title: 'Common AppBar Demo',
      home: const HomePage2(),
    );
  }
}

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CommonAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: Colors.blue,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class AppDrawer extends StatelessWidget {
  final BuildContext context;
  const AppDrawer({super.key, required this.context});

  void navigate(Widget page) {
    Navigator.pop(context);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            accountName: Text("Shovon"),
            accountEmail: Text("shshovon@gmail.com"),
            currentAccountPicture: CircleAvatar(backgroundColor: Colors.amber),
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: Text("Home"),
            onTap: () => navigate(const HomePage2()),
          ),
          ListTile(
            leading: const Icon(Icons.contact_page),
            title: Text("Contacts"),
            onTap: () => navigate(const ContactPage()),
          ),
          ListTile(
            leading: const Icon(Icons.perm_device_information_outlined),
            title: Text("About"),
            onTap: () => navigate(const AboutPage()),
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: Text("profile"),
            onTap: () => navigate(const ProfilePage()),
          ),
        ],
      ),
    );
  }
}

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: CommonAppBar(title: "Home page"),
      drawer: AppDrawer(context: context),
      body: pageBody('Home Page', Icons.home),
    );
  }
}

Widget pageBody(String title, IconData icon) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80, color: Colors.blue),
        const SizedBox(height: 16),
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    ),
  );
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Profile page'),
      drawer: AppDrawer(context: context),
      body: pageBody('Profile', Icons.man),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Contact page'),
      drawer: AppDrawer(context: context),
      body: pageBody('Contact', Icons.person),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'About page'),
      drawer: AppDrawer(context: context),
      body: pageBody('About', Icons.man),
    );
  }
}
