import 'package:flutter/material.dart';

// This represents the any widget with an image (warning icons, indicators, etc)
class SymbolWidget extends StatefulWidget {
  // Holds the name of the image on the widget
  final String _imageName;

  // Creates the symbol widget with a key for reference to the widget
  const SymbolWidget(Key key, this._imageName) : super(key: key);

  // Creates the initial state for the widget
  @override
  SymbolWidgetState createState() => SymbolWidgetState(_imageName);
}

// This then creates the state of the widget contents
class SymbolWidgetState extends State<SymbolWidget> with SingleTickerProviderStateMixin {
  String _imageName;  // Holds the image name of the symbol

  SymbolWidgetState(this._imageName);

  // Updates the image on the symbol if the state is changed
  void updateImage(String imageName) {
    setState(() {
      this._imageName = imageName;
    });
  }

  // Returns the current image on the symbol
  String getImageName() {
    return this._imageName;
  }

  @override
  Widget build(BuildContext context) {
    return Align( // Aligns the widgets to the centre
      alignment: Alignment.center,
      child: Column(  // Stacks each widget vertically
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded( // Expands the width of the widget to fit the area
          child: Padding( // Adds a padding around the image
              padding: EdgeInsets.all(5),
              child: Image(image: AssetImage(_imageName)))) // Uses an image in the Assets to create the symbol
        ],
      ),
    );
  }
}
