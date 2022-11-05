import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomMessageActionSheet extends StatelessWidget {
  const CustomMessageActionSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(onPressed: (){
          Navigator.of(context).pop();
        }, child: Text("Send a notification")),
        CupertinoActionSheetAction(onPressed: (){
          Navigator.of(context).pop();
        }, child: Text("Send a vote")),
        CupertinoActionSheetAction(onPressed: (){
          Navigator.of(context).pop();
        }, child: Text("Cancel"), isDefaultAction: true,),
      ],
    );
  }
}
