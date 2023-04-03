// ignore_for_file: must_be_immutable, camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class alertDialogAndroid extends StatelessWidget {
  alertDialogAndroid(
      {super.key, required this.tittle, required this.description});

  String tittle, description;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 5,
      title: Text(tittle),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(description),
          const SizedBox(height: 10),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          style: TextButton.styleFrom(foregroundColor: Colors.blue),
          child: const Text('Ok'),
        )
      ],
    );
  }
}

class alertDialogCupertino extends StatelessWidget {
  alertDialogCupertino(
      {super.key, required this.tittle, required this.description});

  String tittle, description;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(tittle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(description),
          const SizedBox(height: 10),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          style: TextButton.styleFrom(foregroundColor: Colors.blue),
          child: const Text('Ok'),
        )
      ],
    );
  }
}
