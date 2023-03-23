import 'package:chat_lyen/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';

class ProjectRegisterScreen extends StatelessWidget {
  const ProjectRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'project-name': '',
      'project-description': '',
      'start-date': '',
      'customer-uid': '',
    };
    TextEditingController dateTextController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registro de Proyectos"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: myFormKey,
            child: Column(
              children: [
                CustomInputField(
                    formProperty: 'project-name',
                    formValues: formValues,
                    labelText: 'Nombre del proyecto',
                    icon: Icons.manage_search),
                CustomInputField(
                  formProperty: 'project-description',
                  formValues: formValues,
                  labelText: 'Descripción del proyecto',
                  icon: Icons.description,
                ),
                DateFormField(
                    dateTextController: dateTextController,
                    formValues: formValues),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (!myFormKey.currentState!.validate()) {
                        print('Formulario no valido');
                        return;
                      } else {
                        formValues['customer-uid'] = "U8hjd878sdafAda989";
                        print(formValues);
                      }
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Registrar'),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
