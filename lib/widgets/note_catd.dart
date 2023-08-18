import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.orange, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
                title: Text(
                  'My note',
                  style:
                      GoogleFonts.poppins(fontSize: 32, color: Colors.black),
                ),
                subtitle: Text(
                  'this is a notes app',
                  style: GoogleFonts.poppins(
                      fontSize: 24, color: Colors.black.withOpacity(.6)),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Icon(
                        FontAwesomeIcons.trash,
                        color: Colors.black,
                      ),
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              '18/8/2023',
              style: GoogleFonts.poppins(
                  fontSize: 16, color: Colors.black.withOpacity(0.6)),
            ),
          )
        ],
      ),
    );
  }
}
