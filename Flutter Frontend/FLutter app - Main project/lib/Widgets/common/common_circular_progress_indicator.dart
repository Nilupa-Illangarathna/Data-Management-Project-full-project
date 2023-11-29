import "package:flutter/material.dart";
import "/Classes/responsiveness/responsiveness.dart";

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20 * WR,
      width: 20 * WR,
      child: CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 3 * WR,
      ),
    );
  }
}
