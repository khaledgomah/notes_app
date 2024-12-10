import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.onSaved,
    this.labelText,
    this.validator,
    this.obscureText = false,
    this.maxLines = 1,
    this.onChanged, 
     this.autovalidateMode, 
     this.initalValue,
  });
  final AutovalidateMode? autovalidateMode;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final String? labelText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final int? maxLines;
  final String? initalValue;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue:initalValue ,
      autovalidateMode: autovalidateMode,
      onChanged: onChanged,
      maxLines: maxLines,
      obscureText: obscureText,
      validator: validator,
      onSaved: onSaved,
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