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
    Colors.red,
    Colors.cyan,
    Colors.deepOrangeAccent,
    Colors.lime,
    Colors.grey,
    Colors.pink
  ];
  MaterialColor noteColor = Colors.grey;
  GlobalKey<FormState>? formKay = GlobalKey();
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
          SizedBox(
            height: 25,
            child: ListView.builder(
              itemCount: colors.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    noteColor = colors[index];
                  },
                  icon: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    width: 25,
                    alignment: Alignment.center,
                    color: colors[index],
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          CustomButton(
            onPressed: () {
              if (formKay!.currentState!.validate()) {
                formKay!.currentState!.save();
              } else {
                autoValidateMode = AutovalidateMode.always;
                setState(() {});
              }
              NoteModel note = NoteModel(
                  date: DateFormat.yMd().format(DateTime.now()),
                  subTitle: subTitile!,
                  title: title!,
                  color: noteColor.value);
              BlocProvider.of<AddNoteCubit>(context).addNote(note);
              BlocProvider.of<NotesListCubit>(context).fetchNoteList();
            },
            text: 'add',
          ),
        ],
      ),
    );
  }
}
