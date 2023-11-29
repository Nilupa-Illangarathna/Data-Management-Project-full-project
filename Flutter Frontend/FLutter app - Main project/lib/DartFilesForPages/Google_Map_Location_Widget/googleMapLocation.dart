// import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '/API_Classes/googleMapData/google_map_data.dart'; // Import the map_style.dart file

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '/API_Classes/googleMapData/google_map_data.dart';

class GoogleMapLocation extends StatefulWidget {
  final List<double> locationArr;
  final String apiKey;

  const GoogleMapLocation({Key? key, required this.locationArr, required this.apiKey})
      : super(key: key);

  @override
  _GoogleMapLocationState createState() => _GoogleMapLocationState();
}

class _GoogleMapLocationState extends State<GoogleMapLocation> {
  late GoogleMapController mapController;
  bool isMapCreated = false;
  final GoogleMapDataObj = GoogleMapData();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SizedBox.expand(
              child: GoogleMap(
                onMapCreated: (controller) {
                  mapController = controller;
                  mapController.setMapStyle(GoogleMapDataObj.MapStyle);

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
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SizedBox.expand(
              child: GoogleMap(
                onMapCreated: (controller) {
                  mapController = controller;
                  // mapController.setMapStyle(GoogleMapDataObj.MapStyle);

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
    );
  }
}
