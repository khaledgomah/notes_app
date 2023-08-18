import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'nodes_listView.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SafeArea(
        child: Column(children:const [
           CustomAppBar(),
           Expanded(
            child: NotesListView(),
          )
        ]),
      ),
    );
  }
}



