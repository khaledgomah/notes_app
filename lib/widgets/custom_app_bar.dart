import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Notes',
            style: GoogleFonts.poppins(fontSize: 32),
          ),
          const CustomSearchIcon()
        ],
      ),
    );
  }
}
