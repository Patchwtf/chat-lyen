import 'package:chat_lyen/functions/functions.dart';
import 'package:chat_lyen/widgets/widgets.dart' show CustomInputField;
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> formValues = {'email': '', 'password': ''};
    bool isValidEmail(String Value) {
      return RegExp(
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(Value);
    }

    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    String themeID = "Color(0xffffffff)";
    String currentScaffoldColor =
        Theme.of(context).scaffoldBackgroundColor.toString();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: myFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              currentScaffoldColor == themeID
                  ? const Image(
                      image: AssetImage("assets/lyen-logo.png"), height: 100)
                  : const Image(
                      image: AssetImage("assets/lyen-logo-dark.png"),
                      height: 100),
              const SizedBox(height: 40),
              CustomInputField(
                  formProperty: 'email',
                  formValues: formValues,
                  labelText: 'Ingrese su correo',
                  keyBoardType: TextInputType.emailAddress,
                  icon: Icons.email,
                  validator: (value) =>
                      isValidEmail(value!) ? null : "Ingrese un correo valido"),
              const SizedBox(height: 20),
              CustomInputField(
                  formProperty: 'password',
                  formValues: formValues,
                  isPassword: true,
                  labelText: 'Ingrese su contraseña',
                  icon: Icons.password,
                  validator: (value) =>
                      value!.length < 8 ? "Contraseña Invalida" : null),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          FocusScope.of(context).requestFocus(FocusNode());

                          if (!myFormKey.currentState!.validate()) {
                            return null;
                          }

                          Login credentials = Login();
                          credentials.loginUser(
                              email: formValues['email']!,
                              password: formValues['password']!,
                              context: context);
                        },
                        child: const Text("Inicio Sesion")),
                  ),
                ],
              ),
              //Prueba
            ],
          ),
        ),
      ),
    );
  }
}
