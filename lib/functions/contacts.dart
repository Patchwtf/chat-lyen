import 'package:chat_lyen/functions/functions.dart';
import 'package:chat_lyen/models/models.dart';
import 'package:firebase_database/firebase_database.dart';

class ContactosAndMessages {
  Future<List<ContacsMod>> getContacts(List<String> employeesUID) async {
    List<ContacsMod> tempEmployees = [];
    for (var uid in employeesUID) {
      DatabaseReference ref = FirebaseDatabase.instance.ref("usuario/$uid");
      DatabaseEvent evento = await ref.once();
      DataSnapshot valor = evento.snapshot;

      if (valor.exists) {
        tempEmployees.add(ContacsMod(
            name: valor.child("nombre").value.toString(),
            uid: valor.key.toString(),
            email: valor.child("email").value.toString(),
            role: valor.child("role").value.toString(),
            empresa: valor.child("empresa").value.toString()));
      }
    }
    return tempEmployees;
  }

  Future<String> inChat(String uid) async {
    String personUID = ProfileProperties().getProfileUID();
    DatabaseReference ref =
        FirebaseDatabase.instance.ref('usuario/$personUID/conversationID');
    DatabaseEvent evento = await ref.once();
    bool flag = false;
    String conversationUID = "";

    if (evento.snapshot.children.isNotEmpty) {
      for (var chatID in evento.snapshot.children) {
        if (chatID.hasChild(uid)) {
          conversationUID = chatID.key.toString();
          flag = true;
          break;
        }
      }
      if (!flag) {
        DatabaseReference refTwo =
            FirebaseDatabase.instance.ref('usuario/$uid/conversationID');
        final newPostKey = ref.push().key;
        conversationUID = newPostKey.toString();
        ref.child(newPostKey!).set({uid: true});
        refTwo.child(newPostKey).set({personUID: true});
      }
    }
    return conversationUID;
  }

//! TODO: Eliminar metodo
  List<Messages_Const> getChats(String conversationID) {
    DatabaseReference starCountRef =
        FirebaseDatabase.instance.ref('chat-hist/$conversationID');
    List<Messages_Const> tempList = [];

    starCountRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot;
      for (var valor in data.children) {
        tempList.add(Messages_Const(
            message: valor.child("message").value.toString(),
            receptorUid: "receptorUid",
            remitentUid: "remitentUid",
            fecha: DateTime.now()));
      }
    });
    return tempList;
  }

  void sendMessage(String conversationID, String message, String remitentUID,
      String senderUID, String timeStamp) {
    DatabaseReference conversation =
        FirebaseDatabase.instance.ref('chat-hist/$conversationID');
    conversation.push().set({
      "message": message,
      "remitendUID": remitentUID,
      "senderUID": senderUID,
      "timeStamp": timeStamp,
    });
  }
}
