import 'package:chat_lyen/firebase_options.dart';
import 'package:chat_lyen/routes/routes.dart';
import 'package:chat_lyen/themes/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatLyen());
}

class ChatLyen extends StatelessWidget {
  const ChatLyen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRoutes.ruta,
      routes: AppRoutes.getAppRoutes(),
    );
  }
}
