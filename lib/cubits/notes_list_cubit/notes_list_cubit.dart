import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_list_state.dart';

class NotesListCubit extends Cubit<NotesListState> {
  NotesListCubit() : super(NotesListInitial());
  List<NoteModel>? notes;
  fetchNoteList() {
    var noteBox = Hive.box<NoteModel>(kNotesBox);
    notes = noteBox.values.toList();
  }

  deleteNote(index) {
    notes![index].delete();
  }
}
