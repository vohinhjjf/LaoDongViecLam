import 'package:flutter/material.dart';

class UITextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hint;
  final bool? isHideContent;
  final Decoration? decoration;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final Function(String)? onChanged;


  const UITextFormField({Key? key,
    required this.controller,
    this.validator,
    required this.hint,
    this.isHideContent,
    this.decoration,
    this.textStyle,
    this.textAlign,
    this.onChanged,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isHideContent ?? false,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),

      ),
    );
  }
}
