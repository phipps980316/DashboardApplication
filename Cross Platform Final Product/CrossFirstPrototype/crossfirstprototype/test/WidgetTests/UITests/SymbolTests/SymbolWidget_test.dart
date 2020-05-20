import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crossfirstprototype/UI/Symbol/SymbolWidget.dart';

void main() {
  GlobalKey<SymbolWidgetState> symbol;
  SymbolWidget symbolWidget;

  group('Symbol Widget Component Tests', (){

    setUp(() {
      symbol = new GlobalKey<SymbolWidgetState>();
      symbolWidget = new SymbolWidget(symbol, 'graphics/master_warning_grey.png');
    });

    testWidgets('Widget Should Build', (WidgetTester tester) async {
      await tester.pumpWidget(symbolWidget);
      expect(find.byKey(symbol), findsOneWidget);
      expect(symbol.currentState.getImageName(), 'graphics/master_warning_grey.png');
    });

    testWidgets('Widget Should Update Value', (WidgetTester tester) async {
      await tester.pumpWidget(symbolWidget);
      symbol.currentState.updateImage('graphics/master_warning_red.png');
      await tester.pump();
      expect(symbol.currentState.getImageName(), 'graphics/master_warning_red.png');
    });
  });
}