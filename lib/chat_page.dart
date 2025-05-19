import 'package:chat_apps/models/chat_message_entity.dart';
import 'package:chat_apps/widgets/chat_bubble.dart';
import 'package:chat_apps/widgets/chat_input.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);

  final List<ChatMessageEntity> _messages = [
    ChatMessageEntity(
      text: 'First text',
      id: '1',
      createdAt: 2131231442,
      author: Author(userName: 'mark45'),
    ),
    ChatMessageEntity(
      text: 'Second text',
      id: '2',
      createdAt: 2131231443,
      author: Author(userName: 'jane'),
    ),
    ChatMessageEntity(
      text: 'Third text',
      id: '3',
      createdAt: 2131231444,
      author: Author(userName: 'mark45'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Hi $username!'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
              print('Icon pressed!');
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ChatBubble(
                  alignment: _messages[index].author.userName == 'mark45'
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  entity: _messages[index],
                );
              },
            ),
          ),
          ChatInput(),
        ],
      ),
    );
  }
}
