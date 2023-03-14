import 'package:flutter/material.dart';
import '../models/menu_option.dart';
import '../screens/screens.dart';

class AppRoutes {
  static const initiateRoute = 'home';

  static final menuOptions = <MenuOptions>[
//! Eliminar home
    MenuOptions(
        name: 'Home Screen',
        route: 'home',
        icon: Icons.home,
        screen: const HomeScreen()),
    MenuOptions(
        name: 'Chat',
        route: 'chat',
        icon: Icons.perm_phone_msg_rounded,
        screen: const ChatScreen()),
  ];
  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }
}
