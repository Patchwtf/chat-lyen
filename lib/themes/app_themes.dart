import 'package:flutter/material.dart';

final lightTheme = ThemeData(
    primaryColor: const Color.fromRGBO(37, 150, 190, 1),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: const Color.fromRGBO(233, 245, 249, 1));
final darkTheme = ThemeData(
  primaryColor: const Color.fromRGBO(4, 15, 19, 1),
  appBarTheme: const AppBarTheme(
      elevation: 0, centerTitle: true, color: Color.fromRGBO(4, 15, 19, 1)),
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(4, 15, 19, 1)),
    ),
  ),
);
