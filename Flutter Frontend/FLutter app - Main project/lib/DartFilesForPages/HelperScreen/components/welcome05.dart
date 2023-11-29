import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  final AnimationController animationController;
  const WelcomeView.Welcome_05({Key? key, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _firstHalfAnimation =
        Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.6,
          0.7,
          curve: Curves.easeInOutCubic,
        ),
      ),
    );
    final _secondHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.8,
          1.0,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    final _welcomeFirstHalfAnimation =
        Tween<Offset>(begin: Offset(2, 0), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    final _welcomeImageAnimation =
        Tween<Offset>(begin: Offset(4, 0), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    return SlideTransition(
      position: _firstHalfAnimation,
      child: SlideTransition(
        position: _secondHalfAnimation,
        child: Stack(
          children: [

            Positioned(
              left: -50,
              right: -50,
              bottom: -70,
              top: -50,
              child: Opacity(
                opacity: 1.0,
                child: Image.asset(
                  'assets/Helper Screen assets/images/Helper05.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height:60,),
                  SlideTransition(
                    position: _welcomeImageAnimation,
                    child: Center(
                      child: Text(
                        "Welcome",
                        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  // SizedBox(height:60,),
                  SlideTransition(
                    position: _welcomeFirstHalfAnimation,
                    child: Padding(
                      padding:
                      EdgeInsets.only(left: 64, right: 64, top: 16, bottom: 16),
                      child: Text(
                        "Ok you are good to go",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  SizedBox(height: 70,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
