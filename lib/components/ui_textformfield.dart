import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:LDVL2024/components/uis.dart';

class UITextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter> ? inputFormatters;
  final String hint;
  final int? maxLength;
  final bool readOnly;
  final bool autofocus;
  final bool? isHideContent;
  final Decoration? decoration;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final Function()? onTap;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;


  UITextFormField({Key? key,
    required this.controller,
    this.validator,
    this.keyboardType,
    this.hint = "",
    this.isHideContent,
    this.decoration,
    this.textAlign,
    this.onChanged,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.readOnly = false,
    this.textCapitalization = TextCapitalization.none,
    this.autofocus = false,
    this.maxLength,
    this.textInputAction,
    this.focusNode,
    this.onTap,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign ?? TextAlign.start,
      autofocus: autofocus,
      controller: controller,
      obscureText: isHideContent ?? false,
      validator: validator,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.black, fontSize: fontMedium),
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      maxLength: maxLength,
      textInputAction: textInputAction,
      focusNode: focusNode,
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0)),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: mPrimaryColor),
        ),
        counterText: '',
        fillColor: Colors.white,
        filled: !readOnly,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
      readOnly: readOnly,
    );
  }
}
