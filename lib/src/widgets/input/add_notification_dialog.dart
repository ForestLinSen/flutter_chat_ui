import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../../../flutter_chat_ui.dart';

class AddNotificationDialog extends StatelessWidget {
  const AddNotificationDialog({Key? key, required this.onSendPressed}) : super(key: key);

  final void Function(types.PartialCustom) onSendPressed;

  @override
  Widget build(BuildContext context) {
    final _titleController = InputTextFieldController();
    final _contentController = InputTextFieldController();

    return CupertinoAlertDialog(
      title: Text("Group Notification"),
      content: Column(
        children: [
          SizedBox(height: 15,),
          CupertinoTextField(placeholder: 'Title (optional)', controller: _titleController,),
          CupertinoTextField(placeholder: 'Content ', maxLines: 4, controller: _contentController,),
        ],
      ),
      actions: [
        CupertinoDialogAction(isDestructiveAction: true, onPressed: (){
          Navigator.of(context).pop();
        },child: const Text("Cancel"),),
        CupertinoDialogAction(child: const Text("Send"), onPressed: (){
          Navigator.of(context).pop();
          if(_contentController.text.isNotEmpty){
            final customNotification = types.PartialCustom(metadata: {
              'customType': 'notification',
              'text': _contentController.text,
              "title": _titleController.text,
            });
            onSendPressed(customNotification);
          }

        },),

      ],
    );
  }
}
