import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/home_view_button_sheet.dart';
import 'package:notes_app/widgets/notes_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
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
      ),
      body: SafeArea(
        child: Padding(
          padding: kViewPadding,
          child: Column(
            children: [
              CustomAppBar(
                title: 'Notes',
                icon: FontAwesomeIcons.magnifyingGlass,
                onPressed: () {},
              ),
              const NotesBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
