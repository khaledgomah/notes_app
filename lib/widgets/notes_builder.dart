import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/cubit/notes_cubit.dart';
import 'package:notes_app/widgets/note_item.dart';

class NotesBuilder extends StatefulWidget {
  const NotesBuilder({
    super.key,
  });

  @override
  State<NotesBuilder> createState() => _NotesBuilderState();
}

class _NotesBuilderState extends State<NotesBuilder> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        var notesList = BlocProvider.of<NotesCubit>(context).notesList ?? [];
        return Expanded(
            child: ListView.separated(
          itemCount: notesList.length,
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          itemBuilder: (context, index) => NoteItem(
            note: notesList[index],
          ),
        ));
      },
    );
  }
}
