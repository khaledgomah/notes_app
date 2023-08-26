part of 'notes_list_cubit.dart';

@immutable
abstract class NotesListState {}

class NotesListInitial extends NotesListState {}

class NotesListFailier extends NotesListState {
  final String errMessage;

  NotesListFailier(this.errMessage);
}

class NotesListSuccess extends NotesListState {
  final List<NoteModel> notesList;

  NotesListSuccess(this.notesList);
}
