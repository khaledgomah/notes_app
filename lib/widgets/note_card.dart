import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../view/edit_note_view.dart';

class NoteCard extends StatelessWidget {
  final String title;
  final String supTitle;
  final String date;
  const NoteCard({
    super.key,
    required this.title,
    required this.supTitle, required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return const EditNoteView();
        },
      )),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.orange, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                  title: Text(
                    title,
                    style:
                        GoogleFonts.poppins(fontSize: 32, color: Colors.black),
                  ),
                  subtitle: Text(
                   supTitle,
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
                date,
                style: GoogleFonts.poppins(
                    fontSize: 16, color: Colors.black.withOpacity(0.6)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
