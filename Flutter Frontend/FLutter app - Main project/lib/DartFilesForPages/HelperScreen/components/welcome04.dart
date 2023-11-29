import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../Widgets/JSON related/JSON_OneTime.dart';

class Welcome_04 extends StatelessWidget {
  final AnimationController animationController;

  const Welcome_04({Key? key, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _firstHalfAnimation =
        Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.4,
        0.5,
        curve: Curves.easeInOutCubic,
      ),
    ));
    final _secondHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.6,
        0.7,
        curve: Curves.easeInOutCubic,
      ),
    ));

    final _moodFirstHalfAnimation =
        Tween<Offset>(begin: Offset(2, 0), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.4,
        0.5,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final _moodSecondHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-2, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.6,
        0.7,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final _imageFirstHalfAnimation =
        Tween<Offset>(begin: Offset(4, 0), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.4,
        0.5,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final _imageSecondHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-4, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.6,
        0.7,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    return SlideTransition(
      position: _firstHalfAnimation,
      child: SlideTransition(
        position: _secondHalfAnimation,
        child: Stack(
          children: [

            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 1/10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 0, left: MediaQuery.of(context).size.width * 1/10, right: MediaQuery.of(context).size.width * 1/10,),
                    child:
                    Lottie.asset(
                      'assets/Helper Screen assets/images/Helper 04 0.json',
                      fit: BoxFit.fitWidth,

                    ),
                  ),
                  SizedBox(height: 1,),
                  SizedBox(height: 1,),
                  SizedBox(height: 1,),
                  Padding(
                    padding: EdgeInsets.only(bottom: 100, left: MediaQuery.of(context).size.width * 1/40, right: MediaQuery.of(context).size.width * 1/40,),
                    child: Lottie.asset(
                      'assets/Helper Screen assets/images/Helper 04 123.json',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(height: 10,)
                ],
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 250,),
                Text(
                  "Work life balance",
                  style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold, color: Colors.black54),
                ),

                SlideTransition(
                  position: _imageFirstHalfAnimation,
                  child: SlideTransition(
                    position: _imageSecondHalfAnimation,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 32, right: 32, top: 16, bottom: 0),
                          child: Text(
                            "Ready to make your dream vacation a reality?",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black45),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

                SlideTransition(
                  position: _moodFirstHalfAnimation,
                  child: SlideTransition(
                    position: _moodSecondHalfAnimation,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 32, right: 32, top: 8, bottom: 8),
                          child: Text(
                            "We'll hook you up with awesome suggestions based on what you're into. Let's find your perfect getaway!",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black45),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 170,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
