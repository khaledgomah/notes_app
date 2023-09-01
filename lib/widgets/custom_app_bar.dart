import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_app_bar_icon.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onPressed;
  const CustomAppBar({
    super.key,
    required this.title,
    required this.icon, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(fontSize: 32),
          ),
          CustomAppBarIcon(
            onPressed: onPressed,
            icon: icon,
          )
        ],
      ),
    );
  }
}
