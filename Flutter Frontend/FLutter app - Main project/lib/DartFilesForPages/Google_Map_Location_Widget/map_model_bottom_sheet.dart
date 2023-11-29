// import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '/API_Classes/googleMapData/google_map_data.dart'; // Import the map_style.dart file

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '/API_Classes/googleMapData/google_map_data.dart';

class GoogleMapBottomSheet extends StatefulWidget {
  final List<double> locationArr;
  final String apiKey;

  const GoogleMapBottomSheet({
    Key? key,
    required this.locationArr,
    required this.apiKey,
  }) : super(key: key);

  @override
  _GoogleMapBottomSheetState createState() => _GoogleMapBottomSheetState();
}

class _GoogleMapBottomSheetState extends State<GoogleMapBottomSheet> {
  late GoogleMapController mapController;
  bool isMapCreated = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Material(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 350.0,
              margin: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: GoogleMap(
                  onMapCreated: (controller) {
                    mapController = controller;
                    setState(() {
                      isMapCreated = true;
                    });
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(widget.locationArr[0], widget.locationArr[1]),
                    zoom: 15.0,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId('locationMarker'),
                      position: LatLng(widget.locationArr[0], widget.locationArr[1]),
                    ),
                  },
                  compassEnabled: true,
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                    Factory<OneSequenceGestureRecognizer>(
                          () => EagerGestureRecognizer(),
                    ),
                  ].toSet(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}