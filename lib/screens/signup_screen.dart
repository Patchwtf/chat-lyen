import 'package:chat_lyen/functions/login_signup_functions.dart';
import 'package:chat_lyen/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    String role = "Cliente";
    final Map<String, String> formValues = {
      'first-name': '',
      'last-name': '',
      'email': '',
      'password': '',
      'enterprise': '',
      'role': role,
    };

    List<dynamic> opciones = [
      {'name': 'Cliente', 'icon': const Icon(Icons.person)},
      {'name': 'Proveedor', 'icon': const Icon(Icons.support_agent_rounded)}
    ];

    bool isValidEmail(String Value) {
      return RegExp(
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(Value);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Registro de nuevo usuario"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 25),
        child: ListView(
          children: [
            const Image(image: AssetImage("assets/lyen-logo.png"), height: 100),
            Form(
              key: myFormKey,
              child: Column(children: [
                CustomInputField(
                    formProperty: 'first-name',
                    formValues: formValues,
                    labelText: "Ingrese su nombre",
                    icon: Icons.person,
                    validator: (value) => value!.length < 3
                        ? "EL valor debe de ser mas de 3 letras"
                        : null),
                const SizedBox(height: 15),
                CustomInputField(
                    formProperty: 'last-name',
                    formValues: formValues,
                    labelText: "Ingrese su apellido",
                    icon: Icons.person_outline,
                    validator: (value) => value!.length < 3
                        ? "EL valor debe de ser mas de 3 letras"
                        : null),
                const SizedBox(height: 15),
                CustomInputField(
                    formProperty: 'email',
                    formValues: formValues,
                    labelText: "Ingrese su correo",
                    icon: Icons.email,
                    keyBoardType: TextInputType.emailAddress,
                    validator: (value) => isValidEmail(value!)
                        ? null
                        : "Ingrese un correo valido"),
                const SizedBox(height: 15),
                CustomInputField(
                  formProperty: 'password',
                  formValues: formValues,
                  labelText: "Ingrese su contraseña",
                  icon: Icons.password,
                  isPassword: true,
                  validator: (value) => value!.contains(RegExp(
                          r'^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{8,16}$'))
                      ? null
                      : "Su contraseña deberá contenar al menos \n8 caracteres, 1 simbolo especial, 1 mayuscula y 1 numero",
                ),
                const SizedBox(height: 15),
                CustomInputField(
                    formProperty: 'enterprise',
                    formValues: formValues,
                    labelText: "Ingrese el nombre de su empresa",
                    icon: Icons.business_outlined,
                    validator: (value) => value!.length < 3
                        ? "EL valor debe de ser mas de 3 letras"
                        : null),
                const SizedBox(height: 15),
              ]),
            ),
            DropdownButtonFormField(
              isExpanded: true,
              value: role,
              isDense: true,
              items: opciones
                  .map((e) => DropdownMenuItem(
                      value: e['name'],
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text(e['name']), e['icon']])))
                  .toList(),
              onChanged: (value) {
                if (value is String) {
                  print(value);
                  formValues['role'] = value;
                  role = value;
                }
              },
            ),
            const SizedBox(height: 25),
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
                child: const Text("Register"))
          ],
        ),
      ),
    );
  }
}
