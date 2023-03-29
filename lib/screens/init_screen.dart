import 'package:flutter/material.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Text firstLine = const Text(
      "Salesforce Consulting Partner",
      style: TextStyle(fontSize: 20),
    );
    Text scndLine = const Text(
      "\n\nImplementamos sus distintas soluciones",
      style: TextStyle(fontSize: 15),
    );
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(image: AssetImage("assets/lyen-logo.png"), height: 100),
          const SizedBox(height: 50),
          firstLine,
          scndLine,
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
                child: const Text("Inicio de Sesión"),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'signup');
                  },
                  child: const Text("Registro de usuario"))
            ],
          )
        ],
      ),
    );
  }
}
