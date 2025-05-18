import 'package:chat_apps/chat_page.dart';
import 'package:chat_apps/login_page.dart';
import 'package:chat_apps/widgets/counter_stateful_demo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat App!!!!",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: ChatPage(),
    );
  }
}