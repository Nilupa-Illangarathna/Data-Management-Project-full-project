import 'package:flutter/material.dart';
import 'dart:async';

class ScalingImageAnimationWIthBouncyEffect extends StatefulWidget {
  final String imageAddress;
  final double initialWidth;
  final double initialHeight;
  final double endWidth;
  final double endHeight;
  final int delayInMilliseconds;
  final int durationInMilliseconds;

  ScalingImageAnimationWIthBouncyEffect({
    required this.imageAddress,
    required this.initialWidth,
    required this.initialHeight,
    required this.endWidth,
    required this.endHeight,
    required this.delayInMilliseconds,
    required this.durationInMilliseconds,
  });

  @override
  _ScalingImageAnimationWIthBouncyEffectState createState() => _ScalingImageAnimationWIthBouncyEffectState();
}

class _ScalingImageAnimationWIthBouncyEffectState extends State<ScalingImageAnimationWIthBouncyEffect>
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
        curve: Curves.bounceOut, // Use the bounceOut curve for a bouncy effect
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
            fit: BoxFit.fitWidth,
            width: widget.initialWidth +
                (_animation.value * (widget.endWidth - widget.initialWidth)),
          ),
        );
      },
    );
  }
}









// // Calling it
// ScalingImageAnimationWIthBouncyEffect(
// imageAddress: 'path/to/image.png',
// initialWidth: 100.0,
// initialHeight: 100.0,
// endWidth: 200.0,
// endHeight: 200.0,
// delayInMilliseconds: 500,
// durationInMilliseconds: 1000,
// )
