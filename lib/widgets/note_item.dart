import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.note,
  });
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditView(note: note),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Color(note.color),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              textColor: Colors.black,
              iconColor: Colors.black,
              trailing: Column(
                children: [
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.trash),
                    onPressed: () async {
                      await note.delete();
                      BlocProvider.of<NotesCubit>(context).fetchNotes();
                    },
                  ),
                ],
              ),
              title: Text(
                note.title,
                style: const TextStyle(fontSize: 28),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  note.desc,
                  style: TextStyle(
                      color: Colors.black.withOpacity(.7), fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, bottom: 24),
              child: Text(
                DateFormat.yMEd().format(DateTime.now()),
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
