import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_search_icon.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Notes',
          style: GoogleFonts.acme(fontSize: 32),
        ),
       const CustomSearchIcon()
      ],
    );
  }
}

