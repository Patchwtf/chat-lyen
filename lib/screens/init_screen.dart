import 'package:flutter/material.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [Image(image: AssetImage("assets\lyen-logo.png"))],
      ),
    );
  }
}
