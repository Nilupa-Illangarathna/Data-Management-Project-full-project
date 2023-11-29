//
// import 'package:flutter/material.dart';
// import '../../Splash _Screen/splash_screen_bouncy_scale_down_image_animation.dart';
// import '../../Splash _Screen/splash_screen_gradually_scale_down_image_animation.dart';
// import '../../Splash _Screen/splash_screen_fade_in_and_bouncy_scale_down_image_animation.dart';
// import '../../Splash _Screen/splash_screen_text_animation.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My App',
//       home: SplashScreen(),
//     );
//   }
// }
//
// class SplashScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AnimatedImage_Fade_In_and_Gradually_Scale_Down_Widget(
//               imageUrl: 'assets/splash screen assets/logo.png',
//               fadeInDuration: Duration(milliseconds: 2500),
//               scaleDownDuration: Duration(seconds: 1, milliseconds: 500),
//               initialSize: 1.0,
//               endSize: 0.6,
//               totalDuration: Duration(seconds: 5),
//             ),
//             AnimatedTextWidget(
//               text: "WonderPal",
//               settings: AnimatedTextSettings(
//                 textLength: 9,
//                 initialFontSize: 180.0,
//                 endingFontSize: 50.0,
//               ),
//               duration: Duration(seconds: 2),
//               textStyle: TextStyle(
//                 fontFamily: "Arial Rounded MT Bold",
//                 fontSize: 72,
//                 color: Colors.blue,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
