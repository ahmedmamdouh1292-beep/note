// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:notes_app/widgets/constants.dart';
// import 'package:notes_app/widgets/constants.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    required this.hint,
    this.maxlines = 1,
    this.onSaved,  this.onchanged,
  });
  final String hint;
  final int maxlines;
  final void Function(String?)? onSaved;
  final void Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:onchanged,
      onSaved: onSaved,
      validator: (value) {
        
        if (value?.isEmpty??true ) return 'field is requared ';
        return null;
      },
      maxLines: maxlines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hint: Text(hint),

        border: outLineBorder(),
        enabledBorder: outLineBorder(),
      ),
    );
  }

  OutlineInputBorder outLineBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
