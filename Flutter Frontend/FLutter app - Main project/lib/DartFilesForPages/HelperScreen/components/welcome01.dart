import 'package:flutter/material.dart';
import '../../../Classes/colors.dart';

class Welcome01 extends StatefulWidget {
  final AnimationController animationController;

  const Welcome01({Key? key, required this.animationController})
      : super(key: key);

  @override
  _Welcome01State createState() => _Welcome01State();
}

class _Welcome01State extends State<Welcome01> {

  final colors_object = ColorsClass();

  @override
  Widget build(BuildContext context) {
    final _introductionanimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(0.0, -1.0))
            .animate(CurvedAnimation(
      parent: widget.animationController,
      curve: Interval(
        0.0,
        0.25,
        curve: Curves.elasticOut,
        // curve: Curves.elasticOut,
        // curve: Curves.easeInCirc,
        // curve: Curves.easeInBack,
        // curve: Curves.bounceIn,

      ),
    ));
    return SlideTransition(
      position: _introductionanimation,
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
                'assets/Helper Screen assets/images/Helper01.png',
                // fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * (2/5),
              color: Colors.white,
            )
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  "   Hello!!!",
                  style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w100,
                      color: Colors.teal
                  ),

                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 64, right: 64),
                child: Text(
                  "Thanks for installing your friendly travel location finder app.",
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 64, right: 64),
                child: Text(
                  "WonderPal",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "BlanksscriptpersonaluseBdit",
                    fontSize: 35,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom + 16),
                child: InkWell(
                  onTap: () {
                    widget.animationController.animateTo(0.2);
                  },
                  child: Container(
                    // height: 58,
                    padding: EdgeInsets.only(
                      left: 56.0,
                      right: 56.0,
                      top: 12,
                      bottom: 12,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(38.0),
                      color: colors_object.BasicButtonColor,
                    ),
                    child: Text(
                      "Let's begin",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
