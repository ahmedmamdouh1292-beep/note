// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/widgets/customAppbar.dart';
import 'package:notes_app/widgets/customNotesListView.dart';
// import 'package:notes_app/widgets/custonNoteItem.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {                         
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [     

                            
          CustomAppbar(title: 'Edit', icon: Icons.search),

          Expanded(child: CustomNotesListView()),
        ],
      ),
    );
  }
}                 
 
  
   
     

      
       

        
      
