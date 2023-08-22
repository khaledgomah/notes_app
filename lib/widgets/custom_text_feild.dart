import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  const CustomTextField(
      {required this.hint, super.key, this.maxLines = 1, this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        enabledBorder: textFieldBorder(color: Colors.white),
        focusedBorder: textFieldBorder(color: kPrimaryColor),
        labelStyle: const TextStyle(color: Color(0xff63ffda)),
        border: const OutlineInputBorder(),
        labelText: hint,
      ),
    );
  }

  OutlineInputBorder textFieldBorder({required Color color}) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color),
        borderRadius: BorderRadius.circular(6));
  }
}
