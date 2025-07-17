import 'package:flutter/material.dart';
import 'package:new_chat_me/core/theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  void _showInputValues() {
    String name = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    print("Username: $name , Password: $password, Email: $email");
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
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
              _buildTextInput("Username", Icons.person, _usernameController),
              _buildTextInput("Email", Icons.person, _emailController),
              _buildTextInput("Password", Icons.person, _passwordController,
                  isPassword: true),
              _buildRegisterButton(),
              _buildLoginPrompt(),
            ],
          ),
        ),
      ),
    );
  }

  _buildTextInput(String hint, IconData icon, TextEditingController controller,
      {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: DefaultColors.sentMessageInput,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: isPassword,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterButton() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: _showInputValues,
        style: ElevatedButton.styleFrom(
            backgroundColor: DefaultColors.buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15)),
        child: const Text(
          "Register",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildLoginPrompt() {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: RichText(
          text: const TextSpan(
              text: "Already have an account?",
              style: TextStyle(color: Colors.grey),
              children: [
                TextSpan(
                    text: "Click here to login",
                    style: TextStyle(color: Colors.blue))
              ]),
        ),
      ),
    );
  }
}
