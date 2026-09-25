import 'package:flutter/material.dart';
import 'package:notes_app/widgets/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.buttonNAme, this.onTap,  this.isLoading=false});
  final String buttonNAme;
  final void Function()? onTap;
  final bool isLoading ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kPrimaryColor,
        ),
        height: 55,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : Text(
                  buttonNAme,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
