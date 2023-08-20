import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_app_bar_icon.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final IconData icon;
  const CustomAppBar({
    super.key,
    required this.title,
    required this.icon,
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
            icon: icon,
          )
        ],
      ),
    );
  }
}
