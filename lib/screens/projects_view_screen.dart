import 'package:chat_lyen/functions/functions.dart';
import 'package:chat_lyen/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProjectViewScreen extends StatefulWidget {
  const ProjectViewScreen({Key? key}) : super(key: key);

  @override
  State<ProjectViewScreen> createState() => _ProjectViewScreenState();
}

class _ProjectViewScreenState extends State<ProjectViewScreen> {
  ProjectManager pm = ProjectManager();

  @override
  Widget build(BuildContext context) {
    pm.getProjectsList();
    final projectList = pm.projectPropertiesList;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Listado de proyectos"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.replay_rounded))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: projectList.length,
          itemBuilder: (context, index) {
            return projectList[index]
                    .employeesUID
                    .contains(ProfileProperties().getProfileUID())
                ? ProjectListCard(
                    projectName: projectList[index].projectName,
                    projectDescription: projectList[index].projectDescription,
                    projectStartDate: projectList[index].projectStartDate,
                    projectUID: projectList[index].projectID,
                    employeesUID: projectList[index].employeesUID,
                    projectStatus: projectList[index].status,
                  )
                : const SizedBox(height: 1);
          },
        ),
      ),
    );
  }
}
