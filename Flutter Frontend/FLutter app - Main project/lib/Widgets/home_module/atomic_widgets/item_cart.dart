import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';

class ItemCart extends StatelessWidget {
  final String imagePath; // Path to the custom image
  final int number;
  final void Function()? onClick; // Updated function type

  ItemCart({
    required this.imagePath,
    required this.number,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8 * WR),
          child: Container(
            height: 39 * HR,
            width: 39 * WR,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xFFFFEAC2),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.0 * WR, vertical: 2.0 * HR),
              child: IconButton(
                icon: Image.asset(imagePath), // Load the image from assets
                onPressed: onClick,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 4 * WR,
          child: InkWell(
            onTap: onClick,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4 * WR, vertical: 4 * HR),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                number.toString(),
                style: TextStyle(
                  fontSize: 11 * HR,
                  color: Colors.white,
                  letterSpacing: 0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
