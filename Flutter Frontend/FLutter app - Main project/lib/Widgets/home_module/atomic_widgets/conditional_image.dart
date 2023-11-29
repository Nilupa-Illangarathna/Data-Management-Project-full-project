import 'package:flutter/material.dart';
import '/API_Classes/global_applications/global_applications.dart';

class ConditionalImage extends StatelessWidget {
  final String imageUrl;

  ConditionalImage({
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return !currently_simulating
        ? Image.network(
      imageUrl,
      fit: BoxFit.cover,

    )
        : Image.asset(
      imageUrl,
      fit: BoxFit.cover,

    );
  }
}
