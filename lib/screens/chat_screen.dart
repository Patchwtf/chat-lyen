import 'package:chat_lyen/models/messages_constructor.dart';
import 'package:chat_lyen/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final prueba = <Messages_Const>[
      Messages_Const(
          message: 'Buen Día Juan',
          receptorUid: 'Juan',
          remitentUid: 'Memo',
          fecha: DateTime.now()),
      Messages_Const(
          message: 'Hola Memo Como Estas?',
          receptorUid: 'Meno',
          remitentUid: 'Juan',
          fecha: DateTime.now()),
      Messages_Const(
          message: 'Para que soy bueno?',
          receptorUid: 'Meno',
          remitentUid: 'Juan',
          fecha: DateTime.now()),
      Messages_Const(
          message:
              'Aqui Nomas Jalando, Ya sabes como es esto. \n En fin solo te queria saludar',
          receptorUid: 'Juan',
          remitentUid: 'Memo',
          fecha: DateTime.now()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat con XXXX"),
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ...prueba.map((e) => MessageCard(
                        userName: e.remitentUid,
                        message: e.message,
                        dateTime:
                            "${DateFormat.jms().format(e.fecha)}\n ${DateFormat.yMd().format(e.fecha)}",
                        // "${e.fecha.hour.toString()}:${e.fecha.minute.toString()}:${e.fecha.second.toString()}",
                        mainAxisAlignment: e.remitentUid == 'Juan'
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
