import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:notes_app/cubits/add_note/add_note_cubit.dart';
import 'package:notes_app/widgets/home_view_button_sheet.dart';

class AddNoteActionButton extends StatefulWidget {
  const AddNoteActionButton({
    super.key,
  });

  @override
  State<AddNoteActionButton> createState() => _AddNoteActionButtonState();
}

class _AddNoteActionButtonState extends State<AddNoteActionButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return BlocConsumer<AddNoteCubit, AddNoteState>(
              listener: (context, state) {
                log('i am in cubit');
                if (state is AddNoteLoading) {
                  isLoading = true;
                } else if (state is AddNoteSuccess) {
                  isLoading = false;
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                if (state is AddNoteFailure) {
                  return  Text(state.errorMessage);
                } else {
                  return LoadingOverlay(
                    isLoading: isLoading,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: const HomeViewButtonSheet(),
                    ),
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
