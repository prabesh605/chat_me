import 'package:flutter/material.dart';
import 'package:new_chat_me/chat_page.dart';
import 'package:new_chat_me/core/theme.dart';
import 'package:new_chat_me/login_page.dart';
import 'package:new_chat_me/message_page.dart';
import 'package:new_chat_me/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const LoginPage(),
    );
  }
}
