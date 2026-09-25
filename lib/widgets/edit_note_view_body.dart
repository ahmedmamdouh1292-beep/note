import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/cubit/note_cubit.dart';

import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/widgets/customAppbar.dart';
import 'package:notes_app/widgets/custom_Text_feild.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  @override
  Widget build(BuildContext context) {
    String? title, subTitle;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 50),
          CustomAppbar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.sibTitle = subTitle ?? widget.note.sibTitle;
              widget.note.save();
              BlocProvider.of<NoteCubit>(context).fetchNotes();
              Navigator.pop(context);
            },
            title: widget.note.title,
            icon: Icons.check,
          ),
          const SizedBox(height: 32),
          CustomTextFeild(
            onchanged: (value) {
              title = value;
            },

            hint: widget.note.title,
          ),
          const SizedBox(height: 16),
          CustomTextFeild(
            hint: widget.note.sibTitle,
            maxlines: 5,
            onchanged: (value) {
              subTitle = value;
            },
          ),
        ],
      ),
    );
  }
}
