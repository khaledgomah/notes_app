import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_feild.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          CustomAppBar(
            title: 'Update',
            icon: Icons.check,
            onPressed: () {
              widget.note.subTitle = subTitle ?? widget.note.subTitle;
              widget.note.title = title ?? widget.note.title;
              widget.note.save();
              Navigator.pop(context);
            },
          ),
          CustomTextField(
            hint: 'title',
            onChanged: (title) {
              this.title = title;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            hint: 'content',
            maxLines: 5,
            onChanged: (content) {
              subTitle = content;
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
