import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final int maxLines;

  const CustomTextField({
    required this.hint,
    super.key,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        labelStyle: const TextStyle(color: Color(0xff63ffda)),
        border: const OutlineInputBorder(),
        labelText: hint,
      ),
    );
  }
}
