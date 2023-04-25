// ignore_for_file: use_build_context_synchronously
import 'dart:io';

import 'package:chat_lyen/functions/functions.dart';
import 'package:chat_lyen/models/models.dart';
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
        "status": "Abierto"
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

// ! TODO: Borrar si no se ocupa
  Map<String, Map> projectsProperties = {};

  final List<ProjectsProperties> projectPropertiesList = <ProjectsProperties>[];

//¡ Prueba de FUture
  Future<List<ProjectsProperties>> getProjectsListTwo() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("proyecto");
    DatabaseEvent event = await ref.once();
    List<ProjectsProperties> projectListTest = [];
    for (var value in event.snapshot.children) {
      String projectID = value.key.toString();
      String description = value.child("description").value.toString();
      String customerUID = value.child("customerUID").value.toString();
      String fechaInicio = value.child("fecha-inicio").value.toString();
      String nombre = value.child("nombre").value.toString();
      String status = value.child("status").value.toString();
      List employeesUID = [];

      for (var employee in value.child("employeesUID").children) {
        if (employee.value == true) {
          employeesUID.add(employee.key);
        }
      }
      projectListTest.add(
        ProjectsProperties(
            projectID: projectID,
            status: status,
            projectName: nombre,
            projectDescription: description,
            projectStartDate: fechaInicio,
            customerUID: customerUID,
            employeesUID: employeesUID),
      );
    }

    return projectListTest;
  }

  Future getProjectsList() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("proyecto");
// DatabaseReference child = ref.child("-NSFSmU4y1CJNZrIseU7");
    // print(child.key);
    DatabaseEvent event = await ref.once();
    projectPropertiesList.clear();
    for (var value in event.snapshot.children) {
      String projectID = value.key.toString();
      String description = value.child("description").value.toString();
      String customerUID = value.child("customerUID").value.toString();
      String fechaInicio = value.child("fecha-inicio").value.toString();
      String nombre = value.child("nombre").value.toString();
      String status = value.child("status").value.toString();

      List employeesUID = [];

      for (var employee in value.child("employeesUID").children) {
        if (employee.value == true) {
          employeesUID.add(employee.key);
        }
      }

      projectsProperties.addAll({
        projectID: {
          "projectName": nombre,
          "projectDescription": description,
          "projectStartDate": fechaInicio,
          "customerUID": customerUID,
          "employeesUID": employeesUID,
          "status": status
        }
      });
      projectPropertiesList.add(
        ProjectsProperties(
            projectID: projectID,
            status: status,
            projectName: nombre,
            projectDescription: description,
            projectStartDate: fechaInicio,
            customerUID: customerUID,
            employeesUID: employeesUID),
      );
    }
  }

  addPersonToProject(String projectID) async {
    String personUID = ProfileProperties().getProfileUID();
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("proyecto/$projectID/employeesUID");
    DatabaseEvent evento = await ref.once();

    Map<String?, bool?> datos = {};

    for (var elemento in evento.snapshot.children) {
      // ignore: sdk_version_since

      // ignore: sdk_version_since
      datos.addAll({elemento.key: bool.tryParse(elemento.value.toString())});
    }
    if (datos.containsKey(personUID)) {
      ref.update({personUID: true});
    } else {
      datos.addAll({personUID: true});
      await ref.set(datos);
    }
  }

  deletePersonToProject(String projectID) {
    String personUID = ProfileProperties().getProfileUID();
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("proyecto/$projectID/employeesUID");
    ref.update({personUID: false});
  }

  deleteProject(String projectUID) {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("proyecto/$projectUID");
    ref.update({"status": "Cerrado"});
  }

  adminProject() {}
}

class AdminProject extends ProjectManager {}
