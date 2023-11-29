///////run this on erminal to add the dep : pub add http


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class GeocodingScreen extends StatefulWidget {
  @override
  _GeocodingScreenState createState() => _GeocodingScreenState();
}

class _GeocodingScreenState extends State<GeocodingScreen> {
  String address = 'Queens Garden Westminster Borough London W2 3BA United Kingdom';
  double latitude = 0.0;
  double longitude = 0.0;

  Future<void> convertAddressToCoordinates() async {
    try {
      final response = await http.get(
        Uri.parse('https://nominatim.openstreetmap.org/search?q=$address&format=json'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          setState(() {
            latitude = double.parse(data[0]['lat']);
            longitude = double.parse(data[0]['lon']);
          });
        } else {
          print('No location found for the given address.');
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geocoding Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Address: $address'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: convertAddressToCoordinates,
              child: Text('Convert to Coordinates'),
            ),
            SizedBox(height: 20),
            Text('Latitude: $latitude'),
            Text('Longitude: $longitude'),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: GeocodingScreen()));
