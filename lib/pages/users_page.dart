import 'package:buzzly/components/my_drawer.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Users', style: TextStyle(color: Colors.white)),
      ),
      drawer: const MyDrawer(),
      body: const Center(child: Text('Users Page')),
    );
  }
}
