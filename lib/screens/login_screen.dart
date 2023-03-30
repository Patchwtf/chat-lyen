import 'package:chat_lyen/functions/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Login login = Login();

                  login.login(
                      email: 'fapcw664sl@dishcatfish.com',
                      password: 'test12345');
                },
                child: Text("Inicio Sesion")),
            ElevatedButton(
                onPressed: () {
                  print(FirebaseAuth.instance
                      .authStateChanges()
                      .listen((User? user) {
                    if (user == null) {
                      print('User is currently signed out!');
                    } else {
                      print('User is signed in!\n ${user.displayName}');
                    }
                  }));
                  FirebaseAuth.instance.signOut();
                },
                child: Text("Inicio Sesion"))
          ],
        ),
      ),
    );
  }
}
