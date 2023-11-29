import 'package:flutter/material.dart';

class AnimatedImage_Bouncy_Scale_Down_Widget extends StatefulWidget {
  final String imageUrl;
  final Duration fadeInDuration;
  final Duration stayDuration;
  final Duration scaleDownDuration;
  final double initialSize;
  final double endSize;

  AnimatedImage_Bouncy_Scale_Down_Widget({
    required this.imageUrl,
    required this.fadeInDuration,
    required this.stayDuration,
    required this.scaleDownDuration,
    required this.initialSize,
    required this.endSize,
  });

  @override
  _AnimatedImage_Bouncy_Scale_Down_WidgetState createState() => _AnimatedImage_Bouncy_Scale_Down_WidgetState();
}

class _AnimatedImage_Bouncy_Scale_Down_WidgetState extends State<AnimatedImage_Bouncy_Scale_Down_Widget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.fadeInDuration + widget.stayDuration + widget.scaleDownDuration,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, widget.fadeInDuration.inMilliseconds / _animationController.duration!.inMilliseconds),
      ),
    );

    _scaleAnimation = Tween<double>(begin: widget.initialSize, end: widget.endSize).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          (widget.fadeInDuration.inMilliseconds + widget.stayDuration.inMilliseconds) / _animationController.duration!.inMilliseconds,
          1.0,
          curve: Curves.bounceOut,
        ),
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
// AnimatedImage_Bouncy_Scale_Down_Widget(
//   imageUrl: 'assets/splash screen assets/logo.png',
//   fadeInDuration: Duration(milliseconds: 150),
//   stayDuration: Duration(milliseconds: 100),
//   scaleDownDuration: Duration(milliseconds: 1500),
//   initialSize: 1.0,
//   endSize: 0.6,
// ),