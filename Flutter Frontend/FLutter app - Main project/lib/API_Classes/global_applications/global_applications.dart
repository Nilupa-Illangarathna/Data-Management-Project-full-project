import 'package:flutter/material.dart';

final UpdateUI_interval = 20; //in seconds
bool currently_simulating = true;

//to get access app current context
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// globale print enable
bool print_enabled = true;

// base url
String baseUrlRoute = 'http://10.0.2.2:3500';


// image count per location
int imageCount = 5;

// Simulation state enable
bool isSimmulated = true;