import 'package:flutter/material.dart';

import '../functions/functions.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class ProjectAdminScreen extends StatefulWidget {
  const ProjectAdminScreen({Key? key}) : super(key: key);

  @override
  State<ProjectAdminScreen> createState() => _ProjectAdminScreenState();
}

class _ProjectAdminScreenState extends State<ProjectAdminScreen> {
  ProjectManager pm = ProjectManager();
  List<ProjectsProperties> projectList = [];
  obtenerLista() async {
    projectList = await pm.getProjectsListTwo();
    if (super.mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    obtenerLista();

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: projectList.length,
          itemBuilder: (context, index) {
            return !projectList[index]
                    .employeesUID
                    .contains(ProfileProperties().getProfileUID())
                ? ProjectActionCard(
                    projectName: projectList[index].projectName,
                    projectDescription: projectList[index].projectDescription,
                    projectStartDate: projectList[index].projectStartDate,
                    projectUID: projectList[index].projectID,
                    employeesUID: projectList[index].employeesUID,
                    projectStatus: projectList[index].status,
                  )
                : const SizedBox(height: 2);
          },
        ),
      ),
    );
  }
}
