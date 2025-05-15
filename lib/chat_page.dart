import 'package:chat_apps/widgets/chat_bubble.dart';
import 'package:chat_apps/widgets/chat_input.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Hi Bro!'),
        actions: [
          IconButton(
            onPressed: () {
              print('Icon pressed!');
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          // Expanded widget should wrap ListView to ensure it takes available space
          Expanded(
            child: ListView(
              children: [
            ChatBubble(alignment: Alignment.centerLeft,message: "Hi bro!"),
                ChatBubble(alignment: Alignment.centerRight, message: "wassup"),

              ],
            ),
          ),
          ChatInput(),
        ],
      ),
    );
  }
}
