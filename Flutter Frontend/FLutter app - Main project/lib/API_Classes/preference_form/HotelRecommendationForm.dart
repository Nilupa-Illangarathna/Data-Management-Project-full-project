import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'HotelRecommendationFormData.dart';
import 'HotelRecommendationFormKeyValues.dart';

class HotelRecommendationForm extends StatefulWidget {
  @override
  _HotelRecommendationFormState createState() => _HotelRecommendationFormState();
}

class _HotelRecommendationFormState extends State<HotelRecommendationForm> {
  ThemeData get theme => Theme.of(context);
  late Color containerColor;
  bool isDarkTheme = false;

  final TextEditingController destinationController = TextEditingController();
  final TextEditingController checkInController = TextEditingController();
  final TextEditingController checkOutController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  final TextEditingController amenitiesController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    isDarkTheme = theme.brightness == Brightness.dark;
    double screenWidth = MediaQuery.of(context).size.width;
    containerColor = isDarkTheme ? Colors.black.withOpacity(0.3) : theme.primaryColor.withOpacity(0.15);

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(0.0),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextFormField(Icons.location_on, "Destination", 'destination', destinationController),
              SizedBox(height: 7.0),
              Row(
                children: [
                  Expanded(
                    child: buildTextFormField(Icons.calendar_today, "Check-In Date", 'checkIn', checkInController),
                  ),
                  SizedBox(width: 7.0),
                  Expanded(
                    child: buildTextFormField(Icons.calendar_today, "Check-Out Date", 'checkOut', checkOutController),
                  ),
                ],
              ),
              SizedBox(height: 7.0),
              buildTextFormField(Icons.attach_money, "Budget", 'budget', budgetController),
              SizedBox(height: 7.0),
              buildTextFormField(Icons.hotel, "Amenities", 'amenities', amenitiesController),
              SizedBox(height: 7.0),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    saveInputData();
                    printInputData();
                  }
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
                  backgroundColor: isDarkTheme ? Colors.black.withOpacity(0.3) : theme.primaryColor.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 12.0, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildTextFormField(IconData icon, String labelText, String fieldName, TextEditingController controller) {
    return TextFormField(
      autofocus: false,
      controller: controller,
      style: TextStyle(fontSize: 12.0),
      decoration: buildInputDecoration(icon, labelText, fieldName),
      maxLength: HotelRecommendationFormKeyValues.maxFieldLengths[fieldName],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $labelText';
        }
        return null;
      },
    );
  }

  InputDecoration buildInputDecoration(IconData icon, String labelText, String fieldName) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(color: isDarkTheme ? Colors.white : Color(0xFF7092BE)),
      prefixIcon: Icon(icon, color: isDarkTheme ? Colors.white : Color(0xFF35395E)),
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
    HotelRecommendationFormData.destination = destinationController.text;
    HotelRecommendationFormData.checkInDate = checkInController.text;
    HotelRecommendationFormData.checkOutDate = checkOutController.text;
    HotelRecommendationFormData.budget = budgetController.text;
    HotelRecommendationFormData.amenities = amenitiesController.text;
  }

  void printInputData() {
    print('Destination: ${HotelRecommendationFormData.destination}');
    print('Check-In Date: ${HotelRecommendationFormData.checkInDate}');
    print('Check-Out Date: ${HotelRecommendationFormData.checkOutDate}');
    print('Budget: ${HotelRecommendationFormData.budget}');
    print('Amenities: ${HotelRecommendationFormData.amenities}');

    String promptString = HotelRecommendationFormData.generatePromptString();
    print('Prompt String: $promptString');
  }

  @override
  void dispose() {
    destinationController.dispose();
    checkInController.dispose();
    checkOutController.dispose();
    budgetController.dispose();
    amenitiesController.dispose();
    super.dispose();
  }
}
