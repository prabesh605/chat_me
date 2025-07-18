import 'package:flutter/material.dart';
import 'package:new_chat_me/core/theme.dart';
import 'package:new_chat_me/features/auth/presentation/widgets/auth_input_field.dart';

import '../widgets/auth_button.dart';
import '../widgets/login_prompt.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  void _showInputValues() {
    String name = _usernameController.text;

    String password = _passwordController.text;
    print("Username: $name , Password: $password");
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AuthInputField(
                  hint: "Username",
                  icon: Icons.person,
                  controller: _usernameController),
              AuthInputField(
                hint: "Password",
                icon: Icons.person,
                controller: _passwordController,
                isPassword: true,
              ),
              AuthButton(
                text: "Login",
                onPressed: () {},
              ),
              LoginPrompt(
                title: "Don't have an account?",
                subtitle: "Click here to register",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
