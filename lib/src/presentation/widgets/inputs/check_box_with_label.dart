import 'package:flutter/material.dart';

class CheckBoxWithText extends StatefulWidget {
  const CheckBoxWithText({
    super.key,
    this.checked = false,
    this.onChanged,
    required this.text,
    this.onTapLabel,
  });
  final bool checked;
  final void Function(bool value)? onChanged;
  final VoidCallback? onTapLabel;
  final String text;

  @override
  State<CheckBoxWithText> createState() => _CheckBoxWithTextState();
}

class _CheckBoxWithTextState extends State<CheckBoxWithText> {
  bool checked = false;

  @override
  void initState() {
    super.initState();
    checked = widget.checked;
  }

  @override
  void didUpdateWidget(covariant CheckBoxWithText oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      checked = widget.checked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              checked = !checked;
            });
            widget.onChanged?.call(checked);
          },
          icon: Icon(checked ? Icons.check_box : Icons.check_box_outline_blank),
        ),
        TextButton(
          child: Text(
            widget.text,
            style: const TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
          onPressed: () => widget.onTapLabel?.call(),
        ),
      ],
    );
  }
}
