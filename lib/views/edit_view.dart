import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/color_item_builder.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_form_field.dart';

class EditView extends StatefulWidget {
  const EditView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kViewPadding,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomAppBar(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      widget.note.color =
                          BlocProvider.of<NotesCubit>(context).color.value;
                      widget.note.save();
                      BlocProvider.of<NotesCubit>(context).fetchNotes();
                      Navigator.of(context).pop();
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  icon: Icons.check,
                  title: 'Edit note',
                ),
                Column(
                  children: [
                    CustomTextFormField(
                        autovalidateMode: autovalidateMode,
                        initalValue: widget.note.title,
                        onSaved: (value) {
                          widget.note.title = value!;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'content can not be empty';
                          }
                          return null;
                        },
                        labelText: 'title'),
                    const SizedBox(
                      height: 14,
                    ),
                    CustomTextFormField(
                      onSaved: (value) {
                        widget.note.desc = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'content can not be empty';
                        }
                        return null;
                      },
                      initalValue: widget.note.desc,
                      labelText: 'content',
                      maxLines: 5,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    ColorItemBuilder(
                      colorsList: kColorsList,
                      colorIndex: kColorsList.indexOf(Color(widget.note.color)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
