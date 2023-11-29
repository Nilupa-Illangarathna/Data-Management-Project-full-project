import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';

class SingleRating extends StatelessWidget {
  final String iconPath;
  final String label;
  final String value;

  SingleRating({
    required this.iconPath,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(iconPath, width: 14 * WR, height: 14 * HR),
            SizedBox(width: 4 * WR),
            Text(
              value,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15 * HR,
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12 * HR,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}