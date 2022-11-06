import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import '../state/inherited_user.dart';
import 'vote_chart.dart';

/// A class that represents text message widget with optional link preview.
class VoteMessage extends StatelessWidget {
  /// Creates a text message widget from a [types.TextMessage] class.
  const VoteMessage({
    super.key,
    required this.message,
    this.title = '',
    required this.onVote,
  });

  final types.CustomMessage message;
  final String title;
  final Function(String messageId, int index) onVote;

  @override
  Widget build(BuildContext context) {
    final user = InheritedUser.of(context).user;

    return Center(
      child: _textWidgetBuilder(user, context),
    );
  }

  Widget _textWidgetBuilder(
    types.User user,
    BuildContext context,
  ) =>
      Column(
        children: [
          // Title of the vote.
          Container(
            padding: const EdgeInsets.all(10),
            width: min(500, MediaQuery.of(context).size.width * 0.7),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.pinkAccent, width: 2),
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${message.metadata?['options']} started a poll 🗳️',
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),

          // Vote chart.
          Container(
            width: min(MediaQuery.of(context).size.width * 0.90, 1200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.pinkAccent, width: 1.5),
            ),
            clipBehavior: Clip.hardEdge,
            child: Column(
              children: [
                // Title of the vote.
                Container(
                  decoration: BoxDecoration(color: Colors.pinkAccent),
                  height: 35,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "3/4 Voted",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                // Vote Chart.
                VoteChart(
                  options: List<String>.from(message.metadata?['options'] ?? ['No data']),
                  voteCount: List<int>.from(message.metadata?['counts'] ?? [0]),
                  width: min(MediaQuery.of(context).size.width * 0.90, 1200),
                  onTapOption: onVote,
                  messageId: message.id,
                ),
              ],
            ),
          ),
        ],
      );
}
