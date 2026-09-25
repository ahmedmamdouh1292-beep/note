// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/cubit/note_cubit.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

// ignore: camel_case_types
class customNoteItem extends StatelessWidget {
  const customNoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(note.color),
        borderRadius: BorderRadius.circular(16),
      ),

      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return EditNoteView(note: note,);
                },
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  note.title,
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    note.sibTitle,
                    style: TextStyle(color: Colors.black.withAlpha(100)),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                   note. delete();
                   BlocProvider.of<NoteCubit>(context).fetchNotes();
                  },
                  icon: Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24.0, top: 16),
                child: Text(
                  note.date,
                  style: TextStyle(color: Colors.black.withAlpha(150)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
