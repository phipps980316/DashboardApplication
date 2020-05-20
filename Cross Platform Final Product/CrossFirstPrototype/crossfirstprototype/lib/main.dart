import 'package:flutter/material.dart';
import 'package:crossfirstprototype/UI/Dashboard/DashboardWidget.dart';
import 'package:crossfirstprototype/Service/DashboardBLEService.dart';
import 'package:flutter/services.dart';

// Runs the MyApp class when the application starts
void main() => runApp(DashboardApp());

// This represents the root widget of the application
class DashboardApp extends StatelessWidget {

  final GlobalKey<DashboardWidgetState> _dashboardUI = GlobalKey<DashboardWidgetState>(); // Key is used to access a widget after it has been build
  DashboardBLEService _bleService;  // Creates the BLE service

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]); // Sets the orientation to landscape when the app starts
    _bleService = DashboardBLEService(_dashboardUI, true);  // Initialises the BLE service with the global key to edit the UI widgets

    return MaterialApp( // Defines the type of application that is being build
      home: SafeArea( // SafeArea ensure the widgets stays within the accessible areas of the device display
          child:
               Scaffold(body: Center(child: Center(child: DashboardWidget(_dashboardUI))))),  // Builds the dashboard widget in the centre of the screen
    );
  }
}
