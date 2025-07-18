import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_chat_me/core/theme.dart';
import 'package:new_chat_me/features/auth/presentation/widgets/auth_input_field.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/auth_button.dart';
import '../widgets/login_prompt.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  void _showInputValues() {
    String name = _emailController.text;

    String password = _passwordController.text;
    print("Username: $name , Password: $password");
  }

  void _onLogin() {
    BlocProvider.of<AuthBloc>(context).add(LoginEvent(
        email: _emailController.text, password: _passwordController.text));
  }

  @override
  void dispose() {
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
              AuthInputField(
                  hint: "Email",
                  icon: Icons.person,
                  controller: _emailController),
              AuthInputField(
                hint: "Password",
                icon: Icons.person,
                controller: _passwordController,
                isPassword: true,
              ),
              BlocConsumer<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return AuthButton(text: "Login", onPressed: _onLogin);
                },
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    Navigator.pushNamed(context, '/Register');
                  } else if (state is AuthFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.error),
                    ));
                  }
                },
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
