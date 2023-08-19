import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_feild.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: const [
              CustomAppBar(title: 'Update'),
              CustomTextField(hint: 'title'),
              SizedBox(
                height: 16,
              ),
              CustomTextField(
                hint: 'content',
                maxLines: 5,
              ),
              SizedBox(
                height: 32,
              ),
              CustomButton(text: 'Update'),
            ],
          ),
        ),
      ),
    );
  }
}
