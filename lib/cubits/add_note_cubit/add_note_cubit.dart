// import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/widgets/constants.dart';
// part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  addNote(NoteModel note) async {
    emit(AddNoteLoding());
    try {
      var noteBox = Hive.box<NoteModel>(kNotebox);
     
     await noteBox.add(note);
     emit(AddNoteSuccess()); 
    } catch (e) {
      emit(AddNoteFailuer(e.toString()));
    }
  }
}
// class AddNoteCubit extends Cubit<AddNoteState> {
//   AddNoteCubit() : super(AddNoteInitial());
//   addnote(NoteModel note)
//   {

//   }
// }

// class Cubit {}
