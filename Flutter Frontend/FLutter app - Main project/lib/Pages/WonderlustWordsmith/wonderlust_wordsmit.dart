import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main_app/API_Classes/global_applications/global_applications.dart';
import 'package:main_app/DartFilesForPages/Google_Map_Location_Widget/googleMapLocation.dart';
import 'package:main_app/DartFilesForPages/PredictionPage/fitness_app_theme.dart';
import 'package:main_app/Pages/Homepage%20Screen/HomePage.dart';
import 'package:main_app/Pages/LoadingScreen/loading_screen.dart';
import 'package:main_app/Widgets/home_module/molecule_widgets/topic%20_with_blue_button.dart';
import '../../classes/responsiveness/responsiveness.dart';
import '/API_Classes/form_data/page_01_form_key_values.dart';
import '/API_Classes/form_data/Page_01_form_input/user_input.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';

class WanderlustWordforgeScreen extends StatefulWidget {
  @override
  _WanderlustWordforgeScreenState createState() =>
      _WanderlustWordforgeScreenState();
}

class _WanderlustWordforgeScreenState extends State<WanderlustWordforgeScreen> {
  ThemeData get theme => Theme.of(context);
  late Color containerColor;
  bool isDarkTheme = false;

  final TextEditingController hotelNameController = TextEditingController();
  final TextEditingController numberOfReviewsController =
  TextEditingController();
  final TextEditingController reviewScoreController = TextEditingController();
  final TextEditingController positiveReviewController =
  TextEditingController();
  final TextEditingController negativeReviewController =
  TextEditingController();
  final TextEditingController reviewerNationalityController =
  TextEditingController();
  final TextEditingController tagsController = TextEditingController();
  final TextEditingController averageScoreController =
  TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isSwitched = false;

  static UserInput userInput = UserFormInputObject.userInput;

  get largeInputController => null;

  @override
  Widget build(BuildContext context) {
    isDarkTheme = theme.brightness == Brightness.dark;
    double screenWidth = MediaQuery.of(context).size.width;
    containerColor = isDarkTheme
        ? Colors.black.withOpacity(0.3)
        : theme.primaryColor.withOpacity(0.15);

    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            color: containerColor,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 12.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TopicWithBlueButton(
                    text1: "A New Place?",
                    text2: "",
                    onPressed: () {
                      print('Item clicked: Recommended Places');
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  margin: EdgeInsets.all(16.0),
                  padding: EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Hotel Name',
                          style: TextStyle(
                            color: isDarkTheme ? Colors.white : Color(0xFF7092BE),
                          ),
                        ),
                        Container(
                          height: 42.0,
                          child: TextFormField(
                            autofocus: false,
                            controller: hotelNameController,
                            style: TextStyle(fontSize: 12.0),
                            decoration: buildInputDecoration(
                              Icons.hotel,
                              "Enter hotel name",
                              'Hotel Name',
                            ),
                            maxLength: UserInputKeyValues.maxFieldLengths['Hotel Name'],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter hotel name';
                              }
                              return null;
                            },
                            onChanged: (value) => userInput.name = value,
                          ),
                        ),
                        SizedBox(height: 7.0),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 42.0,
                                child: TextFormField(
                                  autofocus: false,
                                  controller: numberOfReviewsController,
                                  style: TextStyle(fontSize: 12.0),
                                  decoration: buildInputDecoration(
                                    Icons.format_list_numbered,
                                    "Number of Reviews",
                                    'Number of Reviews',
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                                  ],
                                  maxLength:
                                  UserInputKeyValues.maxFieldLengths['Number of Reviews'],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter the number of reviews';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) =>
                                  userInput.age = value,
                                ),
                              ),
                            ),
                            SizedBox(width: 7.0),
                            Expanded(
                              child: Container(
                                height: 42.0,
                                child: TextFormField(
                                  autofocus: false,
                                  controller: reviewScoreController,
                                  style: TextStyle(fontSize: 12.0),
                                  decoration: buildInputDecoration(
                                    Icons.star,
                                    "Review Score",
                                    'Review Score',
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                                  ],
                                  maxLength:
                                  UserInputKeyValues.maxFieldLengths['Review Score'],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter the review score';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) =>
                                  userInput.country = value,
                                ),
                              ),
                            ),
                            SizedBox(width: 4.0),
                            Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 7.0),
                        Container(
                          height: 42.0,
                          child: TextFormField(
                            autofocus: false,
                            controller: positiveReviewController,
                            style: TextStyle(fontSize: 12.0),
                            decoration: buildInputDecoration(
                              Icons.thumb_up,
                              "Positive Review",
                              'Positive Review',
                            ),
                            maxLength:
                            UserInputKeyValues.maxFieldLengths['Positive Review'],
                            validator: (value) {
                              if (isSwitched && (value == null || value.isEmpty)) {
                                return 'Please enter positive review';
                              }
                              return null;
                            },
                            onChanged: (value) =>
                            userInput.preferences = value,
                          ),
                        ),
                        SizedBox(height: 7.0),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 42.0,
                                child: TextFormField(
                                  autofocus: false,
                                  controller: negativeReviewController,
                                  style: TextStyle(fontSize: 12.0),
                                  decoration: buildInputDecoration(
                                    Icons.thumb_down,
                                    "Negative Review",
                                    'Negative Review',
                                  ),
                                  maxLength:
                                  UserInputKeyValues.maxFieldLengths['Negative Review'],
                                  validator: (value) {
                                    if (isSwitched && (value == null || value.isEmpty)) {
                                      return 'Please enter negative review';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) =>
                                  userInput.preferences = value,
                                ),
                              ),
                            ),
                            SizedBox(width: 7.0),
                            Expanded(
                              child: Container(
                                height: 42.0,
                                child: TextFormField(
                                  autofocus: false,
                                  controller: reviewerNationalityController,
                                  style: TextStyle(fontSize: 12.0),
                                  decoration: buildInputDecoration(
                                    Icons.flag,
                                    "Reviewer Nationality",
                                    'Reviewer Nationality',
                                  ),
                                  maxLength: UserInputKeyValues
                                      .maxFieldLengths['Reviewer Nationality'],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter reviewer nationality';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) =>
                                  userInput.country = value,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 7.0),
                        Container(
                          height: 42.0,
                          child: TextFormField(
                            autofocus: false,
                            controller: tagsController,
                            style: TextStyle(fontSize: 12.0),
                            decoration: buildInputDecoration(
                              Icons.tag,
                              "Tags",
                              'Tags',
                            ),
                            maxLength: UserInputKeyValues.maxFieldLengths['Tags'],
                            validator: (value) {
                              if (isSwitched && (value == null || value.isEmpty)) {
                                return 'Please enter tags';
                              }
                              return null;
                            },
                            onChanged: (value) =>
                            userInput.preferences = value,
                          ),
                        ),
                        SizedBox(height: 7.0),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 42.0,
                                child: TextFormField(
                                  autofocus: false,
                                  controller: averageScoreController,
                                  style: TextStyle(fontSize: 12.0),
                                  decoration: buildInputDecoration(
                                    Icons.star_half,
                                    "Average Score",
                                    'Average Score',
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                                  ],
                                  maxLength:
                                  UserInputKeyValues.maxFieldLengths['Average Score'],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter average score';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) =>
                                  userInput.country = value,
                                ),
                              ),
                            ),
                            SizedBox(width: 7.0),
                            // Add more widgets here if needed
                          ],
                        ),
                        SizedBox(height: 7.0),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 84.0,
                                child: TextFormField(
                                  autofocus: false,
                                  controller: largeInputController,
                                  maxLines: 2,
                                  style: TextStyle(fontSize: 12.0),
                                  decoration: buildInputDecoration(
                                    Icons.description,
                                    "Description",
                                    'Description',
                                  ),
                                  maxLength:
                                  UserInputKeyValues.maxFieldLengths['Description'],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a description';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) =>
                                  userInput.description = value,
                                ),
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              flex: 1,
                              child: TextButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.of(context).push(
                                      PageRouteBuilder(
                                        pageBuilder:
                                            (context, animation, secondaryAnimation) =>
                                            LoadingScreen(),
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          const begin =
                                          Offset(1.0, 0.0); // Slide from right to left
                                          const end = Offset.zero;
                                          var tween = Tween(begin: begin, end: end);
                                          var offsetAnimation = animation.drive(tween);
                                          return SlideTransition(
                                              position: offsetAnimation, child: child);
                                        },
                                        transitionDuration:
                                        const Duration(milliseconds: 50),
                                      ),
                                    );

                                    // TODO: Call your API here

                                    Future.delayed(Duration(seconds: 2), () {
                                      // TODO: Call your API here
                                      // Comment: Call the API here
                                      submitForm(
                                      hotelNameController.text,
                                      numberOfReviewsController.text,
                                      reviewScoreController.text,
                                      positiveReviewController.text,
                                      negativeReviewController.text,
                                      reviewerNationalityController.text,
                                      tagsController.text,
                                      averageScoreController.text,
                                      );
                                      // After API call is complete, close the loading screen
                                      Navigator.pop(context);
                                    });
                                    // Comment: Call the API here
                                  }
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30.0, vertical: 0.0),
                                  backgroundColor: isDarkTheme
                                      ? Colors.black.withOpacity(0.3)
                                      : theme.primaryColor.withOpacity(0.2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  alignment: Alignment.center,
                                  minimumSize: Size(
                                      double.infinity, 48.0),
                                ),
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(height: 7.0),














                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 12 * HR,
                // ),
                Padding(
                  padding: EdgeInsets.only(left: 16 * WR, right: 16 * WR),
                  child: TopicWithBlueButton(
                    text1: "Show direction",
                    text2: "",
                    onPressed: () {
                      // seeMorePlaces(true);
                      print('Item clicked: Recommended Places');
                    },
                  ),
                ),
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: GoogleMapLocation(
                    locationArr: GoogleMapDataObj.Location_Coordinates, // Example coordinates
                    // locationArr: [randomLocation(), randomLocation()], // Example coordinates
                    apiKey: GoogleMapDataObj.API_key,
                  ),
                ),
                SizedBox(
                  height: 36 * HR,
                ),
                // SizedBox(
                //   height: 16,
                // )
              ],
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(height: 19 * HR),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16 * HR),
              child: Container(
                width: MediaQuery.of(context).size.width * (2/5),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Wonder Lust',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: FitnessAppTheme.fontName,
                      fontWeight: FontWeight.w700,
                      fontSize: 30 + 6 - 6 * 0,
                      letterSpacing: 1.2,
                      color: isDarkTheme ? Colors.grey : Colors.grey.shade900, ///////////////////////////////////Text Color
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
  Future<void> submitForm(
  String hotelNameController,
  String numberOfReviewsController,
  String reviewScoreController,
  String positiveReviewController,
  String negativeReviewController,
  String reviewerNationalityController,
  String tagsController,
  String averageScoreController,
      ) async {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder:
            (context, animation, secondaryAnimation) =>
            LoadingScreen(),
        transitionsBuilder: (context, animation,
            secondaryAnimation, child) {
          const begin =
          Offset(1.0, 0.0); // Slide from right to left
          const end = Offset.zero;
          var tween = Tween(begin: begin, end: end);
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(
              position: offsetAnimation, child: child);
        },
        transitionDuration:
        const Duration(milliseconds: 50),
      ),
    );
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => LoadingScreen()),
    // );

    try {
      await addNewDataToFeedbackLoop(
        hotelNameController,
        numberOfReviewsController,
        reviewScoreController,
        positiveReviewController,
        negativeReviewController,
        reviewerNationalityController,
        tagsController,
        averageScoreController,
      );

      Navigator.pop(context);
    } catch (error) {
      print('Error during API call: $error');
      // Handle API call error, show an error message, or take any other action
    }
  }


  final String addNewDataUrl = baseUrlRoute + '/add_new_data_feedback_loop';

  Future<void> addNewDataToFeedbackLoop(
      String hotelNameController,
      String numberOfReviewsController,
      String reviewScoreController,
      String positiveReviewController,
      String negativeReviewController,
      String reviewerNationalityController,
      String tagsController,
      String averageScoreController,
      ) async {
    try {
      // Check internet connection
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        print('No internet connection');
        return;
      }

      // Define request body
      final requestBody = { //TODO
        "new_data": {
          "Hotel_Address": "Welcome to the Serenity Oasis Hotel, located in the heart of the bustling city. Our address, 123 Tranquil Street, ensures that you are just moments away from the vibrant energy of the city center, yet cocooned in the peaceful ambiance of our luxurious abode.",
          "Review_Date": "2023-11-24",
          "Average_Score": averageScoreController,
          "Hotel_Name": hotelNameController,
          "Reviewer_Nationality": "Diverse Global Traveler",
          "Negative_Review": negativeReviewController,
          "Review_Total_Negative_Word_Counts": 42,
          "Positive_Review": positiveReviewController,
          "Review_Total_Positive_Word_Counts": 68,
          "Reviewer_Score": reviewScoreController as double,
          "Total_Number_of_Reviews_Reviewer_Has_Given": numberOfReviewsController as int,
          "Total_Number_of_Reviews": 150,
          "Tags": "Tranquility, Elegance, Exceptional Service",
          "days_since_review": "4 days",
          "Additional_Number_of_Scoring": 8,
          "lat": 34.0522,
          "lng": -118.2437
        }
      };

      // Make API call using POST with headers and request body
      final response = await http.post(
        Uri.parse(addNewDataUrl),
        headers: {
          'Content-Type': 'application/json',
          'Connection': 'keep-alive',
          'Keep-Alive': 'timeout=5, max=1000',
        },
        body: json.encode(requestBody),
      ).timeout(Duration(seconds: 60));

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse and print the response
        final data = json.decode(response.body);
        print('Add New Data Response: $data');
      } else {
        // Handle the error if the request was not successful
        print('Failed to add new data to feedback loop. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      // Handle any other errors that may occur
      print('Error: $error');
    }
  }


  InputDecoration buildInputDecoration(
      IconData icon, String labelText, String fieldName) {
    InputType inputType =
        UserInputKeyValues.inputTypes[fieldName] ?? InputType.text;
    TextInputType keyboardType;
    List<TextInputFormatter>? inputFormatters;
    int maxLength =
        UserInputKeyValues.maxFieldLengths[fieldName] ?? 1000;

    switch (inputType) {
      case InputType.numbers:
        keyboardType = TextInputType.number;
        inputFormatters = [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
        ];
        break;
      case InputType.textNoNumbers:
        keyboardType = TextInputType.text;
        inputFormatters = [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]'))
        ];
        break;
      case InputType.text:
      default:
        keyboardType = TextInputType.text;
    }

    return InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(
          color: isDarkTheme ? Colors.white : Color(0xFF7092BE)),
      prefixIcon: Icon(icon,
          color: isDarkTheme ? Colors.white : Color(0xFF35395E)),
      filled: true,
      fillColor: Colors.white54,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      counterStyle: TextStyle(fontSize: 10.0),
    );
  }

  void saveInputData() {
    userInput.name = hotelNameController.text;
    userInput.age = numberOfReviewsController.text;
    userInput.country = reviewScoreController.text;
    userInput.preferences = isSwitched
        ? positiveReviewController.text
        : 'Positive Review Disabled';
    // userInput.description = largeInputController.text;
    // Add more assignments if needed
  }

  void printInputData() {
    print('Hotel Name: ${userInput.name}');
    print('Number of Reviews: ${userInput.age}');
    print('Review Score: ${userInput.country}');
    print('Positive Review: ${userInput.preferences}');
    print('Description: ${userInput.description}');
    // Print more fields if needed
  }

  @override
  void dispose() {
    hotelNameController.dispose();
    numberOfReviewsController.dispose();
    reviewScoreController.dispose();
    positiveReviewController.dispose();
    negativeReviewController.dispose();
    reviewerNationalityController.dispose();
    tagsController.dispose();
    averageScoreController.dispose();
    super.dispose();
  }
}
