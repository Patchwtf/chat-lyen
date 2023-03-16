import 'package:chat_lyen/routes/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ChatLyen());

class ChatLyen extends StatelessWidget {
  const ChatLyen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRoutes.initiateRoute,
      routes: AppRoutes.getAppRoutes(),
    );
  }
}
