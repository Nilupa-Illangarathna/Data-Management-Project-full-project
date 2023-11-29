import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';

class CustomTextPassage extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final Color fontColor;
  final TextAlign alignment;
  final double fontSize;

  CustomTextPassage({
    required this.text,
    this.fontWeight = FontWeight.w400,
    this.fontColor = Colors.black,
    this.alignment = TextAlign.left,
    this.fontSize = 15.0,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment,
      style: TextStyle(
        fontFamily: "SF Pro",
        fontSize: fontSize * HR,
        fontWeight: fontWeight,
        letterSpacing: -0.4000000059604645 * WR,
        color: fontColor,
      ),
    );
  }
}
