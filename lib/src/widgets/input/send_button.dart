import 'package:flutter/material.dart';

import '../state/inherited_chat_theme.dart';
import '../state/inherited_l10n.dart';

/// A class that represents send button widget.
class SendButton extends StatelessWidget {
  /// Creates send button widget.
  const SendButton({
    super.key,
    required this.onPressed,
    this.padding = EdgeInsets.zero,
  });

  /// Callback for send button tap event.
  final VoidCallback onPressed;

  /// Padding around the button.
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) => Container(
        margin: InheritedChatTheme.of(context).theme.sendButtonMargin ??
            const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
        child: IconButton(
          constraints: const BoxConstraints(
            minHeight: 24,
            minWidth: 24,
          ),
          icon: Icon(
            Icons.arrow_circle_right,
            color: Colors.grey.withOpacity(0.6),
            size: 32,
          ),
          onPressed: onPressed,
          padding: padding,
          splashRadius: 24,
          tooltip: InheritedL10n.of(context).l10n.sendButtonAccessibilityLabel,
        ),
      );
}
