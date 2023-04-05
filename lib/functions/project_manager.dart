// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:chat_lyen/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectManager {
  registerProject(
      {required String name,
      required String description,
      required String startDate,
      required BuildContext context}) async {
    try {
      final newPostKey =
          FirebaseDatabase.instance.ref().child('posts').push().key;
      final customerUID = FirebaseAuth.instance.currentUser!.uid;
      DatabaseReference ref =
          FirebaseDatabase.instance.ref("proyecto/$newPostKey");
      await ref.set({
        "nombre": name,
        "description": description,
        "fecha-inicio": startDate,
        "customerUID": customerUID,
        "status": "open"
      });
      ref = FirebaseDatabase.instance.ref("proyecto/$newPostKey/employeesUID");
      await ref.set({customerUID: true});

      return Platform.isAndroid
          ? showDialog(
              context: context,
              builder: (context) => alertDialogAndroid(
                  tittle: "Registro Exitoso",
                  description: "Proyecto registrado con exito"))
          : showCupertinoDialog(
              context: context,
              builder: (context) => alertDialogCupertino(
                  tittle: "Registro Exitoso",
                  description: "Proyecto registrado con exito"));
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }

  getProjectsList() {}

  adminProject() {}
  addPersonToProject() {}
  deletePersonToProject() {}
}

class AdminProject extends ProjectManager {}
