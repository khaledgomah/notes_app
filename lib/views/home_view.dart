import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/home_view_button_sheet.dart';
import 'package:notes_app/widgets/notes_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return const HomeViewButtpmSheet();
            },
          );
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: kViewPadding,
          child: const Column(
            children: [
              CustomAppBar(),
              NotesBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
