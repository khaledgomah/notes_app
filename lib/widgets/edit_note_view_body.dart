
import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_feild.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
           CustomAppBar(title: 'Update', icon: Icons.check,onPressed: () {
             Navigator.pop(context);
           },),
          const CustomTextField(hint: 'title'),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            hint: 'content',
            maxLines: 5,
            onSaved: (content) {
              note.subTitle = content;
            },
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
