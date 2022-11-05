import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import '../state/inherited_user.dart';

/// A class that represents text message widget with optional link preview.
class NotificationMessage extends StatelessWidget {
  /// Creates a text message widget from a [types.TextMessage] class.
  const NotificationMessage({
    super.key,
    required this.message,
    this.title = '',
  });

  /// [types.TextMessage].
  final types.TextMessage message;
  final String title;


  @override
  Widget build(BuildContext context) {

    final user = InheritedUser.of(context).user;
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: _textWidgetBuilder(user, context),
    );
  }

  Widget _textWidgetBuilder(
    types.User user,
    BuildContext context,
  ) => Container(
      padding: const EdgeInsets.all(20),
      width: min(300, MediaQuery.of(context).size.width * 0.7),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.pinkAccent, width: 2),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (title.isNotEmpty)
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: Colors.pinkAccent),
            ),
          Text(
            message.text,
            style: const TextStyle(fontSize: 16, color: Colors.pinkAccent),
          ),

        ],
      ),
    );
}