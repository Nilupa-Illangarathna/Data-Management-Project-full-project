import 'package:flutter/material.dart';
import '/classes/responsiveness/responsiveness.dart';

class StyledPassage extends StatelessWidget {
  final String text;

  StyledPassage({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "SF Pro",
        fontSize: 17.0 * HR,
        fontWeight: FontWeight.w400,
        height: 1.25 * HR, // Line height is calculated as 17 * 1.25 = 21.25 (approx. 21)
        letterSpacing: 0.0,
        color: Colors.black,
      ),
      textAlign: TextAlign.left,
    );
  }
}