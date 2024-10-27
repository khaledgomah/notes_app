import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note/add_note_cubit.dart';
import 'package:notes_app/cubits/cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/color_item_builder.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';
import 'package:intl/date_symbol_data_local.dart';

class AddNoteButtonSheet extends StatefulWidget {
  const AddNoteButtonSheet({
    super.key,
  });

  @override
  State<AddNoteButtonSheet> createState() => _AddNoteButtonSheetState();
}

class _AddNoteButtonSheetState extends State<AddNoteButtonSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: kViewPadding,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 48,
              ),
              CustomTextFormField(
                  autovalidateMode: autovalidateMode,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "this field can't be empty";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    title = value;
                  },
                  labelText: 'title'),
              const SizedBox(
                height: 14,
              ),
              CustomTextFormField(
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "this field can't be empty";
                  } else {
                    return null;
                  }
                },
                autovalidateMode: autovalidateMode,
                onSaved: (value) {
                  content = value;
                },
                labelText: 'content',
                maxLines: 5,
              ),
              const SizedBox(
                height: 32,
              ),
              ColorItemBuilder(
                colorsList: colorsList,
              ),
              const SizedBox(
                height: 32,
              ),
              CustomButton(
                text: 'Add',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    addNote(context);
                    Navigator.pop(context);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 24,
              )
            ],
          ),
        ),
      ),
    );
  }

  void addNote(BuildContext context) {
    NoteModel note = NoteModel(
        title: title!,
        desc: content!,
        creatAt: DateTime.now(),
        color: BlocProvider.of<NotesCubit>(context).color.value);
    BlocProvider.of<AddNoteCubit>(context).addNote(note);
    BlocProvider.of<NotesCubit>(context).fetchNotes();
  }
}
