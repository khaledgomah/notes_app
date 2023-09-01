import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/cubits/notes_list_cubit/notes_list_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import '../view/edit_note_view.dart';

class NoteCard extends StatelessWidget {
  final NoteModel note;

  const NoteCard({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return EditNoteView(
            note: note,
          );
        },
      )),
      child: Container(
        decoration: BoxDecoration(
            color: Color(note.color), borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                  title: Text(
                    note.title,
                    style:
                        GoogleFonts.poppins(fontSize: 32, color: Colors.black),
                  ),
                  subtitle: Text(
                    note.subTitle ?? '',
                    style: GoogleFonts.poppins(
                        fontSize: 24, color: Colors.black.withOpacity(.6)),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        note.delete();
                        BlocProvider.of<NotesListCubit>(context)
                            .fetchNoteList();
                      },
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
                note.date,
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
