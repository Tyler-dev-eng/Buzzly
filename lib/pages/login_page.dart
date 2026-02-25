import 'package:buzzly/components/my_button.dart';
import 'package:buzzly/components/my_textfield.dart';
import 'package:buzzly/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

String _authErrorMessage(FirebaseAuthException e) {
  return switch (e.code) {
    'wrong-password' ||
    'invalid-credential' => 'Incorrect email or password. Please try again.',
    'user-not-found' => 'No account found with this email.',
    'invalid-email' => 'Please enter a valid email address.',
    'user-disabled' => 'This account has been disabled.',
    'too-many-requests' => 'Too many attempts. Please try again later.',
    _ => 'Something went wrong. Please try again.',
  };
}

class LoginPage extends StatefulWidget {
  final VoidCallback onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    final authService = AuthService();
    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await authService.signInWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      if (mounted) {
        final message = e is FirebaseAuthException
            ? _authErrorMessage(e)
            : 'Something went wrong. Please try again.';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }
    } finally {
      if (mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),

              SizedBox(height: 25),

              // app name
              Text('B U Z Z L Y', style: TextStyle(fontSize: 20)),

              SizedBox(height: 25),

              // email input
              MyTextField(
                hintText: 'Email',
                isPassword: false,
                controller: emailController,
              ),

              SizedBox(height: 10),

              // password input
              MyTextField(
                hintText: 'Password',
                isPassword: true,
                controller: passwordController,
              ),

              SizedBox(height: 10),

              // forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25),

              // sign in button
              MyButton(text: 'Login', onTap: login),

              SizedBox(height: 25),

              // dont have an account? sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Register Here",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary,
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
  }
}
