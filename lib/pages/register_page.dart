import 'package:buzzly/components/my_button.dart';
import 'package:buzzly/components/my_textfield.dart';
import 'package:buzzly/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController usernameController = TextEditingController();

  Future<void> register() async {
    final authService = AuthService();
    // loading
    showDialog(
      context: context,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    // make sure passwords match
    if (passwordController.text != confirmPasswordController.text) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Passwords do not match')));
      }
      return;
    }

    // try creating user
    try {
      await authService.signUpWithEmailAndPassword(
        emailController.text,
        passwordController.text,
        usernameController.text,
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
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
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.sizeOf(context).height,
          ),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
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

                // username input
                MyTextField(
                  hintText: 'Username',
                  isPassword: false,
                  controller: usernameController,
                ),

                SizedBox(height: 10),

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

                // confirm password input
                MyTextField(
                  hintText: 'Confirm Password',
                  isPassword: true,
                  controller: confirmPasswordController,
                ),

                SizedBox(height: 25),

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

                // register button
                MyButton(text: 'Register', onTap: register),

                SizedBox(height: 25),

                // already have an account? login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Login Here",
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
      ),
    );
  }
}
