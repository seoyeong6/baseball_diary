import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final String? errorText;
  final Function()? onEditingComplete;
  final Function()? onSuffixPressed;
  final bool obscureText;
  final InputDecoration? decoration;
  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.onChanged,
    this.keyboardType,
    this.errorText,
    this.onEditingComplete,
    this.onSuffixPressed,
    this.obscureText = false,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 40,
      child: TextField(
        controller: controller,
        autocorrect: false,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        obscureText: obscureText,
        decoration:
            decoration ??
            InputDecoration(
              hintText: hintText,
              errorText: errorText,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
      ),
    );
  }
}
