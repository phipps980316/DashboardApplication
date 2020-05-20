import 'package:flutter/material.dart';
import 'package:crossfirstprototype/UI/Symbol/SymbolWidget.dart';

// This represents the Warning bar widget to manage all of the symbols on the warning bar
class WarningBarWidget extends StatefulWidget {

  // Creates the Warning bar widget with a key for reference to the widget
  WarningBarWidget(Key key) : super(key: key);

  // Creates the initial state for the widget
  @override
  WarningBarWidgetState createState() => WarningBarWidgetState();
}

// This then creates the state of the widget contents
class WarningBarWidgetState extends State<WarningBarWidget> {

  // These are used to access the widget after they have been build
  final GlobalKey<SymbolWidgetState> _masterWarningIcon = GlobalKey<SymbolWidgetState>();
  final GlobalKey<SymbolWidgetState> _seatbeltWarningIcon = GlobalKey<SymbolWidgetState>();
  final GlobalKey<SymbolWidgetState> _wiperFluidIcon = GlobalKey<SymbolWidgetState>();
  final GlobalKey<SymbolWidgetState> _tirePressureIcon = GlobalKey<SymbolWidgetState>();
  final GlobalKey<SymbolWidgetState> _airbagFaultIcon = GlobalKey<SymbolWidgetState>();
  final GlobalKey<SymbolWidgetState> _brakeWarningIcon = GlobalKey<SymbolWidgetState>();
  final GlobalKey<SymbolWidgetState> _absFaultIcon = GlobalKey<SymbolWidgetState>();
  final GlobalKey<SymbolWidgetState> _edsFaultIcon = GlobalKey<SymbolWidgetState>();
  final GlobalKey<SymbolWidgetState> _tempIcon = GlobalKey<SymbolWidgetState>();
  final GlobalKey<SymbolWidgetState> _parkingBrakeIcon = GlobalKey<SymbolWidgetState>();
  final GlobalKey<SymbolWidgetState> _lightBeamIcon = GlobalKey<SymbolWidgetState>();
  final GlobalKey<SymbolWidgetState> _connectionIcon = GlobalKey<SymbolWidgetState>();

  // Updates the Master warning symbol
  void updateMasterWarningIcon(String imageName){
    setState(() {
      _masterWarningIcon.currentState.updateImage(imageName);
    });
  }

  // Returns the master warning image name
  String getMasterWarningImageName(){
    return _masterWarningIcon.currentState.getImageName();
  }

  // Updates the Seatbelt warning symbol
  void updateSeatbeltWarningIcon(String imageName){
    setState(() {
      _seatbeltWarningIcon.currentState.updateImage(imageName);
    });
  }

  // Returns the seatbelt warning image name
  String getSeatbeltWarningImageName(){
    return _seatbeltWarningIcon.currentState.getImageName();
  }

  // Updates the Wiper Fluid warning symbol
  void updateWiperFluidIcon(String imageName){
    setState(() {
      _wiperFluidIcon.currentState.updateImage(imageName);
    });
  }

  // Returns the Wiper fluid warning image name
  String getWiperFluidImageName(){
    return _wiperFluidIcon.currentState.getImageName();
  }

  // Updates the Tire Pressure warning symbol
  void updateTirePressureIcon(String imageName){
    setState(() {
      _tirePressureIcon.currentState.updateImage(imageName);
    });
  }

  // Returns the Tire pressure warning image name
  String getTirePressureImageName(){
    return _tirePressureIcon.currentState.getImageName();
  }

  // Updates the Airbag warning symbol
  void updateAirbagFaultIcon(String imageName){
    setState(() {
      _airbagFaultIcon.currentState.updateImage(imageName);
    });
  }

  // Returns the Airbag warning image name
  String getAirbagFaultImageName(){
    return _airbagFaultIcon.currentState.getImageName();
  }

  // Updates the Brake warning symbol
  void updateBrakeWarningIcon(String imageName){
    setState(() {
      _brakeWarningIcon.currentState.updateImage(imageName);
    });
  }

  // Returns the Brake warning image name
  String getBrakeWarningImageName(){
    return _brakeWarningIcon.currentState.getImageName();
  }

  // Updates the ABS warning symbol
  void updateABSFaultIcon(String imageName){
    setState(() {
      _absFaultIcon.currentState.updateImage(imageName);
    });
  }

  // Returns the ABS warning image name
  String getABSFaultImageName(){
    return _absFaultIcon.currentState.getImageName();
  }

  // Updates the EDS warning symbol
  void updateEDSFaultIcon(String imageName){
    setState(() {
      _edsFaultIcon.currentState.updateImage(imageName);
    });
  }

  // Returns the EDS warning image name
  String getEDSFaultImageName(){
    return _edsFaultIcon.currentState.getImageName();
  }

  // Updates the Temperature warning symbol
  void updateTempIcon(String imageName){
    setState(() {
      _tempIcon.currentState.updateImage(imageName);
    });
  }

  // Returns the Temperature warning image name
  String getTempImageName(){
    return _tempIcon.currentState.getImageName();
  }

  // Updates the Parking Brake symbol
  void updateParkingBrakeIcon(String imageName){
    setState(() {
      _parkingBrakeIcon.currentState.updateImage(imageName);
    });
  }

  // Returns the Parking Brake image name
  String getParkingBrakeImageName(){
    return _parkingBrakeIcon.currentState.getImageName();
  }

  // Updates the Light beam symbol
  void updateLightBeamIcon(String imageName){
    setState(() {
      _lightBeamIcon.currentState.updateImage(imageName);
    });
  }

  // Returns the Light beam image name
  String getLightBeamImageName(){
    return _lightBeamIcon.currentState.getImageName();
  }

  // Updates the Connection symbol
  void updateConnectionIcon(String imageName){
    setState(() {
      _connectionIcon.currentState.updateImage(imageName);
    });
  }

  // Returns the connection image name
  String getConnectionImageName(){
    return _connectionIcon.currentState.getImageName();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(child: SymbolWidget(_masterWarningIcon, 'graphics/master_warning_grey.png')),  // Builds the master warning, expanded to the maximum size
            Expanded(child: SymbolWidget(_seatbeltWarningIcon, 'graphics/seatbelt_warning_grey.png')),  // Builds the seatbelt warning, expanded to the maximum size
            Expanded(child: SymbolWidget(_wiperFluidIcon, 'graphics/low_wiper_fluid_grey.png')),  // Builds the low wiper fluid warning, expanded to the maximum size
            Expanded(child: SymbolWidget(_tirePressureIcon, 'graphics/low_tire_pressure_grey.png')),  // Builds the low tire pressure warning, expanded to the maximum size
            Expanded(child: SymbolWidget(_airbagFaultIcon, 'graphics/airbag_fault_grey.png')),  // Builds the airbag warning, expanded to the maximum size
            Expanded(child: SymbolWidget(_brakeWarningIcon, 'graphics/brake_warning_grey.png')),  // Builds the brake warning, expanded to the maximum size
            Expanded(child: SymbolWidget(_absFaultIcon, 'graphics/abs_fault_grey.png')),  // Builds the ABS warning, expanded to the maximum size
            Expanded(child: SymbolWidget(_edsFaultIcon, 'graphics/electric_drive_system_fault_grey.png')),  // Builds the EDS warning, expanded to the maximum size
            Expanded(child: SymbolWidget(_tempIcon, 'graphics/temp_grey.png')),  // Builds the Temperature warning, expanded to the maximum size
            Expanded(child: SymbolWidget(_parkingBrakeIcon, 'graphics/parking_brake_grey.png')),  // Builds the Parking brake symbol, expanded to the maximum size
            Expanded(child: SymbolWidget(_lightBeamIcon, 'graphics/no_lightbeam_grey.png')),  // Builds the light beam symbol, expanded to the maximum size
            Expanded(child: SymbolWidget(_connectionIcon, 'graphics/connection_grey.png'))  // Builds the connection symbol, expanded to the maximum size
          ],
        ),
      ),
    );
  }
}
