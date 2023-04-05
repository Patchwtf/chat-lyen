import 'package:chat_lyen/functions/functions.dart';
import 'package:chat_lyen/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProjectRegisterScreen extends StatefulWidget {
  const ProjectRegisterScreen({Key? key}) : super(key: key);

  @override
  State<ProjectRegisterScreen> createState() => _ProjectRegisterScreenState();
}

class _ProjectRegisterScreenState extends State<ProjectRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _myFormKey = GlobalKey<FormState>();
    String fecha = DateFormat('yyyy/MM/dd').format(DateTime.now());

    final Map<String, String> formValues = {
      'project-name': '',
      'project-description': '',
      'start-date': fecha,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Registro de Proyectos"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Image(
                  image: AssetImage("assets/lyen-logo.png"), height: 100),
              const SizedBox(height: 30),
              Form(
                key: _myFormKey,
                child: Column(
                  children: [
                    CustomInputField(
                        formProperty: 'project-name',
                        formValues: formValues,
                        labelText: 'Nombre del proyecto',
                        icon: Icons.manage_search,
                        validator: (value) => value!.length < 3
                            ? "EL valor debe de ser mas de 3 letras"
                            : null),
                    CustomInputField(
                        formProperty: 'project-description',
                        formValues: formValues,
                        labelText: 'Descripción del proyecto',
                        icon: Icons.description,
                        validator: (value) => value!.length < 3
                            ? "EL valor debe de ser mas de 3 letras"
                            : null),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Icon(
                          Icons.date_range,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: InputDatePickerFormField(
                              fieldLabelText: "Fecha de inicio",
                              onDateSaved: (date) {
                                fecha = DateFormat('yyyy/MM/dd').format(date);
                              },
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now()
                                  .add(const Duration(days: 1000)),
                              errorFormatText: "Error de formato",
                              initialDate: DateTime.now()),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  _myFormKey.currentState!.save();
                  if (!_myFormKey.currentState!.validate()) {
                    return;
                  }
                  ProjectManager pm = ProjectManager();
                  pm.registerProject(
                      name: formValues['project-name']!,
                      description: formValues['project-description']!,
                      startDate: formValues['start-date']!,
                      context: context);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Registrar'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
