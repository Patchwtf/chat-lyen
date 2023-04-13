import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class ProfileProperties {
  String Role = "";

  String getProfileUID() {
    return FirebaseAuth.instance.currentUser!.uid.toString();
  }

  Future getProfileRole() async {
    String userUID = ProfileProperties().getProfileUID();
    DatabaseReference ref = FirebaseDatabase.instance.ref("usuario/$userUID");
    DatabaseEvent event = await ref.once();
    Role = event.snapshot.child("role").value.toString();
    return event.snapshot.child("role").value.toString();
  }
}
