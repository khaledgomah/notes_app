import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_view.dart';
import 'package:notes_app/widgets/note_item.dart';

class NotesBuilder extends StatelessWidget {
  const NotesBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemBuilder: (context, index) => NoteItem(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditView(
                    note: NoteModel(
                        titile: 'hala',
                        desc: 'hala walaa kef el ahwal',
                        date: DateTime.now(),
                        color: 0xff12452fea)),
              ));
        },
      ),
    ));
  }
}
