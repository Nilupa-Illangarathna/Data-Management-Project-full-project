import 'package:flutter/material.dart';
import '/classes/responsiveness/responsiveness.dart';

class CustomImageButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  CustomImageButton({required this.imagePath, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed, // Execute the provided function when tapped
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: 48.0 * WR,
        height: 48.0 * HR,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            width: 0.0,
            color: Colors.transparent,
          ),
        ),
        child: Image.asset(
          imagePath,
          width: 48.0 * WR,
          height: 48.0 * HR,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
