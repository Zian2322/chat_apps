import 'dart:convert';
import 'package:chat_apps/models/chat_message_entity.dart';
import 'package:chat_apps/widgets/chat_bubble.dart';
import 'package:chat_apps/widgets/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatMessageEntity> _messages = []; // removed 'final'

  Future<void> _loadInitialMessages() async {
    rootBundle.loadString('assets/mock_messages.json').then((response){

      final List<dynamic> decodedList = jsonDecode(response) as List;

      final List<ChatMessageEntity> chatMessages = decodedList.map((item) {
        return ChatMessageEntity.fromJson(item);
      }).toList();

      print(chatMessages.length);

      setState(() {
        _messages = chatMessages;
      });
    }).then((_){
      print('done');
    });

    print('Something')
  }

  onMessageSent(ChatMessageEntity entity){
    _messages.add(entity);
    setState(() {

    });
  }
  @override
  void initState() {
    super.initState();
    _loadInitialMessages();
  }

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
          ChatInput(onSubmit: onMessageSent),
        ],
      ),
    );
  }
}
