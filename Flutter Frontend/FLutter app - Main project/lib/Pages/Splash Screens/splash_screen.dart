import 'dart:async';
import 'package:flutter/material.dart';
import 'package:main_app/Pages/Welcome%20Screen/welcome_screen.dart';
import '../../Classes/colors.dart';
import '../../Widgets/Image scaling change animator/image_scaler.dart';
import '../../Widgets/Image scaling change animator/image_scaler_bouncy.dart';
import '../../Widgets/Image scaling change animator/image_scaler_elastic.dart';
import '../Helper Screen/helper_screen.dart';

class SplashScreen extends StatefulWidget {
  final Duration delayDuration;
  final bool isHelperScreenCompleted;

  SplashScreen({this.delayDuration = const Duration(), required this.isHelperScreenCompleted});


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(widget.delayDuration * (widget.delayDuration.inMilliseconds/((1000)*(10))), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => widget.isHelperScreenCompleted? WelcomeScreen(): HelperScreen()), //Second is helperScreen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(

        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [

            Positioned(
              left: -100,
              right: -100,
              bottom: -100,
              top: -100,
              child: Opacity(
                opacity: 1.0,
                child: Image.asset(
                  'assets/splash screen assets/images/background.png',

                ),
              ),
            ),

            Positioned(
              left: -5,
              right: -5,
              top: MediaQuery.of(context).size.height * (1/9),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ScalingImageAnimation(
                  imageAddress: 'assets/splash screen assets/images/top_of_background.png',
                  initialWidth: MediaQuery.of(context).size.width,
                  initialHeight: 0.0,
                  endWidth: MediaQuery.of(context).size.width,
                  endHeight: MediaQuery.of(context).size.height,
                  delayInMilliseconds: 1700, // Delay of 1 second (1000 milliseconds)
                  durationInMilliseconds: 50, // Animation duration of 2 seconds (2000 milliseconds)
                ),
              ),
            ),

            Positioned(
              right: 0,
              left: 0,
              bottom: -20,
              child: ScalingImageAnimationWIthElasticEffect(
                imageAddress: 'assets/splash screen assets/images/bottom_grass_right.png',
                initialWidth: MediaQuery.of(context).size.width,
                initialHeight: 0.0,
                endWidth: MediaQuery.of(context).size.width*(1/3),
                endHeight: MediaQuery.of(context).size.width,
                delayInMilliseconds: 2500, // Delay of 1 second (1000 milliseconds)
                durationInMilliseconds: 3200, // Animation duration of 2 seconds (2000 milliseconds)
              ),
            ),

            Positioned(
              right: 0,
              left: 0,
              bottom: -70,
              child: ScalingImageAnimationWIthElasticEffect(
                imageAddress: 'assets/splash screen assets/images/bottom_grass_left.png',
                initialWidth: MediaQuery.of(context).size.width,
                initialHeight: 0.0,
                endWidth: MediaQuery.of(context).size.width,
                endHeight: MediaQuery.of(context).size.width,
                delayInMilliseconds: 3200, // Delay of 1 second (1000 milliseconds)
                durationInMilliseconds: 700, // Animation duration of 2 seconds (2000 milliseconds)
              ),
            ),

            Positioned(
              left: -5,
              right: -5,
              bottom: -35,
              child: ScalingImageAnimation(
                imageAddress: 'assets/splash screen assets/images/bottom_earth.png',
                initialWidth: MediaQuery.of(context).size.width,
                initialHeight: 0.0,
                endWidth: MediaQuery.of(context).size.width,
                endHeight: 200.0,
                delayInMilliseconds: 200, // Delay of 1 second (1000 milliseconds)
                durationInMilliseconds: 1500, // Animation duration of 2 seconds (2000 milliseconds)
              ),
            ),
            Positioned(
              left: -5,
              bottom: -20,
              child: ScalingImageAnimationWIthBouncyEffect(
                imageAddress: 'assets/splash screen assets/images/bottom_left_leaves.png',
                initialWidth: MediaQuery.of(context).size.width * (1/3),
                initialHeight: 0.0,
                endWidth: MediaQuery.of(context).size.width*(1/3),
                endHeight: MediaQuery.of(context).size.width*(1/3),
                delayInMilliseconds: 1900, // Delay of 1 second (1000 milliseconds)
                durationInMilliseconds: 300, // Animation duration of 2 seconds (2000 milliseconds)
              ),
            ),

            Positioned(
              right: -5,
              left: MediaQuery.of(context).size.width * (1/3),
              bottom: -40,
              child: ScalingImageAnimationWIthElasticEffect(
                imageAddress: 'assets/splash screen assets/images/bottom_leaves.png',
                initialWidth: MediaQuery.of(context).size.width,
                initialHeight: 0.0,
                endWidth: MediaQuery.of(context).size.width,
                endHeight: MediaQuery.of(context).size.width*(1/3),
                delayInMilliseconds: 2000, // Delay of 1 second (1000 milliseconds)
                durationInMilliseconds: 500, // Animation duration of 2 seconds (2000 milliseconds)
              ),
            ),
            Positioned(
              top: -40,
              right: -50,
              child: ScalingImageAnimation(
                imageAddress: 'assets/splash screen assets/images/top_right_leaves.png',
                initialWidth: MediaQuery.of(context).size.width * (1/5),
                initialHeight: 0.0,
                endWidth: MediaQuery.of(context).size.width*(4/7),
                endHeight: MediaQuery.of(context).size.width*(3/5),
                delayInMilliseconds: 2300, // Delay of 1 second (1000 milliseconds)
                durationInMilliseconds: 600, // Animation duration of 2 seconds (2000 milliseconds)
              ),
            ),

            Positioned(
              bottom: MediaQuery.of(context).size.height*(3/7),
              right: -30.0,
              child: ScalingImageAnimationWIthElasticEffect(
                imageAddress: 'assets/splash screen assets/images/plane.png',
                initialWidth: MediaQuery.of(context).size.width * (0/5),
                initialHeight: 0.0,
                endWidth: MediaQuery.of(context).size.width*(8/7),
                endHeight: MediaQuery.of(context).size.width*(3/5),
                delayInMilliseconds: 2900, // Delay of 1 second (1000 milliseconds)
                durationInMilliseconds: 4000, // Animation duration of 2 seconds (2000 milliseconds)
              ),
            ),
            //
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height  *  (7/18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedTextWidget(
                      text: "WonderPal",
                      settings: AnimatedTextSettings(
                        textLength: 9,
                        initialFontSize: 200.0,
                        endingFontSize: 100.0,
                      ),
                      duration: Duration(seconds: 2),
                      textStyle: TextStyle(
                        fontFamily: "BlanksscriptpersonaluseBdit",
                        // fontSize: 65,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                      ),
                      delayDuration: Duration(seconds: 2),
                    ),
                  ],
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

class AnimatedTextWidget extends StatefulWidget {
  final String text;
  final AnimatedTextSettings settings;
  final Duration duration;
  final TextStyle textStyle;
  final Duration delayDuration;

  AnimatedTextWidget({
    required this.text,
    required this.settings,
    required this.duration,
    required this.textStyle,
    required this.delayDuration,
  });

  @override
  _AnimatedTextWidgetState createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0, 1, curve: Curves.easeInOut),
    ));

    Future.delayed(widget.delayDuration, () {
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Opacity(
          opacity: _animationController.value,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < widget.text.length; i++)
                AnimatedTextItem(
                  character: widget.text[i],
                  index: i,
                  animation: _animation,
                  settings: widget.settings,
                  textStyle: widget.textStyle,
                ),
            ],
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

class AnimatedTextItem extends StatelessWidget {
  final String character;
  final int index;
  final Animation<double> animation;
  final AnimatedTextSettings settings;
  final TextStyle textStyle;

  AnimatedTextItem({
    required this.character,
    required this.index,
    required this.animation,
    required this.settings,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    double fontSize = (index == 0)
        ? (settings.initialFontSize +
        ((settings.endingFontSize - settings.initialFontSize) *
            animation.value))
        : settings.endingFontSize;

    return Opacity(
      opacity: (animation.value * settings.textLength - index)
          .clamp(0.0, 1.0),
      child: Text(
        character,
        style: textStyle.copyWith(
          fontSize: fontSize,
        ),
      ),
    );
  }
}

class AnimatedTextSettings {
  final int textLength;
  final double initialFontSize;
  final double endingFontSize;

  AnimatedTextSettings({
    required this.textLength,
    required this.initialFontSize,
    required this.endingFontSize,
  });
}

class AnimatedImageFadeInAndGraduallyScaleDownWidget
    extends StatefulWidget {
  final String imageUrl;
  final Duration fadeInDuration;
  final Duration scaleDownDuration;
  final double initialSize;
  final double endSize;
  final Duration totalDuration;
  final Duration delayDuration;

  AnimatedImageFadeInAndGraduallyScaleDownWidget({
    required this.imageUrl,
    required this.fadeInDuration,
    required this.scaleDownDuration,
    required this.initialSize,
    required this.endSize,
    required this.totalDuration,
    required this.delayDuration,
  });

  @override
  _AnimatedImageFadeInAndGraduallyScaleDownWidgetState createState() =>
      _AnimatedImageFadeInAndGraduallyScaleDownWidgetState();
}

class _AnimatedImageFadeInAndGraduallyScaleDownWidgetState
    extends State<AnimatedImageFadeInAndGraduallyScaleDownWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.totalDuration,
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
    await Future.delayed(widget.delayDuration);
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
            child: Opacity(
              opacity: 0.6,
              child: Image.asset(
                widget.imageUrl,
                fit: BoxFit.fitWidth,
              ),
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