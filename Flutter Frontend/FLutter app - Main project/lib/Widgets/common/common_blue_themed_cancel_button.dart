import 'package:flutter/material.dart';
import '/classes/responsiveness/responsiveness.dart';

class MainBlueCancelButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const MainBlueCancelButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56 * HR,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: const Color(0xFFf2f2f7), // Background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'SF Pro',
            fontSize: 17 * HR,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            height: 22 * HR / 17, // Calculate line height from font size and line height
            letterSpacing: -0.4000000059604645 * WR,
          ),
        ),
      ),
    );
  }
}
