// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/cubit/note_cubit.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/widgets/custonNoteItem.dart';

class CustomNotesListView extends StatelessWidget {
  const CustomNotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        List<NoteModel>? notes= BlocProvider.of<NoteCubit>(context).notes??[];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0),
          child: ListView.builder(
            itemCount: notes.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: customNoteItem(note: notes[index]),
              );
            },
          ),
        );
      },
    );
  }
}
