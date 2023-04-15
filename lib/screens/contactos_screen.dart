import 'package:chat_lyen/models/models.dart';
import 'package:chat_lyen/screens/chat_screen.dart';
import 'package:flutter/material.dart';

import '../functions/functions.dart';
import '../widgets/widgets.dart';

// ignore: must_be_immutable
class ContactosScreen extends StatefulWidget {
  const ContactosScreen({Key? key, required this.contactos}) : super(key: key);
  final List<String> contactos;

  @override
  State<ContactosScreen> createState() => _ContactosScreenState();
}

class _ContactosScreenState extends State<ContactosScreen> {
  ContactosAndMessages cam = ContactosAndMessages();

  List<ContacsMod> listaContactos = [];

  void obtenerContactos() async {
    listaContactos = await cam.getContacts(widget.contactos);
    if (super.mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    obtenerContactos();

    listaContactos.removeWhere(
        (element) => element.uid == ProfileProperties().getProfileUID());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contactos"),
        actions: [
          IconButton(
              onPressed: () => setState(() {
                    print(listaContactos[0].uid);
                  }),
              icon: const Icon(Icons.arrow_circle_down))
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: listaContactos.length,
            itemBuilder: (BuildContext context, int index) {
              return ContacCard(
                listaContactos: listaContactos,
                email: listaContactos[index].email,
                empresa: listaContactos[index].empresa,
                nombre: listaContactos[index].name,
                role: listaContactos[index].role,
                uid: listaContactos[index].uid,
              );
            },
          ),
        ),
      ),
    );
  }
}
