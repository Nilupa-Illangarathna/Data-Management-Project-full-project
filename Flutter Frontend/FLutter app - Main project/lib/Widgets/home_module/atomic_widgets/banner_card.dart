import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';

class BannerCard extends StatelessWidget {
  final String imagePath;

  BannerCard({
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 113 * HR, // Set the desired height// Set the desired margin
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
