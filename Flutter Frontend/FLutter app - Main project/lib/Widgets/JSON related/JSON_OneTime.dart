import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:convert' as convert;
import 'package:flutter/services.dart' show rootBundle;

class JSONOneTimeLottie extends StatefulWidget {
  final String jsonPath;

  JSONOneTimeLottie({required this.jsonPath});

  @override
  _JSONOneTimeLottieState createState() => _JSONOneTimeLottieState();
}

class _JSONOneTimeLottieState extends State<JSONOneTimeLottie> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Future<double> _animationDurationFuture;

  @override
  void initState() {
    super.initState();
    _animationDurationFuture = _loadAnimationDuration().then((duration) {
      _controller = AnimationController(vsync: this, duration: Duration(milliseconds: duration.toInt()));
      _controller.forward(); // Start the animation
      _controller.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.stop(); // Stop the animation after one cycle
        }
      });
      return duration;
    });
  }

  Future<double> _loadAnimationDuration() async {
    final animationData = await rootBundle.loadString(widget.jsonPath);
    final animationMap = convert.jsonDecode(animationData) as Map<String, dynamic>;
    final frameRate = animationMap['fr'] != null ? animationMap['fr'].toDouble() : 0.0;
    final numFrames = animationMap['op'] != null ? animationMap['op'] - animationMap['ip'] : 0.0;
    final duration = numFrames > 0 ? (numFrames / frameRate) * 1000 : 0.0;
    return duration;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<double>(
      future: _animationDurationFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final width = constraints.maxWidth;
              final height = constraints.maxHeight;
              return Center(
                child: Container(
                  width: width,
                  height: height,
                  child: LottieBuilder.asset(
                    widget.jsonPath,
                    controller: _controller,
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
          );
        } else {
          return Center(child: Text('Error loading animation duration.'));
        }
      },
    );
  }
}
