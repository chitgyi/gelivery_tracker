import 'package:flutter/material.dart';

class InputTextWithPrefixIcon extends StatelessWidget {
  const InputTextWithPrefixIcon({
    super.key,
    this.hintText,
    required this.iconData,
    this.controller,
    this.obscureText = false,
  });
  final String? hintText;
  final IconData iconData;
  final TextEditingController? controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData),
        const SizedBox(width: 16),
        Expanded(
          child: TextField(
            obscureText: obscureText,
            controller: controller,
            decoration: InputDecoration(hintText: hintText),
          ),
        ),
      ],
    );
  }
}
