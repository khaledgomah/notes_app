import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'custom_text_feild.dart';

class AddNoteButtomSheet extends StatelessWidget {
  const AddNoteButtomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: AddNoteForm(),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState>? formKay = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitile;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKay,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hint: 'title',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            maxLines: 5,
            onSaved: (value) {
              subTitile = value;
            },
            hint: 'content',
          ),
          const SizedBox(
            height: 32,
          ),
          CustomButton(
            onPressed: () {
              if (formKay!.currentState!.validate()) {
                formKay!.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
            text: 'add',
          )
        ],
      ),
    );
  }
}
