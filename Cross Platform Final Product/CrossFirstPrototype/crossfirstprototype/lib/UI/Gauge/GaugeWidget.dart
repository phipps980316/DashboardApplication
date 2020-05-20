import 'package:flutter/material.dart';
import 'package:crossfirstprototype/UI/Info/InfoWidget.dart';
import 'GaugePainter.dart';

// This represents the Gauge widget to manage each gauge (battery and speed)
class GaugeWidget extends StatefulWidget {
  // Attributes required for the gauge
  final String _title;
  final String _suffix;
  final double _maxValue;
  final Color _startColor;
  final Color _endColor;

  // Creates the gauge widget with a key for reference to the widget
  GaugeWidget(Key key, this._title, this._suffix, this._maxValue,
      this._startColor, this._endColor)
      : super(key: key);

  // Creates the initial state for the widget
  @override
  GaugeWidgetState createState() =>
      GaugeWidgetState(_title, _suffix, _maxValue, _startColor, _endColor);
}

// This then creates the state of the widget contents
class GaugeWidgetState extends State<GaugeWidget> with SingleTickerProviderStateMixin {
  // Attributes for the animation
  Animation<double> _animation;
  AnimationController _animationController;

  // Attributes for the current state of the animation
  final String _title;
  final String _suffix;
  final double _maxValue;
  final Color _startColor;
  final Color _endColor;
  String _value = "0";
  double _begin = 0;
  double _end = 0;

  // When the widget state is created, all of the required values are saved and the animation controller is initialised
  GaugeWidgetState(this._title, this._suffix, this._maxValue, this._startColor, this._endColor) {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 320));
  }

  // This methods updates the value for the gauges current percentage
  void updateValue(String value) {
    setState(() {
      double newValue = double.parse(value);
      if (newValue < 0) newValue = 0;
      else if (newValue > _maxValue) newValue = _maxValue;
      _begin = _end;
      _end = newValue / _maxValue;
      _value = value;
    });
  }

  // Returns the current speed/battery value
  String getValue() {
    return _value;
  }

  @override
  Widget build(BuildContext context) {
    _animationController.reset(); // Resets the animation controller
    _animation = Tween<double>(begin: _begin, end: _end).animate(_animationController); // Initialises the animation and starts to animate with the animation controller
    // Listens for if the value on the gauge has been changed, and updates the value
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _begin = _end;
      }
    });

    _animationController.forward();

    return AnimatedBuilder(
        animation: _animation,
        builder: (context, widget) {
          return Padding( // Adds a padding around the gauge
              padding: new EdgeInsets.all(12.0),
              child: CustomPaint( // Creates a custom paint
                  foregroundPainter: GaugePainter(_animation.value, _startColor, _endColor),  // The Custom paint will paint the gauge with the correct value
                  child: InfoWidget(GlobalKey<InfoWidgetState>(), _title, _value, _suffix))); // Which will then display as a number below the gauge
        });
  }
}
