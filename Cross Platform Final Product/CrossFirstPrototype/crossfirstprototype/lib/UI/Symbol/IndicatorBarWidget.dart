import 'package:flutter/material.dart';
import 'package:crossfirstprototype/UI/Symbol/SymbolWidget.dart';

// This represents the Indicator bar widget to manage each indicator
class IndicatorBarWidget extends StatefulWidget {

  // Creates the Indicator bar widget with a key for reference to the widget
  IndicatorBarWidget(Key key) : super(key : key);

  // Creates the initial state for the widget
  @override
  IndicatorBarWidgetState createState() => IndicatorBarWidgetState();
}

// This then creates the state of the widget contents
class IndicatorBarWidgetState extends State<IndicatorBarWidget> {

  // These are used to access the widget after they have been build
  final GlobalKey<SymbolWidgetState> _leftIndicatorIcon = GlobalKey<SymbolWidgetState>();
  final GlobalKey<SymbolWidgetState> _rightIndicatorIcon = GlobalKey<SymbolWidgetState>();

  // Handles if the left indicator is showing and has stopped
  bool _leftVisible = true;
  bool _leftStop = true;

  // Handles if the right indicator is showing and has stopped
  bool _rightVisible = true;
  bool _rightStop = true;

  // Starts the animation for the left indicator
  void leftIndicatorOn(){
    setState(() {
      // Stops the right and starts the Left
      _leftStop = false;
      _rightStop = true;
      // Updates the left to green and right to grey
      _leftIndicatorIcon.currentState.updateImage('graphics/left_indicator_green.png');
      _rightIndicatorIcon.currentState.updateImage('graphics/right_indicator_grey.png');
      // Reverse the opacity of the image which starts the animation
      _leftVisible = !_leftVisible;
    });
  }

  // Starts the animation for the left indicator
  void rightIndicatorOn(){
    setState(() {
      // Stops the left and starts the right
      _leftStop = true;
      _rightStop = false;
      // Updates the right to green and left to grey
      _leftIndicatorIcon.currentState.updateImage('graphics/left_indicator_grey.png');
      _rightIndicatorIcon.currentState.updateImage('graphics/right_indicator_green.png');
      // Reverse the opacity of the image which starts the animation
      _rightVisible = !_rightVisible;
    });
  }

  // Stops all animations
  void noIndicatorOn(){
    setState(() {
      // Stops the left and right
      _leftStop = true;
      _rightStop = true;
      // Updates both images to grey
      _leftIndicatorIcon.currentState.updateImage('graphics/left_indicator_grey.png');
      _rightIndicatorIcon.currentState.updateImage('graphics/right_indicator_grey.png');
    });
  }

  // Returns the file name of the image
  String getLeftIndicatorImageName(){
    return _leftIndicatorIcon.currentState.getImageName();
  }

  // Returns the file name of the image
  String getRightIndicatorImageName(){
    return _rightIndicatorIcon.currentState.getImageName();
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
            Expanded(child: // Builds the Left indicator symbol, expanded to the maximum size
              AnimatedOpacity(  // Creates an animated opacity for the left indicator which animates it going on and off
                opacity: _leftVisible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                onEnd: () {
                  setState(() {
                    if (_leftStop == false) _leftVisible = !_leftVisible;
                    if (_leftStop == true) _leftVisible = true;
                  });
                },
                //child: Image(image: AssetImage(_leftImageName))),
                child: SymbolWidget(_leftIndicatorIcon, 'graphics/left_indicator_grey.png'))),
            Expanded(child: // Builds the Right indicator symbol, expanded to the maximum size
              AnimatedOpacity(  // Creates an animated opacity for the right indicator which animates it going on and off
                opacity: _rightVisible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                onEnd: () {
                  setState(() {
                    if (_rightStop == false) _rightVisible = !_rightVisible;
                    if (_rightStop == true) _rightVisible = true;
                  });
                },
                //child: Image(image: AssetImage(_rightImageName))),
                child: SymbolWidget(_rightIndicatorIcon, 'graphics/right_indicator_grey.png'))),
          ],
        ),
      ),
    );
  }
}
