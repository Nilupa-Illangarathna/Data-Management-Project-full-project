import 'dart:ffi';

import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';

class PriceDetailsWidget extends StatelessWidget {
  final String title;
  final double value;

  PriceDetailsWidget({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15 * HR,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          '\$$value'+"0",
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15 * HR,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
