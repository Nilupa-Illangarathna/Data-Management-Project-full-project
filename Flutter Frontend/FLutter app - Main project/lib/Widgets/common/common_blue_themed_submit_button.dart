import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/Widgets/common/common_circular_progress_indicator.dart';

class MainBlueSubmitButton extends StatefulWidget {
  final String text;
  final double height;
  final Function() onPressed;
  bool? inProgress = false;

  MainBlueSubmitButton({
    required this.text,
    required this.height,
    required this.onPressed,
    this.inProgress,
  });

  @override
  State<MainBlueSubmitButton> createState() => _MainBlueSubmitButtonState();
}

class _MainBlueSubmitButtonState extends State<MainBlueSubmitButton> {
  ThemeData get theme => Theme.of(context);
  bool isDarkTheme = false;
  late Color containerColor;

  @override
  Widget build(BuildContext context) {
    isDarkTheme = theme.brightness == Brightness.dark;
    containerColor = isDarkTheme? Colors.black.withOpacity(0.3) :theme.primaryColor.withOpacity(0.15);
    return SizedBox(
      // height: 56,
      height: widget.height,
      width: widget.height > 50 * HR
          ? double.infinity
          : MediaQuery.of(context).size.width * WR / 2,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          //elevation: height == 56 * HR ? 2 : 1, reported as bug and changed to 0 elavation
          elevation: 0,
          backgroundColor: isDarkTheme? theme.primaryColor.withOpacity(0.3) :theme.primaryColor.withOpacity(0.5),

      shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: widget.inProgress ?? false
            ?  LoadingIndicator()
            : Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 17 * HR,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  height: 22 * HR / 17, // Calculate line height from font size and line height
                  letterSpacing: -0.4000000059604645 * WR,
                ),
              ),
      ),
    );
  }
}
