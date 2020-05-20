import 'package:flutter/material.dart';
import 'package:crossfirstprototype/UI/Symbol/WarningBarWidget.dart';
import 'package:crossfirstprototype/UI/Info/InfoBarWidget.dart';
import 'package:crossfirstprototype/UI/Symbol/IndicatorBarWidget.dart';

// This represents the main dashboard widget to hold all of the widgets
class DashboardWidget extends StatefulWidget {
  // Creates the dashboard widget with a key for reference to the widget
  DashboardWidget(Key key) : super(key: key);

  // Creates the initial state for the widget
  @override
  DashboardWidgetState createState() => DashboardWidgetState();
}

// This then creates the state of the widget contents
class DashboardWidgetState extends State<DashboardWidget> {

  // These are used to access the widget after they have been build
  final GlobalKey<WarningBarWidgetState> _warningBar = GlobalKey<WarningBarWidgetState>();
  final GlobalKey<InfoBarWidgetState> _infoBar = GlobalKey<InfoBarWidgetState>();
  final GlobalKey<IndicatorBarWidgetState> _indicatorBar = GlobalKey<IndicatorBarWidgetState>();

  // This returns a reference to the Warning bar widget inside the Dashboard widget
  WarningBarWidgetState updateWarningBar(){
    return _warningBar.currentState;
  }

  // This returns a reference to the Update information bar widget inside the Dashboard widget
  InfoBarWidgetState updateInfoBar(){
    return _infoBar.currentState;
  }

  // This returns a reference to the Indicator bar widget inside the Dashboard widget
  IndicatorBarWidgetState updateIndicatorBar(){
    return _indicatorBar.currentState;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(  // This makes sure the text direction is left to right
      textDirection: TextDirection.ltr,
      child: Align( // Aligns the widgets to the centre
        alignment: Alignment.center,
        child: Column(  // Stacks each widget vertically
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(flex: 1, child: WarningBarWidget(_warningBar)),   // Builds the Warning bar, expanded to the maximum width and flex height
            Expanded(flex: 3, child: InfoBarWidget(_infoBar)), // Builds the Info bar, expanded to the maximum width and flex height
            Expanded(flex: 1, child: IndicatorBarWidget(_indicatorBar)) // Builds the Indicator bar, expanded to the maximum width and flex height
          ],
        ),
      ),
    );
  }
}
