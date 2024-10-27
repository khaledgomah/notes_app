// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.color, required this.isSelected});
  final Color color;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
            minRadius: 30,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              minRadius: 26,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            minRadius: 30,
            backgroundColor: color,
          );
  }
}
