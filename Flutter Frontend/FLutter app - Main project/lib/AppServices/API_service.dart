import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;


class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<Map<String, dynamic>> getRecommendations({
    required String querySentence,
    required int numRecommendations,
  }) async {
    try {
      // Check if the device is connected to the internet
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        print('No internet connection');
        throw Exception('No internet connection');
      }

      // Define the request body
      final requestBody = {
        "query_sentence": querySentence,
        "num_recommendations": numRecommendations,
      };

      // Make the API call using POST with headers and request body
      final response = await http.post(
        Uri.parse('$baseUrl/get_recommendations'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(requestBody),
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse and return the response
        final data = json.decode(response.body);
        return data;
      } else {
        // Handle the error if the request was not successful
        print('Failed to get recommendations. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to get recommendations');
      }
    } catch (error) {
      // Handle any other errors that may occur
      print('Error: $error');
      throw error;
    }
  }

  Future<Map<String, dynamic>> addNewDataFeedbackLoop(Map<String, dynamic> newData) async {
    try {
      // Check if the device is connected to the internet
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        print('No internet connection');
        throw Exception('No internet connection');
      }

      // Make the API call using POST with headers and request body
      final response = await http.post(
        Uri.parse('http://127.0.0.1:3500/add_new_data_feedback_loop'),
        headers: {
          'Content-Type': 'application/json',
          'Connection': 'keep-alive',
          'Keep-Alive': 'timeout=5, max=1000',
        },
        body: json.encode(newData),
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse and return the response
        final data = json.decode(response.body);
        return data;
      } else {
        // Handle the error if the request was not successful
        print('Failed to add new data in feedback loop. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to add new data in feedback loop');
      }
    } catch (error) {
      // Handle any other errors that may occur
      print('Error: $error');
      throw error;
    }
  }
}
