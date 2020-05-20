import 'package:flutter/material.dart';
import 'package:crossfirstprototype/UI/Gauge/GaugeWidget.dart';
import 'InfoWidget.dart';

// This represents the Info bar widget to manage all of the statistical information on the vehicle
class InfoBarWidget extends StatefulWidget {

  // Creates the Info bar widget with a key for reference to the widget
  const InfoBarWidget(Key key) : super(key: key);

  // Creates the initial state for the widget
  @override
  InfoBarWidgetState createState() => InfoBarWidgetState();
}

// This then creates the state of the widget contents
class InfoBarWidgetState extends State<InfoBarWidget> {

  // These are used to access the widget after they have been build
  final GlobalKey<GaugeWidgetState> _speedInfo = GlobalKey<GaugeWidgetState>();
  final GlobalKey<InfoWidgetState> _distanceInfo = GlobalKey<InfoWidgetState>();
  final GlobalKey<InfoWidgetState> _rangeInfo = GlobalKey<InfoWidgetState>();
  final GlobalKey<GaugeWidgetState> _batteryInfo = GlobalKey<GaugeWidgetState>();

  // Updates the speed value
  void updateSpeedInfo(String value){
    setState(() {
      _speedInfo.currentState.updateValue(value);
    });
  }

  // Returns the speed value
  String getSpeedInfo(){
    return _speedInfo.currentState.getValue();
  }

  // Updates the distance value
  void updateDistanceInfo(String value){
    setState(() {
      _distanceInfo.currentState.updateValue(value);
    });
  }

  // Returns the distance value
  String getDistanceInfo(){
    return _distanceInfo.currentState.getValue();
  }

  // Updates the range value
  void updateRangeInfo(String value){
    setState(() {
      _rangeInfo.currentState.updateValue(value);
    });
  }

  // Returns the range value
  String getRangeInfo(){
    return _rangeInfo.currentState.getValue();
  }

  // Updates the battery value
  void updateBatteryInfo(String value){
    setState(() {
      _batteryInfo.currentState.updateValue(value);
    });
  }

  // Returns the battery value
  String getBatteryInfo(){
    return _batteryInfo.currentState.getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(  // This makes sure the text direction is left to right
      textDirection: TextDirection.ltr,
      child: Align( // Aligns the widgets to the centre
        alignment: Alignment.center,
        child: Row( // Stacks each widget horizontally
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(child: GaugeWidget(_speedInfo, "Speed", "MPH", 120, Colors.lightGreen, Colors.red)), // Builds the Speed gauge, expanded to the maximum size
            Column( // Column stacks each of the widgets vertically
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(child: InfoWidget(_distanceInfo, 'Distance', '0', 'Mi.')), // Builds the Distance widget, expanded to the maximum size
                Expanded(child: InfoWidget(_rangeInfo, 'Range', '0', 'Mi.')), // Builds the battery range widget, expanded to the maximum size
              ],
            ),
            Expanded(child: GaugeWidget(_batteryInfo, "Battery", "%", 100, Colors.red, Colors.lightGreen)) // Builds the Battery gauge, expanded to the maximum size
          ],
        ),
      ),
    );
  }
}
