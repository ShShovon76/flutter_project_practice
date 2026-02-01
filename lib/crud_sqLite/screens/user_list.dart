import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_first_project/crud_sqLite/db/database_helper.dart';
import 'package:my_first_project/crud_sqLite/model/user.dart';
import 'package:my_first_project/crud_sqLite/screens/user_form.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<User> users = [];
  bool isLoading = true;

  // ==============================
  // FETCH USERS
  // ==============================
  Future<void> fetchUsers() async {
    setState(() => isLoading = true);
    users = await DatabaseHelper().getUsers();
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  // ==============================
  // DELETE CONFIRM
  // ==============================
  Future<void> confirmDelete(User user) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Delete User'),
        content: Text('Delete ${user.name}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('CANCEL'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('DELETE'),
          ),
        ],
      ),
    );

    if (ok == true) {
      await DatabaseHelper().deleteUser(user.id!);
      fetchUsers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const UserForm()),
          );
          fetchUsers();
        },
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : users.isEmpty
          ? const Center(child: Text('No users found'))
          : RefreshIndicator(
              onRefresh: fetchUsers,
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (_, index) {
                  final u = users[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: u.imagePath != null
                            ? FileImage(File(u.imagePath!))
                            : null,
                        child: u.imagePath == null
                            ? const Icon(Icons.person)
                            : null,
                      ),
                      title: Text(u.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(u.email),
                          Text('${u.gender.name.toUpperCase()} • Age ${u.age}'),
                          if (u.skills.isNotEmpty)
                            Wrap(
                              spacing: 4,
                              children: u.skills
                                  .take(3)
                                  .map(
                                    (s) => Chip(
                                      label: Text(s),
                                      visualDensity: VisualDensity.compact,
                                    ),
                                  )
                                  .toList(),
                            ),
                        ],
                      ),
                      isThreeLine: true,
                      trailing: SizedBox(
                        width: 72, // important: keeps trailing compact
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              u.isActive ? Icons.check_circle : Icons.cancel,
                              color: u.isActive ? Colors.green : Colors.red,
                              size: 18,
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => UserForm(user: u),
                                      ),
                                    );
                                    fetchUsers();
                                  },
                                  borderRadius: BorderRadius.circular(16),
                                  child: const Padding(
                                    padding: EdgeInsets.all(6),
                                    child: Icon(Icons.edit, size: 18),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                InkWell(
                                  onTap: () => confirmDelete(u),
                                  borderRadius: BorderRadius.circular(16),
                                  child: const Padding(
                                    padding: EdgeInsets.all(6),
                                    child: Icon(
                                      Icons.delete,
                                      size: 18,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
