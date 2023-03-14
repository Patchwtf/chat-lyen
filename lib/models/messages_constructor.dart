import 'package:flutter/material.dart';

class Messages_Const {
  final String message;
  final String receptorUid;
  final String remitentUid;
  final DateTime fecha;

  Messages_Const(
      {required this.message,
      required this.receptorUid,
      required this.remitentUid,
      required this.fecha});
}
