import 'package:flutter/material.dart';

Color whiteColor = const Color.fromRGBO(248, 249, 250, 1);
Color blueColor = const Color.fromRGBO(37, 150, 190, 1);

final lightTheme = ThemeData(
    primaryColor: const Color.fromRGBO(37, 150, 190, 1),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
    ),
    iconTheme: IconThemeData(color: blueColor),
    scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1),
    cardColor: Colors.white60);

final darkTheme = ThemeData(
  primaryColor: const Color.fromRGBO(4, 15, 19, 1),
  cardColor: Colors.grey,
  appBarTheme: const AppBarTheme(
      elevation: 0, centerTitle: true, color: Color.fromRGBO(7, 7, 7, 1)),
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(4, 15, 19, 1)),
    ),
  ),
  iconTheme: IconThemeData(color: whiteColor),
  inputDecorationTheme: InputDecorationTheme(
      iconColor: whiteColor,
      labelStyle: const TextStyle(color: Colors.white54,
      
      )),
  scaffoldBackgroundColor: const Color.fromARGB(255, 65, 65, 65),
);
