import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:main_app/Widgets/home_module/atomic_widgets/animated_image.dart';
import '/API_Classes/global_applications/global_applications.dart';
import '/Classes/responsiveness/responsiveness.dart';
import '/Classes/text_related/text_truncator.dart';
import '/Widgets/home_module/atomic_widgets/conditional_image.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  ThemeData get theme => Theme.of(context);
  bool isDarkTheme = false;
  late Color containerColor;

  @override
  Widget build(BuildContext context) {
    isDarkTheme = theme.brightness == Brightness.dark;
    containerColor = isDarkTheme
        ? Colors.black.withOpacity(0.3)
        : theme.primaryColor.withOpacity(0.15);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Lottie.asset(
                    'assets/Homescreen/JSON animations/loading.json', // Replace with your Lottie animation file path
                    fit: BoxFit.fitHeight,
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            ],
          ),
          Container(
            color: containerColor,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          )
        ],
      ),
    );
  }
}








// import 'package:flutter/material.dart';
// import 'package:main_app/Widgets/home_module/atomic_widgets/animated_image.dart';
// import '/API_Classes/global_applications/global_applications.dart';
// import '/Classes/responsiveness/responsiveness.dart';
// import '/Classes/text_related/text_truncator.dart';
// import '/Widgets/home_module/atomic_widgets/conditional_image.dart';
//
// class LoadingScreen extends StatefulWidget {
//
//
//   @override
//   State<LoadingScreen> createState() =>
//       _LoadingScreenState();
// }
//
// class _LoadingScreenState extends State<LoadingScreen>
//     with SingleTickerProviderStateMixin {
//   ThemeData get theme => Theme.of(context);
//   bool isDarkTheme = false;
//   late Color containerColor;
//
//   final double scaleFactor = 0.95; // Adjust this scale factor as needed
//
//   late AnimationController _controller;
//   late Animation<double> _animation;
//
//   bool isOverlayVisible = false;
//
//   @override
//   void initState() {
//     isOverlayVisible=true;
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 600),
//     );
//
//     _animation = Tween(begin: 1.0, end: 0.0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Curves.easeInOut, // You can choose any curve from the Curves class
//       ),
//     )..addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         Future.delayed(Duration(milliseconds: 2000), () {
//           setState(() {
//             isOverlayVisible = true;
//           });
//           _controller.reset();
//         });
//       }
//     });
//
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     isDarkTheme = theme.brightness == Brightness.dark;
//     containerColor = isDarkTheme
//         ? Colors.black.withOpacity(0.3)
//         : theme.primaryColor.withOpacity(0.15);
//
//     return Stack(
//       children: [
//         Positioned.fill(
//           child: Visibility(
//             visible: isOverlayVisible,
//             child: AnimatedBuilder(
//               animation: _animation,
//               builder: (context, child) {
//                 return Transform.translate(
//                   offset: Offset(
//                     (_animation.value) * 1 * WR, 0,),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(16.0),
//                     ),
//                     child: Center(
//                       child: Stack(
//                         children: [
//                           Center(
//                             child: Image.asset(
//                               'assets/Homescreen/Random_Vector_Images/plane.png',
//                               height: 260 * HR,
//                               width: MediaQuery.of(context).size.width * WR ,
//                               fit: BoxFit.fitWidth,
//                             ),
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                               color: isDarkTheme? Colors.black.withOpacity(0.5) :containerColor.withOpacity(0.3),
//                               borderRadius: BorderRadius.circular(16.0),
//
//                             ),
//                           )
//                         ],
//                       ),
//
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//         // Container(
//         //   height: 300 * HR,
//         //   width: 196 * HR,
//         //   decoration: BoxDecoration(
//         //     color: containerColor.withOpacity(0.06),
//         //     borderRadius: BorderRadius.circular(16.0),
//         //   ),
//         // ),
//       ],
//
//     );
//   }
//
//
//
//
//
//
// }
