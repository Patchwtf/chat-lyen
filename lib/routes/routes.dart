import 'package:chat_lyen/screens/init_screen.dart';
import 'package:chat_lyen/screens/login_screen.dart';
import 'package:chat_lyen/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import '../models/menu_option.dart';
import '../screens/screens.dart';

class AppRoutes {
  static const initiateRoute = 'init';

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
