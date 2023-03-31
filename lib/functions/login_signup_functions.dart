import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login {
  registerNewUser(
      {required String email,
      required String password,
      required String name,
      required String role,
      required String enterprise,
      required BuildContext context}) async {
    try {
      final credential = FirebaseAuth.instance;
      await credential.createUserWithEmailAndPassword(
          email: email, password: password);
      credential.currentUser!.updateDisplayName(name);
      // await credential.currentUser!.updatePhoneNumber(phoneNumber);
      if (role == "proveeder") {
        credential.currentUser!.sendEmailVerification();
      }
      credential.signOut();

      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(
          context, 'login', ModalRoute.withName('/'));
    } catch (e) {
      print(e);
    }
  }

  login({required String email, required String password}) async {
    final credential = FirebaseAuth.instance;
    try {
      await credential.signInWithEmailAndPassword(
          email: email, password: password);
      if (credential.currentUser!.emailVerified == false) {
        credential.signOut();
      }
    } catch (e) {
      print(e);
    }
  }
}
