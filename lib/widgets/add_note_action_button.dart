import 'package:flutter/material.dart';
import 'package:notes_app/widgets/home_view_button_sheet.dart';

class AddNoteActionButton extends StatelessWidget {
  const AddNoteActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const HomeViewButtpmSheet(),
            );
          },
        );
      },
    );
  }
}
