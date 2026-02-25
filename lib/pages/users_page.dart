import 'package:buzzly/components/my_drawer.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      drawer: const MyDrawer(),
      body: const Center(child: Text('Users Page')),
    );
  }
}
