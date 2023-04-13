import 'dart:io';

import 'package:chat_lyen/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login {
  registerNewUser(
      {required String email,
      required String password,
      required String name,
      required String role,
      required String enterprise,
      required BuildContext context}) async {
    final credential = FirebaseAuth.instance;
    try {
      await credential.createUserWithEmailAndPassword(
          email: email, password: password);
      //update data
      credential.currentUser!.updateDisplayName(name);
      // await credential.currentUser!.updatePhoneNumber(phoneNumber);

      credential.currentUser!.sendEmailVerification();

      final newPostKey = credential.currentUser!.uid.toString();

      DatabaseReference ref =
          FirebaseDatabase.instance.ref("usuario/$newPostKey");
      await ref.set({
        "nombre": name,
        "empresa": enterprise,
        "role": role,
        "email": email
      });
      credential.signOut();
      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(
          context, 'login', ModalRoute.withName('/'));
    } on FirebaseAuthException catch (e) {
      String description = "", codigo = "";

      switch (e.code) {
        case "email-already-in-use":
          codigo = "Correo en uso";
          description = "El correo que desea ingresar se encuentra en uso";
          break;
        case "invalid-email":
          codigo = "Correo Invalido";
          description = "Ingrese un correo válido";
          break;
        case "operation-not-allowed":
          codigo = "Servicios no disponibles";
          description = "operation-not-allowed";
          break;
        case "weak-password":
          codigo = "Contraseña insegura";
          description =
              "La contraseña es muy insegura, pruebe agregando mas caracteres";
          break;
      }

      return Platform.isAndroid
          ? showDialog(
              context: context,
              builder: (context) => alertDialogAndroid(
                  tittle: "Error: $codigo", description: description))
          : showCupertinoDialog(
              context: context,
              builder: (context) => alertDialogAndroid(
                  tittle: "Error: $codigo", description: description));
    }
  }

  loginUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      final credential = FirebaseAuth.instance;
      await credential.signInWithEmailAndPassword(
          email: email, password: password);
      if (credential.currentUser!.emailVerified == false) {
        credential.currentUser?.sendEmailVerification();
        credential.signOut();
        // ignore: use_build_context_synchronously
        return Platform.isAndroid
            // ignore: use_build_context_synchronously
            ? showDialog(
                context: context,
                builder: (context) => alertDialogAndroid(
                    tittle: "Usuario sin verificar",
                    description: "Se envió a su correo para la verificación"))
            // ignore: use_build_context_synchronously
            : showCupertinoDialog(
                context: context,
                builder: (context) => alertDialogAndroid(
                    tittle: "Usuario sin verificar",
                    description: "Se envió a su correo para la verificación"));
      }
      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(
          context, 'home', ModalRoute.withName('/'));
    } on FirebaseAuthException catch (e) {
      String description = "", codigo = "";

      switch (e.code) {
        case "user-disabled:":
          codigo = "Usuario Deshabilitado";
          description =
              "El usuario con el que desea entrar ha sido deshabilitado. Contacto a su proveedor de servicios";
          break;
        case "invalid-email":
          codigo = "Correo Invalido";
          description = "Ingrese un correo válido";
          break;
        case "operation-not-allowed":
          codigo = "Usuario no encontrado";
          description = "El usuario con el que trata de ingresar no existe";
          break;
        case "wrong-password":
          codigo = "Contraseña erroena";
          description =
              "La contraseña que a ingresado no concuerda con la registrada o el usuario con el que intenta ingresar no existe";
          break;
        default:
          codigo = "Servicios no disponibles";
          description =
              "Servicios no disponibles actualmente, intente mas tarde";
          break;
      }

      return Platform.isAndroid
          ? showDialog(
              context: context,
              builder: (context) => alertDialogAndroid(
                  tittle: "Error: $codigo", description: description))
          : showCupertinoDialog(
              context: context,
              builder: (context) => alertDialogAndroid(
                  tittle: "Error: $codigo", description: description));
    }
  }

  // ignore: non_constant_identifier_names
  SignOut({required BuildContext context}) {
    FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(
        context, 'init', ModalRoute.withName('/'));
  }
}


// ! DOCUMENT

//! TODO: Borrar

// final ref = FirebaseDatabase.instance.ref();
                    // final snapshot = await ref.child('usuario/').get();
                    // if (snapshot.exists) {
                    //   if (snapshot.child("nombre") == "ñ") {}
                    //   print(snapshot.value);
                    // } else {
                    //   print('No data available.');
                    // }