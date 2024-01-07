import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    super.key,
    this.onTapCancelBtn,
    this.onTapOkBtn,
    required this.content,
    required this.title,
  });
  final VoidCallback? onTapOkBtn;
  final VoidCallback? onTapCancelBtn;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () => onTapCancelBtn?.call(),
          child: Text(
            'CANCEL',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        TextButton(
          onPressed: () => onTapOkBtn?.call(),
          child: Text(
            'OK',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        )
      ],
    );
  }
}
