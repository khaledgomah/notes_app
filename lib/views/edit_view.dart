import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';

class EditView extends StatelessWidget {
  const EditView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kViewPadding,
          child: Column(
            children: [
              CustomAppBar(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icons.check,
                title: 'Edit note',
              ),
              const EditViewBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class EditViewBody extends StatelessWidget {
  const EditViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(onChanged: (p0) {}, labelText: 'title'),
        const SizedBox(
          height: 14,
        ),
        CustomTextFormField(
          onChanged: (p0) {},
          labelText: 'content',
          maxLines: 5,
        ),
      ],
    );
  }
}
