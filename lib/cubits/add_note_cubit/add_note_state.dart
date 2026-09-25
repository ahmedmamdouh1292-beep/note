abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoding extends AddNoteState {}

class AddNoteSuccess extends AddNoteState {}

class AddNoteFailuer extends AddNoteState {
  final String erorrMessage;

  AddNoteFailuer(this.erorrMessage);

}
