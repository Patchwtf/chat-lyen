import 'dart:ui';

import 'package:chat_lyen/themes/themes.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  const MessageCard(
      {super.key,
      required this.userName,
      required this.message,
      required this.dateTime,
      required this.mainAxisAlignment});

  final String userName;
  final String message;
  final String dateTime;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final messageSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15)),
          ),
          shadowColor: Colors.black,
          clipBehavior: Clip.antiAlias,
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  userName,
                  style: messageUserTextStyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width:
                      message.length > 60 ? (messageSize.width / 2) - 20 : null,
                  child: Column(
                    children: [
                      Text(
                        message,
                        style: messageTextStyle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width:
                      message.length > 40 ? (messageSize.width / 2) - 20 : 150,
                  child: Text(
                    dateTime,
                    style: messageDateTimeStyle,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
