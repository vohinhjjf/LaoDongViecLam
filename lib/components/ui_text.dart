import 'package:flutter/material.dart';

class UIText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double textFontSize;
  final bool isBold;
  final TextStyle? textStyle;
  final TextAlign? textAlign;

  const UIText(
      {Key? key,
      required this.text,
      this.textColor = Colors.black,
      this.textFontSize = 16,
      this.isBold = false,
      this.textStyle,
      this.textAlign = TextAlign.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
              color: textColor,
              fontSize: textFontSize,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal)
          .merge(textStyle),
    );
  }
}