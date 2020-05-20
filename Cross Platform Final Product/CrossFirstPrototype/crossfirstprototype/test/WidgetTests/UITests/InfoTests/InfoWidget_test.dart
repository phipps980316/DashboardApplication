import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crossfirstprototype/UI/Info/InfoWidget.dart';

void main() {
  GlobalKey<InfoWidgetState> info;
  InfoWidget infoWidget;

  group('Info Widget Component Tests', (){

    setUp(() {
      info = new GlobalKey<InfoWidgetState>();
      infoWidget = new InfoWidget(info, "SPEED", "0", "MPH");
    });

    testWidgets('Widget Should Build', (WidgetTester tester) async {
      await tester.pumpWidget(infoWidget);
      expect(find.byKey(info), findsOneWidget);
      expect(find.text("SPEED"), findsOneWidget);
      expect(find.text("0 MPH"), findsOneWidget);
    });

    testWidgets('Widget Should Update Value', (WidgetTester tester) async {
      await tester.pumpWidget(infoWidget);
      info.currentState.updateValue("100");
      await tester.pump();
      expect(find.text("100 MPH"), findsOneWidget);
      expect(info.currentState.getValue(), "100");
    });
  });
}

