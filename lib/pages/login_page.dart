import 'package:buzzly/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginPage({super.key});

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

              // forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),

              // sign in button

              // dont have an account? sign up
            ],
          ),
        ),
      ),
    );
  }
}
