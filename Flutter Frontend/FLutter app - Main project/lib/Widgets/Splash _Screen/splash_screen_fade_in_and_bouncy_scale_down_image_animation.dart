import 'package:flutter/material.dart';



class AnimatedImage_Fade_In_and_Gradually_Scale_Down_Widget extends StatefulWidget {
  final String imageUrl;
  final Duration fadeInDuration;
  final Duration scaleDownDuration;
  final double initialSize;
  final double endSize;
  final Duration totalDuration;

  AnimatedImage_Fade_In_and_Gradually_Scale_Down_Widget({
    required this.imageUrl,
    required this.fadeInDuration,
    required this.scaleDownDuration,
    required this.initialSize,
    required this.endSize,
    required this.totalDuration,
  });

  @override
  _AnimatedImage_Fade_In_and_Gradually_Scale_Down_WidgetState createState() =>
      _AnimatedImage_Fade_In_and_Gradually_Scale_Down_WidgetState();
}

class _AnimatedImage_Fade_In_and_Gradually_Scale_Down_WidgetState
    extends State<AnimatedImage_Fade_In_and_Gradually_Scale_Down_Widget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.8, curve: Curves.easeInOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: widget.initialSize, end: widget.endSize).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.6, 1.0, curve: Curves.easeInOut),
      ),
    );

    _startAnimation();
  }

  void _startAnimation() async {
    await Future.delayed(Duration(milliseconds: 400));

    _animationController.duration = widget.fadeInDuration;
    _animationController.forward();

    await Future.delayed(widget.fadeInDuration + Duration(milliseconds: 150));

    _animationController.duration = widget.scaleDownDuration;
    _animationController.forward();

    await Future.delayed(widget.totalDuration - widget.fadeInDuration - widget.scaleDownDuration);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: Image.asset(
              widget.imageUrl,
              fit: BoxFit.fitWidth,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}





// //Calling
// AnimatedImage_Fade_In_and_Gradually_Scale_Down_Widget(
// imageUrl: 'assets/splash screen assets/logo.png',
// fadeInDuration: Duration(milliseconds: 2500),
// scaleDownDuration: Duration(seconds: 1, milliseconds: 500),
// initialSize: 1.0,
// endSize: 0.6,
// totalDuration: Duration(seconds: 5),
// ),
