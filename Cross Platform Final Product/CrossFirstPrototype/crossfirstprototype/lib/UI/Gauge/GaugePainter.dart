import 'dart:math';
import 'package:flutter/material.dart';

class GaugePainter extends CustomPainter {
  // Attributes for the Gauge Painter
  final double _percent;
  final Color _startColor;
  final Color _endColor;

  GaugePainter(this._percent, this._startColor, this._endColor) : super();

  @override
  void paint(Canvas canvas, Size size) {

    Color color = Color.lerp(_startColor, _endColor, _percent); // Lerp is used to change the colour from one to another based on the percent value of the gauge

    // Creates a paint brush for the background of the gauge
    Paint backBrush = new Paint()
      ..strokeWidth = 35.0
      ..color = Colors.grey.withOpacity(0.4)
      ..style = PaintingStyle.stroke;

    // Creates a paint brush for the foreground of the gauge
    Paint arcBrush = new Paint()
      ..strokeWidth = 35.0
      ..color = color.withOpacity(0.8)
      ..style = PaintingStyle.stroke;

    // Defines the positioning of the gauge
    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    // Defines where the arc starts to draw and where it finishes (to give it correct shape).
    double arcStart = 0.75 * (pi);
    double arcEnd = 1.5 * (pi);

    // Draws the arc on the UI depending on the percent value received
    Rect rect = new Rect.fromCircle(center: center,radius: radius);
    canvas.drawArc(rect, arcStart, arcEnd, false, backBrush);
    canvas.drawArc(rect, arcStart, arcEnd * _percent, false, arcBrush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}