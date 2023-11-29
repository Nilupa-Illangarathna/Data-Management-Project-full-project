// dependencies:
//   flutter:
//     sdk: flutter
//   shared_preferences: ^2.0.0






// import 'package:shared_preferences/shared_preferences.dart';
//
// class HelperManager {
//   static final HelperManager _instance = HelperManager._internal();
//   late SharedPreferences _prefs;
//
//   factory HelperManager() {
//     return _instance;
//   }
//
//   HelperManager._internal();
//
//   Future<void> initialize() async {
//     _prefs = await SharedPreferences.getInstance();
//   }
//
//   Future<bool> isHelperScreenCompleted() async {
//     return _prefs.getBool('helperScreenCompleted') ?? false;
//   }
//
//   Future<void> setHelperScreenCompleted(bool value) async {
//     await _prefs.setBool('helperScreenCompleted', value);
//   }
// }






//
// import 'package:flutter/material.dart';
// import 'package:your_app/helper_manager.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // Initialize HelperManager
//   await HelperManager().initialize();
//
//   // Get helper screen completion status
//   bool isHelperScreenCompleted = await HelperManager().isHelperScreenCompleted();
//
//   runApp(MyApp(isHelperScreenCompleted: isHelperScreenCompleted));
// }
//
// class MyApp extends StatelessWidget {
//   final bool isHelperScreenCompleted;
//
//   const MyApp({Key? key, required this.isHelperScreenCompleted}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Your App',
//       home: isHelperScreenCompleted ? HomeScreen() : HelperScreen(),
//     );
//   }
// }






//
// import 'package:flutter/material.dart';
// import 'package:your_app/helper_manager.dart';
//
// class HelperScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Helper Screen'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Helper Screen'),
//             ElevatedButton(
//               onPressed: () async {
//                 // Set helper screen completion status
//                 await HelperManager().setHelperScreenCompleted(true);
//
//                 // Navigate to home screen
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => HomeScreen()),
//                 );
//               },
//               child: Text('Go to Home'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
