import 'package:flutter/material.dart';

class AnimatedImageContainer extends StatefulWidget {
  final String assetAddress;
  final double containerWidth;
  final double containerHeight;
  final double imageWidthFactor;
  final bool startAnimation;
  final Curve curve;

  AnimatedImageContainer({
    required this.assetAddress,
    required this.containerWidth,
    required this.containerHeight,
    required this.imageWidthFactor,
    required this.startAnimation,
    this.curve = Curves.linear, // Default to linear curve
  });

  @override
  _AnimatedImageContainerState createState() =>
      _AnimatedImageContainerState();
}

class _AnimatedImageContainerState extends State<AnimatedImageContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isAnimating = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);

    // Start the animation when 'startAnimation' is true
    if (widget.startAnimation) {
      _startAnimation();
    }
  }

  void _startAnimation() {
    setState(() {
      isAnimating = true;
      _controller.forward();
    });
  }

  @override
  void didUpdateWidget(covariant AnimatedImageContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Start the animation when 'startAnimation' is true and has changed
    if (widget.startAnimation && widget.startAnimation != oldWidget.startAnimation) {
      _startAnimation();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget myImage = Image.asset(
      widget.assetAddress,
      height: widget.containerHeight,
      fit: BoxFit.contain,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: widget.containerWidth,
          height: widget.containerHeight,
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: _controller.duration!,
                left: isAnimating
                    ? _animation.value *
                    (widget.containerWidth - widget.containerHeight)
                    : 0.0,
                child: myImage,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
