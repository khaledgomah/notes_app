import 'package:flutter/material.dart';

class CustomAppBarIcon extends StatelessWidget {
  final IconData icon;
  const CustomAppBarIcon({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(.04),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          size: 28,
        ),
      ),
    );
  }
}
