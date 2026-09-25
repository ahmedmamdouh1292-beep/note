import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/widgets/constants.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
  List<NoteModel>? notes;
  fetchNotes() {
    var notesbox = Hive.box<NoteModel>(kNotebox);
    notes = notesbox.values.toList();
    emit(NoteSuccess());
  }
}
