// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:notes_app/widgets/add_note_button_sheet.dart';
import 'package:notes_app/widgets/notesViewBody.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
          
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            context: context,
            builder: (context) {
              return const addNoteButtonSeeet();
            },
          );
        },
        child: Icon(Icons.add),
      ),
    
      body: NotesViewBody(),
    );
  }
}
