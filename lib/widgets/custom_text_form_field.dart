// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.onChanged,
    required this.labelText,
    this.validator,
    this.obscureText = false,
    this.maxLines,
  });
  final Function(String) onChanged;
  final String labelText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          floatingLabelStyle: TextStyle(color: kPrimaryColor),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 155, 165, 244)),
          ),
          border: const OutlineInputBorder(),
          labelText: labelText,
          focusColor: const Color.fromARGB(8, 255, 255, 255),
          labelStyle: const TextStyle(color: Colors.white)),
    );
  }
}
