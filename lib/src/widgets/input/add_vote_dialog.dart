import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../../../flutter_chat_ui.dart';
import '../state/inherited_user.dart';

class AddVoteDialog extends StatefulWidget {
  const AddVoteDialog({super.key, required this.onPressed, required this.username});
  final void Function(types.PartialCustom) onPressed;
  final String username;

  @override
  State<AddVoteDialog> createState() => _AddVoteDialogState();
}

class _AddVoteDialogState extends State<AddVoteDialog> {
  final InputTextFieldController _titleController = InputTextFieldController();
  final List<InputTextFieldController> _controllers = [
    InputTextFieldController(),
    InputTextFieldController(),
  ];

  @override
  Widget build(BuildContext context) {

    return CupertinoAlertDialog(
        title: Column(
          children: [
            CupertinoTextField(
              controller: _titleController,
              placeholder: 'Vote Title',
              placeholderStyle: const TextStyle(
                  fontWeight: FontWeight.w700, color: Colors.grey),
            ),
          ],
        ),
        content: Container(
          height: (_controllers.length).toDouble() * 70,
          child: Column(
            children: [
              ListView.builder(
                itemBuilder: (context, i) => Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: CupertinoTextField(
                      placeholder: "Option ${i + 1}",
                      controller: _controllers[i]),
                ),
                itemCount: _controllers.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 0),
              ),
              CupertinoButton(
                  child: const Text("Add an option"),
                  onPressed: () {
                    setState(() {
                      _controllers.add(InputTextFieldController());
                    });
                  },),
            ],
          ),
        ),
        actions: [
          CupertinoDialogAction(
            child: Text("Cancel"),
            isDestructiveAction: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text("Send"),
            onPressed: () {
              Navigator.of(context).pop();
              final optionsList = <String>[];
              final count = <int>[];
              for (var i = 0; i < _controllers.length; i++) {
                if (_controllers[i].text.isNotEmpty) {
                  optionsList.add(_controllers[i].text.toString());
                  count.add(0);
                }
              }

              if (optionsList.isEmpty) {
                return;
              }

              final customNotification = types.PartialCustom(metadata: {
                'title': _titleController.text,
                'customType': 'vote',
                'options': optionsList,
                'counts': count,
                'username': widget.username,
              });

              widget.onPressed(customNotification);
            },
          ),
        ],
      );
  }
}
