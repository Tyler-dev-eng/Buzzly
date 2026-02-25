import 'package:buzzly/components/my_button.dart';
import 'package:buzzly/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final VoidCallback onTap;

  RegisterPage({super.key, required this.onTap});

  void register() {
    debugPrint('Register button pressed');
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
                controller: TextEditingController(),
              ),

              SizedBox(height: 10),

              // password input
              MyTextField(
                hintText: 'Password',
                isPassword: true,
                controller: TextEditingController(),
              ),

              SizedBox(height: 10),

              // confirm password input
              MyTextField(
                hintText: 'Confirm Password',
                isPassword: true,
                controller: TextEditingController(),
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
                    onTap: onTap,
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
    );
  }
}
