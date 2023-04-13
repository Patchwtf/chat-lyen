import 'package:chat_lyen/screens/projects_view_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_lyen/models/models.dart';
import 'package:chat_lyen/screens/screens.dart';

import '../functions/functions.dart';

class AppRoutes {
  String? initiateRoute() {
    String initRoute = 'init';
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        initRoute = 'home';
      }
    });

    return initRoute;
  }

  static String ruta =
      FirebaseAuth.instance.currentUser != null ? 'home' : 'init';

  static final menuOptions = <MenuOptions>[
    MenuOptions(
        name: 'Chat',
        route: 'chat',
        icon: Icons.perm_phone_msg_rounded,
        screen: const ChatScreen()),
    MenuOptions(
        name: 'Registro de Proyecto',
        route: 'project-register',
        icon: Icons.assignment_add,
        screen: const ProjectRegisterScreen()),
    MenuOptions(
        name: 'Lista de Proyectos',
        route: 'project-list',
        icon: Icons.format_list_bulleted,
        screen: const ProjectViewScreen()),
    MenuOptions(
        name: 'Administración de proyectos',
        route: 'project-admin',
        icon: Icons.settings,
        screen: const ProjectAdminScreen()),
  ];
  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});
    appRoutes
        .addAll({'signup': (BuildContext context) => const SignUpScreen()});
    appRoutes.addAll({'login': (BuildContext context) => const LoginScreen()});
    appRoutes.addAll({'init': (BuildContext context) => const InitScreen()});

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }
}
