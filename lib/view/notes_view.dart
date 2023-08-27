import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_list_cubit/notes_list_cubit.dart';
import '../widgets/custom_floating_action_button.dart';
import '../widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => NotesListCubit(),
      child:const Scaffold(
        body: NotesViewBody(),
        floatingActionButton: CustomFloatingActionButton(),
      ),
    );
  }
}
