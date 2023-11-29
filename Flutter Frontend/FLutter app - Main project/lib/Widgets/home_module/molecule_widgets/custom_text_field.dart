import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback? onSuffixIconPressed;

  CustomTextField({
    required this.controller,
    required this.hintText,
    this.onSuffixIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFE0E0E0),
            width: 1 * WR,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF007AFF),
            width: 1 * WR,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hintText,
        suffixIcon: GestureDetector(
          onTap: onSuffixIconPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0 * WR, vertical: 16.0 * HR),
            child: Text(
              "Remove",
              style: TextStyle(
                color: Color(0xFF8E8E93),
                decoration: TextDecoration.none,
                fontSize: 17 * HR,
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
