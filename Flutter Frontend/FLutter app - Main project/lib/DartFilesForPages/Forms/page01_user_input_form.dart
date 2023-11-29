import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main_app/API_Classes/HomeModuleRelated/homepageData/hotel_related_card_data.dart';
import 'package:main_app/AppServices/data%20classes/recommendations_item_class.dart';
import 'package:main_app/Pages/LoadingScreen/loading_screen.dart';
import '../../API_Classes/data.dart';
import '../../API_Classes/global_applications/global_applications.dart';
import '/API_Classes/form_data/page_01_form_key_values.dart';
import '/API_Classes/form_data/Page_01_form_input/user_input.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  ThemeData get theme => Theme.of(context);
  late Color containerColor;
  bool isDarkTheme = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController preferenceController = TextEditingController();
  final TextEditingController largeInputController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isSwitched = false;

  static UserInput userInput = UserFormInputObject.userInput;

  @override
  Widget build(BuildContext context) {
    isDarkTheme = theme.brightness == Brightness.dark;
    double screenWidth = MediaQuery.of(context).size.width;
    containerColor = isDarkTheme
        ? Colors.black.withOpacity(0.3)
        : theme.primaryColor.withOpacity(0.15);
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name',
                style: TextStyle(
                    color: isDarkTheme ? Colors.white : Color(0xFF7092BE)),
              ),
              Container(
                height: 42.0,
                child: TextFormField(
                  autofocus: false,
                  controller: nameController,
                  style: TextStyle(fontSize: 12.0),
                  decoration: buildInputDecoration(
                      Icons.person, "Enter your name", 'Name'),
                  maxLength: UserInputKeyValues.maxFieldLengths['Name'],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
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
                        controller: ageController,
                        style: TextStyle(fontSize: 12.0),
                        decoration: buildInputDecoration(
                            Icons.cake, "Age", 'Age'),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                        ],
                        maxLength: UserInputKeyValues.maxFieldLengths['Age'],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your age';
                          }
                          return null;
                        },
                        onChanged: (value) => userInput.age = value,
                      ),
                    ),
                  ),
                  SizedBox(width: 7.0),
                  Expanded(
                    child: Container(
                      height: 42.0,
                      child: TextFormField(
                        autofocus: false,
                        controller: countryController,
                        style: TextStyle(fontSize: 12.0),
                        decoration: buildInputDecoration(
                            Icons.flag, "Country", 'Country'),
                        keyboardType: TextInputType.text,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]'))
                        ],
                        maxLength: UserInputKeyValues.maxFieldLengths['Country'],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your country';
                          }
                          return null;
                        },
                        onChanged: (value) => userInput.country = value,
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
                  controller: preferenceController,
                  style: TextStyle(fontSize: 12.0),
                  decoration: buildInputDecoration(
                      Icons.star, "Preferences", 'Preferences'),
                  maxLength: UserInputKeyValues.maxFieldLengths['Preferences'],
                  validator: (value) {
                    if (isSwitched && (value == null || value.isEmpty)) {
                      return 'Please enter your preferences';
                    }
                    return null;
                  },
                  onChanged: (value) => userInput.preferences = value,
                ),
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
                            Icons.description, "Description", 'Description'),
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
                      onPressed: () async {
                        await submitForm();
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
                        minimumSize:
                        Size(double.infinity, 48.0),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 7.0),
            ],
          ),
        ),
      ),
    );
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
        inputFormatters = [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))];
        break;
      case InputType.textNoNumbers:
        keyboardType = TextInputType.text;
        inputFormatters = [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]'))];
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
    userInput.name = nameController.text;
    userInput.age = ageController.text;
    userInput.country = countryController.text;
    userInput.preferences =
    isSwitched ? preferenceController.text : 'Preferences Disabled';
    userInput.description = largeInputController.text;
  }

  void printInputData() {
    print('Name: ${userInput.name}');
    print('Age: ${userInput.age}');
    print('Country: ${userInput.country}');
    print('Preferences: ${userInput.preferences}');
    print('Description: ${userInput.description}');
  }

  Future<void> submitForm() async {
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
      await performApiCall();

      Navigator.pop(context);
    } catch (error) {
      print('Error during API call: $error');
      // Handle API call error, show an error message, or take any other action
    }
  }



  final String apiUrl1 = baseUrlRoute + '/get_recommendations?';

  Future<void> getInitialRecommendations(String name,  String age, String country, String preferences, String description) async {

    if (preferences + description =="" ){
      return;
    }

    try {
      // Check if the device is connected to the internet
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        print('No internet connection');
        return;
      }

      // Define the request body
      final requestBody = {
        "query_sentence": "${preferences + description}",
        "num_recommendations": 100,
        "onWhich":"Mobile"
      }; // Adjust the value as needed

      // Make the API call using POST with headers and request body
      final response = await http.post(
        Uri.parse(apiUrl1),
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
        print('get_recommendations: $data');

        // Convert the JSON string to a list of maps
        List<Map<String, dynamic>> jsonList =
        List<Map<String, dynamic>>.from(json.decode(response.body));

        // Create a list of Recommendation objects
        List<Recommendation> recommendations =
        jsonList.map((jsonMap) => Recommendation.fromJson(jsonMap)).toList();

        try {
          AllPlaces = await updateHotelDataWithRecommendation(AllPlaces, recommendations); //TODO this calls the mapping
          print('Update successful');
        } catch (e) {
          print('Error: $e');
        }

        // // FIXME remove below
        // // Print the list of Recommendation objects
        // recommendations.forEach((recommendation) {
        //   print(recommendation.toJson());
        // });
        //
        // List<HotelData> allPlacesTemp = recommendations
        //     .map((recommendation) => recommendation.generateDummyHotelData(5))
        //     .toList();
        //
        // print(allPlacesTemp.length);
        // // FIXME remove above


        // Set the state with the loaded data

      } else {
        // Handle the error if the request was not successful
        print('Failed to get initial recommendations. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      // Handle any other errors that may occur
      print('Errorddds: $error');
    }
  }

  Future<void> performApiCall() async {
    String name = userInput.name;
    String age = userInput.age;
    String country = userInput.country;
    String preferences = userInput.preferences;
    String description = userInput.description;

    !isSimmulated? getInitialRecommendations(name, age, country, preferences, description) : (){};

    await Future.delayed(Duration(seconds: 5));


    // Replace this with your actual API call logic
    // For example:
    // await ApiCaller.makeApiCall('/your_api_endpoint', {
    //   'name': name,
    //   'age': age,
    //   'country': country,
    //   'preferences': preferences,
    //   'description': description,
    // });
  }


  // Function to update HotelData array with Recommendation values
  Future<List<HotelData>> updateHotelDataWithRecommendation(List<HotelData> hotelDataArray, List<Recommendation> recommendationArray) async {
    if (hotelDataArray.length > recommendationArray.length) {
      throw ArgumentError('Arrays must have the same length');
    }


    final random = Random();
    for (int i = 0; i < hotelDataArray.length; i++) {
      // Assuming you have a field in HotelData class to store the Recommendation value
      // hotelDataArray[i].PlaceID = recommendationArray[i].entireRow.sequence;
      hotelDataArray[i].isRecommended = recommendationArray[i].similarityScore == -1? "false" : recommendationArray[i].similarityScore>0.6? "true" : "false"; // Default value for isRecommended
      hotelDataArray[i].isVisited = (random.nextBool() ? 'true' : 'false'); // Default value for isVisited
      hotelDataArray[i].name = recommendationArray[i].entireRow.hotelNameValues; // Dummy hotel name
      hotelDataArray[i].address = recommendationArray[i].entireRow.hotelAddressValues;// Dummy address
      hotelDataArray[i].location = ""; // Dummy location
      hotelDataArray[i].food_grade = recommendationArray[i].entireRow.foodGrade; // Dummy food grade
      hotelDataArray[i].positiveSummary = getRandomNegativeSummary(positiveSummariesList); // Dummy positive summary
      hotelDataArray[i].negativeSummmary = getRandomNegativeSummary(negativeSummariesList); // Dummy negative summary


      hotelDataArray[i].latitude = double.parse(recommendationArray[i].entireRow.latitude);
      hotelDataArray[i].longitude = double.parse(recommendationArray[i].entireRow.longitude);
      hotelDataArray[i].negativeSentenceColumnSentiment = recommendationArray[i].entireRow.negativeSentenceColumnSentiment;
      hotelDataArray[i].positiveSentenceColumnSentiment = recommendationArray[i].entireRow.positiveSentenceColumnSentiment;
      hotelDataArray[i].reviewDateValues = "";
      hotelDataArray[i].reviewerScore = recommendationArray[i].entireRow.reviewerScore;

      // You can update other fields in a similar way based on your mapping
    }


    return hotelDataArray;
  }

  String getRandomNegativeSummary(List <String> SummariesList) {
    Random random = Random();
    int randomIndex = random.nextInt(SummariesList.length);
    return SummariesList[randomIndex];
  }



  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    countryController.dispose();
    preferenceController.dispose();
    largeInputController.dispose();
    super.dispose();
  }
}

