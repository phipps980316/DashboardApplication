import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crossfirstprototype/UI/Dashboard/DashboardWidget.dart';
import 'package:crossfirstprototype/UI/Info/InfoBarWidget.dart';
import 'package:crossfirstprototype/UI/Symbol/IndicatorBarWidget.dart';
import 'package:crossfirstprototype/UI/Symbol/WarningBarWidget.dart';

void main() {
  group('Dashboard Widget Component Tests', (){

    testWidgets('Widget Should Build', (WidgetTester tester) async {
      final GlobalKey<DashboardWidgetState> dashboard = new GlobalKey<DashboardWidgetState>();
      DashboardWidget dashboardWidget = new DashboardWidget(dashboard);
      await tester.pumpWidget(dashboardWidget);
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(find.byKey(dashboard), findsOneWidget);
      expect(find.byType(InfoBarWidget), findsOneWidget);
      expect(find.byType(IndicatorBarWidget), findsOneWidget);
      expect(find.byType(WarningBarWidget), findsOneWidget);
    });
  });
}
