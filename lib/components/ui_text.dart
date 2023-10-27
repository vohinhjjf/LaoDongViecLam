import 'package:flutter/material.dart';

class UIText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double textFontSize;
  final int maxLines;
  final bool isBold;
  final TextStyle? textStyle;
  final TextAlign? textAlign;

  const UIText(
      {Key? key,
      required this.text,
      this.textColor = Colors.black,
      this.textFontSize = 16,
      this.maxLines = 15,
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
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class UIRichText extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final Color textColor;
  final double textFontSize;
  final TextStyle? textStyle;

  const UIRichText(
      {Key? key,
        required this.text1,
        required this.text2,
        required this.text3,
        this.textColor = Colors.black,
        this.textFontSize = 16,
        this.textStyle,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text1,
        style: TextStyle(
            color: textColor,
            fontSize: textFontSize,
            fontWeight: FontWeight.normal)
            .merge(textStyle),
        children: <TextSpan>[
          TextSpan(
            text: text2,
            style: TextStyle(
                color: textColor,
                fontSize: textFontSize,
                fontWeight: FontWeight.bold)
                .merge(textStyle),
          ),
          TextSpan(
            text: text3,
            style: TextStyle(
                color: textColor,
                fontSize: textFontSize,
                fontWeight: FontWeight.normal)
                .merge(textStyle),
          ),
        ],
      ),
    );
  }
}