import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/cubits/cubit/note_cubit.dart';

import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/simple_bloc_obeserver.dart';

import 'package:notes_app/views/homeView.dart';
import 'package:notes_app/widgets/constants.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObeserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotebox);

  runApp(const notesApp());
}

// ignore: camel_case_types
class notesApp extends StatelessWidget {
  const notesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit()..fetchNotes(),
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'assets/fonts/Poppins-Regular.ttf',
        ),
        debugShowCheckedModeBanner: false,
        home: Homeview(),
      ),
    );
  }
}
