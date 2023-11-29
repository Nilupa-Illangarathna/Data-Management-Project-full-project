import 'package:flutter/material.dart';
import 'dart:async';

class ScalingImageAnimation extends StatefulWidget {
  final String imageAddress;
  final double initialWidth;
  final double initialHeight;
  final double endWidth;
  final double endHeight;
  final int delayInMilliseconds;
  final int durationInMilliseconds;

  ScalingImageAnimation({
    required this.imageAddress,
    required this.initialWidth,
    required this.initialHeight,
    required this.endWidth,
    required this.endHeight,
    required this.delayInMilliseconds,
    required this.durationInMilliseconds,
  });

  @override
  _ScalingImageAnimationState createState() => _ScalingImageAnimationState();
}

class _ScalingImageAnimationState extends State<ScalingImageAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: widget.durationInMilliseconds),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticIn, // Use the bounceOut curve for a bouncy effect
      ),
    );
    Future.delayed(Duration(milliseconds: widget.delayInMilliseconds), () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: _animation.value,
          child: Image.asset(
            widget.imageAddress,
            width: widget.initialWidth +
                (_animation.value * (widget.endWidth - widget.initialWidth)),
            height: widget.initialHeight +
                (_animation.value * (widget.endHeight - widget.initialHeight)),
          ),
        );
      },
    );
  }
}








// // Calling it