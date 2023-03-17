import 'package:chat_lyen/models/models.dart';
import 'package:chat_lyen/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageController = TextEditingController();
  @override
  void dispose() {
    // Limpia el controlador cuando el widget se elimine del árbol de widgets
    messageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: Colors.blueAccent,
      shape: const CircleBorder(),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat con XXXX"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.blueGrey),
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: ListView(
                  children: [
                    ...Messages.messages_hist.map((e) => MessageCard(
                          userName: e.remitentUid,
                          message: e.message,
                          dateTime:
                              "${DateFormat.jms().format(e.fecha)}\n ${DateFormat.yMd().format(e.fecha)}",
                          mainAxisAlignment: e.remitentUid == 'Juan'
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                        ))
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: messageController,
                      onChanged: (value) {},
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        fillColor: Color.fromRGBO(41, 88, 112, 1),
                      ),
                      textAlignVertical: TextAlignVertical.bottom,
                      maxLines: 2,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (messageController.text != "") {
                        FocusScope.of(context).requestFocus(FocusNode());
                        Messages.messages_hist.add(Messages_Const(
                            fecha: DateTime.now(),
                            message: messageController.text,
                            receptorUid: 'Memo',
                            remitentUid: 'Juan'));
                        messageController.clear();
                        setState(() {});
                      }
                    },
                    style: style,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.send),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
