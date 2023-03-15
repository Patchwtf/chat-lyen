import 'package:chat_lyen/themes/themes.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  const MessageCard(
      {super.key,
      required this.userName,
      required this.message,
      required this.dateTime});

  final String userName;
  final String message;
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15)),
      ),
      shadowColor: Colors.black,
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              textAlign: TextAlign.start,
              style: messageUserTextStyle,
            ),
            Text(message, style: messageTextStyle),
            Text(
              dateTime,
              style: messageDateTimeStyle,
            ),
          ],
        ),
      ),
    );
  }
}
