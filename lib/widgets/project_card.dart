// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:chat_lyen/functions/functions.dart';
import 'package:chat_lyen/screens/screens.dart';
import 'package:chat_lyen/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProjectListCard extends StatelessWidget {
  ProjectListCard(
      {super.key,
      required this.projectName,
      required this.projectDescription,
      required this.projectStartDate,
      required this.projectUID,
      required this.employeesUID,
      required this.projectStatus});

  ProfileProperties pp = ProfileProperties();
  String projectName;
  String projectDescription;
  String projectStartDate;
  String projectUID;
  String projectStatus;
  List employeesUID;
  String rol = "";
  String buttonText = "";

  obtenerRol() async {
    rol = await pp.getProfileRole();
  }

  @override
  Widget build(BuildContext context) {
    Color color = projectStatus == "Abierto" ? Colors.red : Colors.grey;
    obtenerRol();

    return Row(
      children: [
        Expanded(
          child: Card(
            child: Container(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Text(
                        projectName,
                        style: const TextStyle(fontSize: 20),
                      )
                    ]),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            projectDescription,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Status del proyecto: $projectStatus"),
                        Text(
                          projectStartDate,
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(children: [
                      Expanded(
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(color)),
                              onPressed: projectStatus == "Abierto"
                                  ? () {
                                      String tittle, description;

                                      ProjectManager pm = ProjectManager();

                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            if (rol == "Cliente") {
                                              buttonText = "Finalizar proyecto";
                                              tittle = "Finalizar proyecto";
                                              description =
                                                  "¿Esta seguro que desea finalizar el proyecto?";
                                            } else {
                                              buttonText =
                                                  "Eliminarse del proyecto";
                                              tittle =
                                                  "Eliminarse del proyecto";
                                              description =
                                                  "¿Desea eliminar su acceso a los contactos del proyecto?";
                                            }
                                            return Platform.isAndroid
                                                ? alertDialogAndroidYN(
                                                    tittle: tittle,
                                                    description: description,
                                                    funcion: rol == "Cliente"
                                                        ? pm.deleteProject(
                                                            projectUID)
                                                        : pm.deletePersonToProject(
                                                            projectUID),
                                                  )
                                                : alertDialogCupertinoYN(
                                                    tittle: tittle,
                                                    description: description,
                                                    funcion: rol == "Cliente"
                                                        ? pm.deleteProject(
                                                            projectUID)
                                                        : pm.deletePersonToProject(
                                                            projectUID),
                                                  );
                                          });
                                    }
                                  : null,
                              child: rol == "Cliente"
                                  ? const Text("Finalizar proyecto")
                                  : const Text("Eliminarse del proyecto"))),
                      const SizedBox(width: 10),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                print(ProfileProperties()
                                    .getProfileUID()
                                    .toString());
                                final List<String> employeesUIDs = employeesUID
                                    .map((e) => e.toString())
                                    .toList();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ContactosScreen(
                                              contactos: employeesUIDs,
                                            )));
                              },
                              child:
                                  const Text("Visualizar Lista de Contactos")))
                    ])
                  ],
                )),
          ),
        ),
      ],
    );
  }
}

class ProjectActionCard extends StatelessWidget {
  ProjectActionCard(
      {super.key,
      required this.projectName,
      required this.projectDescription,
      required this.projectStartDate,
      required this.projectUID,
      required this.employeesUID,
      required this.projectStatus});

  String projectName;
  String projectDescription;
  String projectStartDate;
  String projectUID;
  String projectStatus;
  List employeesUID;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            child: Container(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Text(
                        projectName,
                        style: const TextStyle(fontSize: 20),
                      )
                    ]),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            projectDescription,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Status del proyecto: $projectStatus"),
                        Text(
                          projectStartDate,
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(children: [
                      Expanded(
                          child: ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.red)),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Platform.isAndroid
                                          ? alertDialogAndroidYN(
                                              tittle: "Añadirse al proyecto",
                                              description:
                                                  "¿Desea agregar este proyecto a su lista?\n La lista de contactos del proyecto estará disponible para usted",
                                              funcion: () {
                                                ProjectManager pm =
                                                    ProjectManager();
                                                pm.addPersonToProject(
                                                    projectUID);
                                                Navigator.pop(context);
                                              },
                                            )
                                          : alertDialogCupertinoYN(
                                              tittle: "Añadirse al proyecto",
                                              description:
                                                  "¿Desea agregar este proyecto a su lista?\n La lista de contactos del proyecto estará disponible para usted",
                                              funcion: () {
                                                ProjectManager pm =
                                                    ProjectManager();
                                                pm.addPersonToProject(
                                                    projectUID);
                                                Navigator.pop(context);
                                              });
                                    });
                              },
                              child: const Text("Añadirse al proyecto"))),
                      const SizedBox(width: 10),
                    ])
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
