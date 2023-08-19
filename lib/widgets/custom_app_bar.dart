import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Widget? endIcon;
  const CustomAppBar({
    super.key,
    required this.title,
    this.endIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(fontSize: 32),
          ),
          Container(
            child: endIcon,
          )
        ],
      ),
    );
  }
}
