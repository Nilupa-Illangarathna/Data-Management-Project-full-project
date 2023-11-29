import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';


class ApiCaller {
  static Future<void> makeApiCall(String endpoint, Map<String, dynamic> data) async {
    try {
      // Check if the device is connected to the internet
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        print('No internet connection');
        return;
      }

      // Replace this URL with your actual API endpoint
      final String baseUrlRoute = 'https://your-api-base-url';
      final String apiUrl = baseUrlRoute + endpoint;

      // Make the API call using POST with headers and request body
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Connection': 'keep-alive',
          'Keep-Alive': 'timeout=5, max=1000',
        },
        body: json.encode(data),
      ).timeout(Duration(seconds: 60));

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse and print the response
        final responseData = json.decode(response.body);
        print('API Response: $responseData');
        // Handle the response as needed
      } else {
        // Handle the error if the request was not successful
        print('Failed API call. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        // Handle the error as needed
      }
    } catch (error) {
      // Handle any other errors that may occur
      print('Error: $error');
    }
  }
}
