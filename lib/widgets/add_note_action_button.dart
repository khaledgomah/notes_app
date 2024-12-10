import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note/add_note_cubit.dart';
import 'package:notes_app/widgets/add_note_button_sheet.dart';

class AddNoteActionButton extends StatefulWidget {
  const AddNoteActionButton({
    super.key,
  });

  @override
  State<AddNoteActionButton> createState() => _AddNoteActionButtonState();
}

class _AddNoteActionButtonState extends State<AddNoteActionButton> {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (context, state) {
                if (state is AddNoteFailure) {
                  return Text(state.errorMessage);
                } else {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: const AddNoteButtonSheet(),
                  );
                }
              },
            );
          },
        );
      },
    );
  }
}
