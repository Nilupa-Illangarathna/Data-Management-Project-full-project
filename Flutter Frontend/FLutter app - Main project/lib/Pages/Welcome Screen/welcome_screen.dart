import 'package:flutter/material.dart';
import '../../Pages/App Drawer/app_drawer.dart';
import '../../Classes/random_image_selector.dart';
import 'package:lottie/lottie.dart';
import '../../Classes/colors.dart';

class WelcomeScreen extends StatefulWidget {

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final RandomImageSelectorOBJ = RandomImageSelectorClass();

  // Load your animation here
  String animationPath = 'assets/Homescreen/JSON animations/swipe_up_json_animation_light.json';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: HexColor("#131424"),
      // backgroundColor: Colors.red,
      body:
      Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.up,
        onDismissed: (_) {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 500),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0, 1),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
              pageBuilder: (context, animation, secondaryAnimation) {
                return NavigationHomeScreen();
              },
            ),
          );
        },
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Lottie.asset(
                  animationPath,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: 30,)
              ],
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Swipe up',
                    style: TextStyle(
                      // fontFamily: "Moonkids",
                      fontSize: 50,
                      color: Colors.black38,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  SizedBox(height: 1,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//
// // // Calling it
// // GoogleMapLocation(
// // locationArr: [37.7749, -122.4194], // Example coordinates
// // apiKey: 'YOUR_API_KEY',
// // );
//
