import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crossfirstprototype/UI/Gauge/GaugeWidget.dart';

void main() {
  GlobalKey<GaugeWidgetState> gauge;
  GaugeWidget gaugeWidget;

  group('Gauge Widget Component Tests', (){

    setUp(() {
      gauge = new GlobalKey<GaugeWidgetState>();
      gaugeWidget = new GaugeWidget(gauge, "SPEED", "MPH", 120, Colors.green, Colors.red);
    });

    testWidgets('Widget Should Build', (WidgetTester tester) async {
      await tester.pumpWidget(gaugeWidget);
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(find.byKey(gauge), findsOneWidget);
      expect(find.text("SPEED"), findsOneWidget);
      expect(find.text("0 MPH"), findsOneWidget);
    });

    testWidgets('Widget Should Update Value', (WidgetTester tester) async {
      await tester.pumpWidget(gaugeWidget);
      await tester.pumpAndSettle(Duration(seconds: 5));
      gauge.currentState.updateValue("100");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(find.text("100 MPH"), findsOneWidget);
      expect(gauge.currentState.getValue(), "100");
    });
  });
}

