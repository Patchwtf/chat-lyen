import 'package:chat_lyen/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat con XXXX"),
      ),
      body: const Center(
          child: Column(
        children: [
          MessageCard(
              userName: 'Yo', message: "I'm Batman", dateTime: '07:58 p.m.'),
          MessageCard(
              userName: 'Yo', message: "I'm Batman", dateTime: '07:58 p.m.')
        ],
      )),
    );
  }
}
