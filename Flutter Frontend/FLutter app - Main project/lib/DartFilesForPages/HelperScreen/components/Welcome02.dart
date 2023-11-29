import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Welcome02 extends StatelessWidget {
  final AnimationController animationController;

  const Welcome02({Key? key, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _firstHalfAnimation =
        Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.0,
          0.1,
          curve: Curves.easeInOutCubic,
        ),
      ),
    );
    final _secondHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.2,
          0.3,
          curve: Curves.easeInOutCubic,
        ),
      ),
    );
    final _textAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-2, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.2,
          0.3,
          curve: Curves.fastLinearToSlowEaseIn,
        ),
      ),
    );
    final _imageAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-4, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.3,
          0.4,
          curve: Curves.fastLinearToSlowEaseIn,
        ),
      ),
    );

    final _relaxAnimation =
        Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.05,
          0.4,
          curve: Curves.fastLinearToSlowEaseIn,
        ),
      ),
    );
    return SlideTransition(
      position: _firstHalfAnimation,
      child: SlideTransition(
        position: _secondHalfAnimation,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: -10,
              top: 0,
              child: Opacity(
                opacity: 1.0,
                child: Image.asset(
                  'assets/Helper Screen assets/images/Helper02.png',
                  fit: BoxFit.fitHeight,
                ),




              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [


                  SizedBox(height: 25,),

                  SlideTransition(
                    position: _relaxAnimation,
                    child: Text(
                      "Welcome to WanderPal",
                      style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(left: 64, right: 64, bottom: 8, top: 24),
                    child: Text(
                      "Discover your dream vacation destinations with Wanderlust.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                        // fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(left: 64, right: 64, bottom: 8, top: 14),
                    child: Text(
                      "Let's start exploring!",
                      style: TextStyle(
                        // fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.white
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 80,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}