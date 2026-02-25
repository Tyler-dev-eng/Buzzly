import 'package:flutter/material.dart';

class MyDrawerHeader extends StatelessWidget {
  const MyDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      alignment: Alignment.center,
      color: Theme.of(context).colorScheme.surface,
      child: Icon(
        Icons.favorite,
        size: 64,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}
