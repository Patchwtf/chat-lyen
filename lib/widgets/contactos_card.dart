import 'package:flutter/material.dart';

import '../functions/functions.dart';
import '../models/models.dart';
import '../screens/screens.dart';

class ContacCard extends StatelessWidget {
  const ContacCard({
    super.key,
    required this.listaContactos,
    required this.nombre,
    required this.empresa,
    required this.email,
    required this.role,
    required this.uid,
  });

  final String nombre;
  final String empresa;
  final String email;
  final String role;
  final String uid;

  final List<ContacsMod> listaContactos;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(nombre),
                Text(empresa),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(email),
                Text(role),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () async {
                  String idConversation;
                  ContactosAndMessages cam = ContactosAndMessages();
                  idConversation = await cam.inChat(uid);
                  // ignore: use_build_context_synchronously
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ChatScreen(conversationID: idConversation)));
                },
                child: const Text("Entrar a la conversación")),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
