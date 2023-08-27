import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_list_cubit/notes_list_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import 'note_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {


    return BlocBuilder<NotesListCubit, NotesListState>(
      builder: (context, state) {
        BlocProvider.of<NotesListCubit>(context).fetchNoteList();
        List<NoteModel>? notes =
            BlocProvider.of<NotesListCubit>(context).notes ?? [];
        return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: NoteCard(
                note: notes[index],

              ),
            );
          },
        );
      },
    );
  }
}
