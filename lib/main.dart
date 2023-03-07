import 'package:chat_lyen/routes/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(ChatLyen());

class ChatLyen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: AppRoutes.initiateRoute,
      routes: AppRoutes.getAppRoutes(),
    );
  }
}
