import 'package:buzzly/pages/home_page.dart';
import 'package:buzzly/services/auth/login_or_register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        return snapshot.data != null
            ? const HomePage()
            : const LoginOrRegisterPage();
      },
    );
  }
}
