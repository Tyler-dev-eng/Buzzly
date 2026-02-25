import 'package:buzzly/components/my_drawer.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
      ),
      drawer: const MyDrawer(),
      body: const Center(child: Text('Profile Page')),
    );
  }
}
