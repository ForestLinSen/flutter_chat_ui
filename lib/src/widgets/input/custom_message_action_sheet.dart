import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_notification_dialog.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import 'add_vote_dialog.dart';

class CustomMessageActionSheet extends StatelessWidget {
  const CustomMessageActionSheet({Key? key, required this.onSendPressed, required this.onVotePressed, required this.username})
      : super(key: key);

  final void Function(types.PartialCustom) onSendPressed;
  final void Function(types.PartialCustom) onVotePressed;
  final String username;

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(context).pop();
              showCupertinoDialog(
                  context: context,
                  builder: (context) => AddNotificationDialog(onSendPressed: onSendPressed),);
            },
            child: Text("Send a notification")),
        CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(context).pop();
              showCupertinoDialog(context: context, builder: (context) => AddVoteDialog(onPressed: onVotePressed, username: username,));
            },
            child: Text("Send a vote")),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Cancel"),
          isDefaultAction: true,
        ),
      ],
    );
  }
}
