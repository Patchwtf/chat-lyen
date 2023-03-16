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
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

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
    final ColorScheme colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat con XXXX"),
      ),
      body: SizedBox(
        // decoration: const BoxDecoration(color: Colors.blueGrey),
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: ListView(
                  children: [
                    ...prueba.map((e) => MessageCard(
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
            Form(
              key: myFormKey,
              child: Container(
                height: 50,
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: '',
                        onChanged: (value) {},
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            isDense: false),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {},
                      splashColor: Colors.blueGrey,
                      splashRadius: 25,
                      style: IconButton.styleFrom(
                        foregroundColor: colors.onPrimary,
                        backgroundColor: colors.primary,
                        disabledBackgroundColor:
                            colors.onSurface.withOpacity(0.12),
                        hoverColor: colors.onPrimary.withOpacity(0.08),
                        focusColor: colors.onPrimary.withOpacity(0.12),
                        highlightColor: colors.onPrimary.withOpacity(0.12),
                      ),
                      icon: const Icon(Icons.send),
                    )
                    // IconButton(
                    //   splashColor: Colors.blueGrey,
                    //   splashRadius: 25,
                    //   onPressed: () {
                    //     FocusScope.of(context).requestFocus(FocusNode());
                    //   },
                    //   icon: const Icon(
                    //     Icons.send,
                    //     color: Colors.black,
                    //   ),
                    // )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
