import 'package:flutter/material.dart';

// This represents the Info widget to manage the individual statical information on the vehicle
class InfoWidget extends StatefulWidget {
  final String _title;
  final String _value;
  final String _suffix;

  // Creates the Info widget with a key for reference to the widget
  InfoWidget(Key key, this._title, this._value, this._suffix) : super(key: key);

  // Creates the initial state for the widget
  @override
  InfoWidgetState createState() => InfoWidgetState(_title, _value, _suffix);
}

// This then creates the state of the widget contents
class InfoWidgetState extends State<InfoWidget> {
  // Attributes needed for each info widget
  String _title;
  String _value;
  String _suffix;

  // Constructor for the state which passes in the needed values
  InfoWidgetState(this._title, this._value, this._suffix);

  // Updates the value in the widget
  void updateValue(String value) {
    setState(() {
      this._value = value;
    });
  }

  // Returns the value in the widget
  String getValue() {
    return this._value;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(  // This makes sure the text direction is left to right
        textDirection: TextDirection.ltr,
        child: Align( // Aligns the widgets to the centre
            alignment: Alignment.center,
            child: Column(  // Column stacks each of the widgets vertically
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(_title,  // Creates a text element to show the title
                    style: TextStyle(fontSize: 18, color: Colors.grey)),
                Text((_value + " " + _suffix),  // Creates a text element to show the suffix
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey))
              ],
            )));
  }
}
