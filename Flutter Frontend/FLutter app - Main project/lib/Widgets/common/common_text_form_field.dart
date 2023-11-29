import 'package:flutter/material.dart';
import '/classes/responsiveness/responsiveness.dart';
import '/classes/data_validation/validation_data.dart'; // Import the validation data

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final String validationKey;
  final bool
      isPassword; // Add a new property to indicate if it's a password field
  final String errorMsg;
  final bool? isSizeMedium;
  String? Function(String?)? validate;
  CustomTextFormField(
      {required this.labelText,
      required this.controller,
      required this.validationKey,
      required this.errorMsg,
      this.isPassword = false, // Default to a regular text field
      this.isSizeMedium, //true means login screen type textform fields
      this.validate});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword, // Set obscureText based on isPassword

      decoration: InputDecoration(
          counterText: "",
          labelText: labelText,
          errorMaxLines: 4,
          labelStyle: const TextStyle(
            color: Color(0xFF7F7F7F),
          ),
          errorStyle: const TextStyle(
            color: Colors.red,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0 * WR,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:
                  isSizeMedium ?? false ? Color(0xFF7F7F7F) : Color(0xFFE2E2E2),
              width: 1.0 * WR,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0 * WR,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              width: 1.0 * WR,
              color: Color(0xFF7F7F7F),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              width: 1.0 * WR,
              color:
                  isSizeMedium ?? false ? Color(0xFF7F7F7F) : Color(0xFFE2E2E2),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
              vertical: isSizeMedium ?? false ? 17.5 : 10, horizontal: 16)),
      //vertical 10 means 48px
      //vertical 17.5 means 54px

      validator: validate != null
          ? validate
          : (value) {
              final regexPattern = validationRegex[validationKey];
              if (regexPattern != null && value != null) {
                final regex = RegExp(regexPattern);
                if (!regex.hasMatch(value)) {
                  return errorMsg;
                }
              }
              return null;
            },
    );
  }
}
