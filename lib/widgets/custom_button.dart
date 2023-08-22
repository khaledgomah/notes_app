import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()?  onPressed;

  const CustomButton({
    super.key, required this.text,required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: TextButton(
          onPressed: onPressed,
          child:  Text(
            text,
            style:const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          )),
    );
  }
}
