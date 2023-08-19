import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_search_icon.dart';
import 'custom_app_bar.dart';
import 'nodes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SafeArea(
        child: Column(children: const [
          CustomAppBar(title: "Notes", endIcon: CustomSearchIcon()),
          Expanded(
            child: NotesListView(),
          )
        ]),
      ),
    );
  }
}
