import 'package:flutter/material.dart';
import '/classes/responsiveness/responsiveness.dart';

class ForgotPasswordButtonBar extends StatelessWidget {
  final String forgotPasswordText;
  final Function onForgotPasswordPress;
  final Function onClosePress;

  ForgotPasswordButtonBar({
    required this.forgotPasswordText,
    required this.onForgotPasswordPress,
    required this.onClosePress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RightSidedBlueTextButton(
          text: forgotPasswordText,
          onPress: onForgotPasswordPress,
        ),
        RightSidedBlueTextButton(
          text: "Close",
          onPress: onClosePress,
        ),
      ],
    );
  }
}

class RightSidedBlueTextButton extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final double letterSpacing;
  final Function onPress;

  RightSidedBlueTextButton({
    required this.text,
    required this.onPress,
    this.color = const Color(0xFF007AFF),
    this.fontSize = 15.0, //Adding HR is Done below
    this.fontWeight = FontWeight.w600,
    this.letterSpacing = -0.4000000059604645, //Adding WR is Done below
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPress != null) {
          onPress();
        }
      },
      child: Text(
        text,
        style: TextStyle(
          fontFamily: "SF Pro",
          fontSize: fontSize * HR,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing * WR,
          color: color,
        ),
      ),
    );
  }
}
