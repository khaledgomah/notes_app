import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_list_cubit/notes_list_cubit.dart';
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
  List colors = [
    Colors.blue,
    Colors.amber,
    Colors.brown,
    Colors.blueAccent,
    Colors.white
  ];
  GlobalKey<FormState>? formKay = GlobalKey();
  int colorIndex = 0;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitile;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKay,
      autovalidateMode: autoValidateMode,
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
              colorIndex++;
              if (formKay!.currentState!.validate()) {
                formKay!.currentState!.save();
              } else {
                autoValidateMode = AutovalidateMode.always;
                setState(() {});
              }
              NoteModel note = NoteModel(
                  date: DateFormat.yMd().format(DateTime.now()),
                  subTitle: subTitile!,
                  title: title!, color:  colors[colorIndex % colors.length]);
              BlocProvider.of<AddNoteCubit>(context).addNote(note);
              BlocProvider.of<NotesListCubit>(context).fetchNoteList();
            },
            text: 'add',
          )
        ],
      ),
    );
  }
}
