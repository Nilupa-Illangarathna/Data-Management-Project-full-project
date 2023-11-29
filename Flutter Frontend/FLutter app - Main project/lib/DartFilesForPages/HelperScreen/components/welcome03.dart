import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Welcome03 extends StatelessWidget {
  final AnimationController animationController;

  const Welcome03({Key? key, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _firstHalfAnimation =
        Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.2,
        0.3,
        curve: Curves.easeInOutCubic,
      ),
    ));
    final _secondHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.4,
        0.5,
        curve: Curves.easeInOutCubic,
      ),
    ));
    final _relaxFirstHalfAnimation =
        Tween<Offset>(begin: Offset(2, 0), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.2,
        0.3,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final _relaxSecondHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-2, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.4,
        0.5,
        curve: Curves.elasticIn,
      ),
    ));

    final _imageFirstHalfAnimation =
        Tween<Offset>(begin: Offset(4, 0), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.2,
        0.3,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final _imageSecondHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-4, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.4,
        0.5,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    return SlideTransition(
      position: _firstHalfAnimation,
      child: SlideTransition(
        position: _secondHalfAnimation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Stack(
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Lottie.asset(
                      'assets/Helper Screen assets/images/Helper 03 0.json',
                      fit: BoxFit.fitWidth,
                    ),

                    Lottie.asset(
                      'assets/Helper Screen assets/images/Helper 03 1.json',
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
              ),


              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //
                  SizedBox(
                    height: 1,
                  ),
                  Column(
                    children: [
                      SlideTransition(
                        position: _imageFirstHalfAnimation,
                        child: SlideTransition(
                          position: _imageSecondHalfAnimation,
                          child: Text(
                            "Based on Reviews",
                            style:
                            TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold, color: Colors.black54 ),
                          ),
                        ),
                      ),
                      SlideTransition(
                        position: _relaxFirstHalfAnimation,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 64, right: 64, top: 16, bottom: 16),
                          child: Text(
                            "This app suggests destinations based on reviews from fellow travelers, ensuring personalized recommendations for your vacation.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black45 ),

                          ),
                        ),
                      ),

                      Column(
                        children: [
                          Padding(
                            padding:
                            EdgeInsets.only(left: 64, right: 64, bottom: 16, top: 16),
                            child: Text(
                              "Welcome to the reality",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Colors.black45
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // SizedBox(height: 1,),
                  SizedBox(height: 1,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
