import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';

class TopicWithBlueButton extends StatefulWidget {
  final String text1;
  final String text2;
  final VoidCallback? onPressed;

  TopicWithBlueButton({
    required this.text1,
    required this.text2,
    this.onPressed,
  });

  @override
  State<TopicWithBlueButton> createState() => _TopicWithBlueButtonState();
}

class _TopicWithBlueButtonState extends State<TopicWithBlueButton> {
  ThemeData get theme => Theme.of(context);
  bool isDarkTheme = false;
  late Color containerColor;

  @override
  Widget build(BuildContext context) {
    isDarkTheme = theme.brightness == Brightness.dark;
    containerColor = isDarkTheme? Colors.black.withOpacity(0.3) :theme.primaryColor.withOpacity(0.15);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.text1,
          style: TextStyle(
            // fontFamily: 'SF Pro',
            fontSize: 22 * HR,
            fontWeight: FontWeight.w400,
            color: isDarkTheme? Colors.grey.withOpacity(0.9) :theme.primaryColor.withOpacity(0.4),
          ),
        ),
        TextButton(
          onPressed: widget.onPressed,
          child: Text(
            widget.text2,
            style: TextStyle(
              // fontFamily: 'SF Pro',
              fontSize: 15 * HR,
              fontWeight: FontWeight.w200,
              color: isDarkTheme ? Colors.white : Color(0xFF7092BE),
            ),
          ),
        ),
      ],
    );
  }
}
