import 'package:chat_apps/chat_page.dart';
import 'dart:ui';
import 'package:chat_apps/login_page.dart';
import 'package:chat_apps/services/auth_service.dart';
import 'package:chat_apps/utils/brand_color.dart';
import 'package:chat_apps/widgets/counter_stateful_demo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.init();
  runApp(ChangeNotifierProvider(create: (BuildContext context) => AuthService(),
  child: const ChatApp(),
  ));
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat App!!!!", 
      theme: ThemeData(
          canvasColor: Colors.transparent,
        primarySwatch: BrandColor.primaryColor,appBarTheme: AppBarTheme(backgroundColor: Colors.blue, foregroundColor: Colors.black)
      ),
      home: LoginPage(),
      routes: {'/chat': (context) => ChatPage()},
    );
  }
}