import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/cubits/cubit/note_cubit.dart';
import 'package:notes_app/widgets/add_note_form.dart';
// // import 'package:notes_app/widgets/constants.dart';
// import 'package:notes_app/widgets/custom_Text_feild.dart';
// import 'package:notes_app/widgets/custom_button.dart';

// ignore: camel_case_types
class addNoteButtonSeeet extends StatelessWidget {
  const addNoteButtonSeeet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailuer) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.erorrMessage),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
            );
          }
          if (state is AddNoteSuccess) {
            BlocProvider.of<NoteCubit>(context).fetchNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoding ? true : false,
            
            child: Padding(
              padding:  EdgeInsets.only(   right: 16,left: 16,bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(child: AddNotaForm()),
            ));
        },
      ),
    );
  }
}
