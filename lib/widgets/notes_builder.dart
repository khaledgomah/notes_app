import 'package:flutter/material.dart';
import 'package:notes_app/widgets/note_item.dart';

class NotesBuilder extends StatelessWidget {
  const NotesBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
      itemCount: 13,
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemBuilder: (context, index) => const NoteItem(),
    ));
  }
}
