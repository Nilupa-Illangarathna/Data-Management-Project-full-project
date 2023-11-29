import 'package:flutter/material.dart';
import '/classes/responsiveness/responsiveness.dart';

class Topic extends StatelessWidget {
  final String text;

  const Topic({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 34 * HR,
            fontWeight: FontWeight.w700,
            // lineHeight: 41,
            letterSpacing: -0.4 * WR,
            color: Colors.black, // Set the font color to black
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}

// Usage:
// You can use this widget as follows:
// Topic(text: 'Login')
