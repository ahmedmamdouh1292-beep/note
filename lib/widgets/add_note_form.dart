import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/widgets/custom_Text_feild.dart';
import 'package:notes_app/widgets/custom_button.dart';

class AddNotaForm extends StatefulWidget {
  const AddNotaForm({super.key});

  @override
  State<AddNotaForm> createState() => _AddNotaFormState();
}

// ignore: camel_case_types
class _AddNotaFormState extends State<AddNotaForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? titel, subtitel;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 32),
          CustomTextFeild(
            hint: 'Titel',
            onSaved: (value) {
              titel = value;
            },
          ),
          const SizedBox(height: 16),
          CustomTextFeild(
            hint: 'content',
            maxlines: 5,
            onSaved: (value) {
              subtitel = value;
            },
          ),
          const SizedBox(height: 80),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoding ? true : false,
                buttonNAme: 'Add',

                onTap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    var currentdate = DateTime.now();
                    var formattedDate =
                        "${currentdate.day}-${currentdate.month}-${currentdate.year} ${currentdate.hour}:${currentdate.minute}:${currentdate.second}";
                    var notemodel = NoteModel(
                      title: titel!,
                      sibTitle: subtitel!,
                      date: formattedDate,
                      color: 0xfff4f4f4,
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(notemodel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
