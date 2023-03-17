import 'dart:ffi';

import 'package:flutter/material.dart';

class Contacs_mod {
  final String name;
  final String uid;
  final String email;
  final Int number;

  Contacs_mod(
      {required this.name,
      required this.uid,
      required this.email,
      required this.number});
}
