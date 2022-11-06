import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_notification_dialog.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class CustomMessageActionSheet extends StatelessWidget {
  const CustomMessageActionSheet({Key? key, required this.onSendPressed})
      : super(key: key);

  final void Function(types.PartialCustom) onSendPressed;

  @override
  Widget build(BuildContext context) => CupertinoActionSheet(
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
