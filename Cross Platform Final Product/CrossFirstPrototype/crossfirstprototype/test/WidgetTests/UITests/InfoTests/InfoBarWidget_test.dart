import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crossfirstprototype/UI/Info/InfoBarWidget.dart';
import 'package:crossfirstprototype/UI/Info/InfoWidget.dart';
import 'package:crossfirstprototype/UI/Gauge/GaugeWidget.dart';

void main() {
  GlobalKey<InfoBarWidgetState> info;
  InfoBarWidget infoWidget;

  group('Info Bar Widget Component Tests', (){

    setUp(() {
      info = new GlobalKey<InfoBarWidgetState>();
      infoWidget = new InfoBarWidget(info);
    });

    testWidgets('Widget Should Build', (WidgetTester tester) async {
      await tester.pumpWidget(infoWidget);
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(find.byKey(info), findsOneWidget);
      expect(find.byType(InfoWidget), findsWidgets);
      expect(find.byType(GaugeWidget), findsWidgets);
      expect(find.text("Speed"), findsOneWidget);
      expect(find.text("0 MPH"), findsOneWidget);
      expect(find.text("Distance"), findsOneWidget);
      expect(find.text("0 Mi."), findsWidgets);
      expect(find.text("Range"), findsOneWidget);
      expect(find.text("0 Mi."), findsWidgets);
      expect(find.text("Battery"), findsOneWidget);
      expect(find.text("0 %"), findsOneWidget);
    });

    testWidgets('Widget Should Update Speed Value', (WidgetTester tester) async {
      await tester.pumpWidget(infoWidget);
      await tester.pumpAndSettle(Duration(seconds: 5));
      info.currentState.updateSpeedInfo("100");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(find.text("100 MPH"), findsOneWidget);
      expect(info.currentState.getSpeedInfo(), "100");
    });

    testWidgets('Widget Should Update Distance Value', (WidgetTester tester) async {
      await tester.pumpWidget(infoWidget);
      info.currentState.updateDistanceInfo("999");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(find.text("999 Mi."), findsOneWidget);
      expect(info.currentState.getDistanceInfo(), "999");
    });

    testWidgets('Widget Should Update Range Value', (WidgetTester tester) async {
      await tester.pumpWidget(infoWidget);
      info.currentState.updateRangeInfo("500");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(find.text("500 Mi."), findsOneWidget);
      expect(info.currentState.getRangeInfo(), "500");
    });

    testWidgets('Widget Should Update Battery Value', (WidgetTester tester) async {
      await tester.pumpWidget(infoWidget);
      await tester.pumpAndSettle(Duration(seconds: 5));
      info.currentState.updateBatteryInfo("55");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(find.text("55 %"), findsOneWidget);
      expect(info.currentState.getBatteryInfo(), "55");
    });

    testWidgets('Widget Should Update All Values', (WidgetTester tester) async {
      await tester.pumpWidget(infoWidget);
      await tester.pumpAndSettle(Duration(seconds: 5));
      info.currentState.updateSpeedInfo("100");
      info.currentState.updateDistanceInfo("999");
      info.currentState.updateRangeInfo("500");
      info.currentState.updateBatteryInfo("55");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(find.text("100 MPH"), findsOneWidget);
      expect(info.currentState.getSpeedInfo(), "100");
      expect(find.text("999 Mi."), findsOneWidget);
      expect(info.currentState.getDistanceInfo(), "999");
      expect(find.text("500 Mi."), findsOneWidget);
      expect(info.currentState.getRangeInfo(), "500");
      expect(find.text("55 %"), findsOneWidget);
      expect(info.currentState.getBatteryInfo(), "55");
    });
  });
}