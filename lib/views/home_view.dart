import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/add_note_action_button.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/notes_builder.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      
      floatingActionButton: const AddNoteActionButton(),
      body: SafeArea(
        child: Padding(
          padding: kViewPadding,
          child: Column(
            children: [
              CustomAppBar(
                  title: 'Notes',
                  icon: FontAwesomeIcons.magnifyingGlass,
                  onPressed: () {}),
              const NotesBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
