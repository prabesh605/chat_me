import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_chat_me/core/theme.dart';
import 'package:new_chat_me/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:new_chat_me/features/auth/presentation/bloc/auth_event.dart';
import 'package:new_chat_me/features/auth/presentation/bloc/auth_state.dart';
import 'package:new_chat_me/features/auth/presentation/widgets/auth_button.dart';
import 'package:new_chat_me/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:new_chat_me/features/auth/presentation/widgets/login_prompt.dart';

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

  void _onRegister() {
    BlocProvider.of<AuthBloc>(context).add(RegisterEvent(
        username: _usernameController.text,
        email: _emailController.text,
        password: _passwordController.text));
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
              AuthInputField(
                  hint: "Username",
                  icon: Icons.person,
                  controller: _usernameController),
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
              BlocConsumer<AuthBloc, AuthState>(builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return AuthButton(text: "Register", onPressed: _onRegister);
              }, listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.pushNamed(context, '/login');
                } else if (state is AuthFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.error),
                  ));
                }
              }),
              LoginPrompt(
                title: "Already have an account",
                subtitle: "Click here to login",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
