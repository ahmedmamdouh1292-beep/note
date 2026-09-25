// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:notes_app/widgets/customSearchIcon.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.title, required this.icon, this.onPressed});
  final String title;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(height: 50),
        Text(title, style: TextStyle(fontSize: 24)),
        Spacer(),
        CustomIcon(icon: icon, onPressed: onPressed),
      ],
    );
  }
}
