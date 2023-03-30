import 'package:chat_lyen/functions/login_signup_functions.dart';
import 'package:chat_lyen/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    String role = "customer";

    final Map<String, String> formValues = {
      'first-name': '',
      'last-name': '',
      'email': '',
      'password': '',
      'enterprise': '',
      'role': '',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Registro de nuevo usuario"),
      ),
      body: Center(
        child: Form(
          key: myFormKey,
          child: Container(
            padding: const EdgeInsets.only(right: 15, left: 15, top: 20),
            child: ListView(
              children: [
                Column(
                  children: [
                    CustomInputField(
                        formProperty: 'first-name',
                        formValues: formValues,
                        labelText: "Ingrese su nombre",
                        icon: Icons.person),
                    CustomInputField(
                        formProperty: 'last-name',
                        formValues: formValues,
                        labelText: "Ingrese su apellido",
                        icon: Icons.person_outline),
                    CustomInputField(
                        formProperty: 'email',
                        formValues: formValues,
                        labelText: "Ingrese su correo",
                        icon: Icons.email,
                        keyBoardType: TextInputType.emailAddress),
                    CustomInputField(
                      formProperty: 'password',
                      formValues: formValues,
                      labelText: "Ingrese su contraseña",
                      icon: Icons.password,
                      isPassword: true,
                    ),
                    CustomInputField(
                        formProperty: 'enterprise',
                        formValues: formValues,
                        labelText: "Ingrese el nombre de su empresa",
                        icon: Icons.business_outlined),
                    DropdownButtonFormField(
                        value: "customer",
                        items: const [
                          DropdownMenuItem(
                              value: "customer", child: Text("Cliente")),
                          DropdownMenuItem(
                              value: "colaborator", child: Text("Proveedor"))
                        ],
                        onChanged: (value) {
                          formValues['role'] = value!;
                          role = value;
                        }),
                    ElevatedButton(
                        onPressed: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          if (!myFormKey.currentState!.validate()) {
                            return;
                          }
                          Login credentials = Login();
                          credentials.registerNewUser(
                              context: context,
                              email: formValues['email']!,
                              name:
                                  "${formValues['first-name']!} ${formValues['last-name']!}",
                              password: formValues['password']!,
                              enterprise: formValues['enterprise']!,
                              role: formValues['role']!);
                        },
                        child: const Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Register",
                            ),
                          ],
                        ))),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
