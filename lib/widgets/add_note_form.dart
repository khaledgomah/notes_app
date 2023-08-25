import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_feild.dart';

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
              NoteModel note = NoteModel(
                  color: Colors.blue.value,
                  date: DateTime.now().toString(),
                  subTitle: subTitile!,
                  title: title!);
              BlocProvider.of<AddNoteCubit>(context).addNote(note);
            },
            text: 'add',
          )
        ],
      ),
    );
  }
}
