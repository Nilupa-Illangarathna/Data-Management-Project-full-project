import 'package:flutter/material.dart';

class AnimatedImage_Gradually_Scale_Down_Widget extends StatefulWidget {
  final String imageUrl;
  final double initialSize;
  final double endSize;
  final Duration fadeInDuration;
  final Duration stayDuration;
  final Duration scaleDownDuration;

  AnimatedImage_Gradually_Scale_Down_Widget({
    required this.imageUrl,
    required this.initialSize,
    required this.endSize,
    required this.fadeInDuration,
    required this.stayDuration,
    required this.scaleDownDuration,
  });

  @override
  _AnimatedImage_Gradually_Scale_Down_WidgetState createState() => _AnimatedImage_Gradually_Scale_Down_WidgetState();
}

class _AnimatedImage_Gradually_Scale_Down_WidgetState extends State<AnimatedImage_Gradually_Scale_Down_Widget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;
  late Animation<double> _scaleDownAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.fadeInDuration + widget.stayDuration + widget.scaleDownDuration,
      vsync: this,
    );

    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _scaleDownAnimation = Tween<double>(begin: widget.initialSize, end: widget.endSize).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeInAnimation.value,
          child: Transform.scale(
            scale: _scaleDownAnimation.value,
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
// AnimatedImage_Gradually_Scale_Down_Widget(
//   imageUrl: 'assets/splash screen assets/logo.png',
//   fadeInDuration: Duration(milliseconds: 150),
//   stayDuration: Duration(milliseconds: 100),
//   scaleDownDuration: Duration(milliseconds: 1500),
//   initialSize: 1.0,
//   endSize: 0.6,
// ),