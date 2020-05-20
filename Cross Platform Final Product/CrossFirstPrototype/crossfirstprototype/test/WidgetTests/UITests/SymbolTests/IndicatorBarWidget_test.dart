import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crossfirstprototype/UI/Symbol/IndicatorBarWidget.dart';
import 'package:crossfirstprototype/UI/Symbol/SymbolWidget.dart';

void main() {
  GlobalKey<IndicatorBarWidgetState> indicators;
  IndicatorBarWidget indicatorBarWidget;

  group('Indicator Bar Widget Component Tests', (){

    setUp(() {
      indicators = new GlobalKey<IndicatorBarWidgetState>();
      indicatorBarWidget = new IndicatorBarWidget(indicators);
    });

    testWidgets('Widget Should Build', (WidgetTester tester) async {
      await tester.pumpWidget(indicatorBarWidget);
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(find.byKey(indicators), findsOneWidget);
      expect(find.byType(SymbolWidget), findsNWidgets(2));
      expect(indicators.currentState.getLeftIndicatorImageName(), "graphics/left_indicator_grey.png");
      expect(indicators.currentState.getRightIndicatorImageName(), "graphics/right_indicator_grey.png");
    });

    testWidgets('Widget Should Update Left Indicator', (WidgetTester tester) async {
      await tester.pumpWidget(indicatorBarWidget);
      await tester.pumpAndSettle(Duration(seconds: 5));
      indicators.currentState.leftIndicatorOn();
      await tester.pump();
      expect(indicators.currentState.getLeftIndicatorImageName(), "graphics/left_indicator_green.png");
      expect(indicators.currentState.getRightIndicatorImageName(), "graphics/right_indicator_grey.png");
    });

    testWidgets('Widget Should Update Right Indicator', (WidgetTester tester) async {
      await tester.pumpWidget(indicatorBarWidget);
      await tester.pumpAndSettle(Duration(seconds: 5));
      indicators.currentState.rightIndicatorOn();
      await tester.pump();
      expect(indicators.currentState.getLeftIndicatorImageName(), "graphics/left_indicator_grey.png");
      expect(indicators.currentState.getRightIndicatorImageName(), "graphics/right_indicator_green.png");
    });

    testWidgets('Widget Should Update No Indicators', (WidgetTester tester) async {
      await tester.pumpWidget(indicatorBarWidget);
      await tester.pumpAndSettle(Duration(seconds: 5));
      indicators.currentState.noIndicatorOn();
      await tester.pump();
      expect(indicators.currentState.getLeftIndicatorImageName(), "graphics/left_indicator_grey.png");
      expect(indicators.currentState.getRightIndicatorImageName(), "graphics/right_indicator_grey.png");
    });
  });
}