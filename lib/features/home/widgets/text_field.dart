import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  // final String initialValue;
  final TextEditingController controller;
  const CustomTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      //   initialValue: initialValue,
      style: GoogleFonts.robotoSlab(
        fontSize: 20,
      ),
    );
  }
}
