import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crossfirstprototype/UI/Symbol/WarningBarWidget.dart';
import 'package:crossfirstprototype/UI/Symbol/SymbolWidget.dart';

void main() {
  GlobalKey<WarningBarWidgetState> warnings;
  WarningBarWidget warningBarWidget;

  group('Warning Bar Widget Component Tests', (){

    setUp(() {
      warnings = new GlobalKey<WarningBarWidgetState>();
      warningBarWidget = new WarningBarWidget(warnings);
    });

    testWidgets('Widget Should Build', (WidgetTester tester) async {
      await tester.pumpWidget(warningBarWidget);
      expect(find.byKey(warnings), findsOneWidget);
      expect(find.byType(SymbolWidget), findsNWidgets(12));
      expect(warnings.currentState.getMasterWarningImageName(), "graphics/master_warning_grey.png");
      expect(warnings.currentState.getSeatbeltWarningImageName(), "graphics/seatbelt_warning_grey.png");
      expect(warnings.currentState.getWiperFluidImageName(), "graphics/low_wiper_fluid_grey.png");
      expect(warnings.currentState.getTirePressureImageName(), "graphics/low_tire_pressure_grey.png");
      expect(warnings.currentState.getAirbagFaultImageName(), "graphics/airbag_fault_grey.png");
      expect(warnings.currentState.getBrakeWarningImageName(), "graphics/brake_warning_grey.png");
      expect(warnings.currentState.getABSFaultImageName(), "graphics/abs_fault_grey.png");
      expect(warnings.currentState.getEDSFaultImageName(), "graphics/electric_drive_system_fault_grey.png");
      expect(warnings.currentState.getTempImageName(), "graphics/temp_grey.png");
      expect(warnings.currentState.getParkingBrakeImageName(), "graphics/parking_brake_grey.png");
      expect(warnings.currentState.getLightBeamImageName(), "graphics/no_lightbeam_grey.png");
      expect(warnings.currentState.getConnectionImageName(), "graphics/connection_grey.png");
    });

    testWidgets('Widget Should Update Master Warning', (WidgetTester tester) async {
      await tester.pumpWidget(warningBarWidget);
      warnings.currentState.updateMasterWarningIcon("graphics/master_warning_red.png");
      await tester.pump();
      expect(warnings.currentState.getMasterWarningImageName(), "graphics/master_warning_red.png");
    });

    testWidgets('Widget Should Update Seatbelt Warning', (WidgetTester tester) async {
      await tester.pumpWidget(warningBarWidget);
      warnings.currentState.updateSeatbeltWarningIcon("graphics/seatbelt_warning_red.png");
      await tester.pump();
      expect(warnings.currentState.getSeatbeltWarningImageName(), "graphics/seatbelt_warning_red.png");
    });

    testWidgets('Widget Should Update Wiper Warning', (WidgetTester tester) async {
      await tester.pumpWidget(warningBarWidget);
      warnings.currentState.updateWiperFluidIcon("graphics/low_wiper_fluid_red.png");
      await tester.pump();
      expect(warnings.currentState.getWiperFluidImageName(), "graphics/low_wiper_fluid_red.png");
    });

    testWidgets('Widget Should Update Tire Warning', (WidgetTester tester) async {
      await tester.pumpWidget(warningBarWidget);
      warnings.currentState.updateTirePressureIcon("graphics/low_tire_pressure_red.png");
      await tester.pump();
      expect(warnings.currentState.getTirePressureImageName(), "graphics/low_tire_pressure_red.png");
    });

    testWidgets('Widget Should Update Airbag Warning', (WidgetTester tester) async {
      await tester.pumpWidget(warningBarWidget);
      warnings.currentState.updateAirbagFaultIcon("graphics/airbag_fault_red.png");
      await tester.pump();
      expect(warnings.currentState.getAirbagFaultImageName(), "graphics/airbag_fault_red.png");
    });

    testWidgets('Widget Should Update Brake Warning', (WidgetTester tester) async {
      await tester.pumpWidget(warningBarWidget);
      warnings.currentState.updateBrakeWarningIcon("graphics/brake_warning_red.png");
      await tester.pump();
      expect(warnings.currentState.getBrakeWarningImageName(), "graphics/brake_warning_red.png");
    });

    testWidgets('Widget Should Update ABS Warning', (WidgetTester tester) async {
      await tester.pumpWidget(warningBarWidget);
      warnings.currentState.updateABSFaultIcon("graphics/abs_fault_red.png");
      await tester.pump();
      expect(warnings.currentState.getABSFaultImageName(), "graphics/abs_fault_red.png");
    });

    testWidgets('Widget Should Update EDS Warning', (WidgetTester tester) async {
      await tester.pumpWidget(warningBarWidget);
      warnings.currentState.updateEDSFaultIcon("graphics/electric_drive_system_fault_red.png");
      await tester.pump();
      expect(warnings.currentState.getEDSFaultImageName(), "graphics/electric_drive_system_fault_red.png");
    });

    testWidgets('Widget Should Update Temperature Warning', (WidgetTester tester) async {
      await tester.pumpWidget(warningBarWidget);
      warnings.currentState.updateTempIcon("graphics/temp_red.png");
      await tester.pump();
      expect(warnings.currentState.getTempImageName(), "graphics/temp_red.png");
    });

    testWidgets('Widget Should Update Parking Brake Warning', (WidgetTester tester) async {
      await tester.pumpWidget(warningBarWidget);
      warnings.currentState.updateParkingBrakeIcon("graphics/parking_brake_red.png");
      await tester.pump();
      expect(warnings.currentState.getParkingBrakeImageName(), "graphics/parking_brake_red.png");
    });

    testWidgets('Widget Should Update Light Status', (WidgetTester tester) async {
      await tester.pumpWidget(warningBarWidget);
      warnings.currentState.updateLightBeamIcon("graphics/med_lightbeam_green.png");
      await tester.pump();
      expect(warnings.currentState.getLightBeamImageName(), "graphics/med_lightbeam_green.png");
    });

    testWidgets('Widget Should Update Connection Status', (WidgetTester tester) async {
      await tester.pumpWidget(warningBarWidget);
      warnings.currentState.updateConnectionIcon("graphics/connection_green.png");
      await tester.pump();
      expect(warnings.currentState.getConnectionImageName(), "graphics/connection_green.png");
    });

    testWidgets('Widget Should Update All Warnings', (WidgetTester tester) async {
      await tester.pumpWidget(warningBarWidget);
      warnings.currentState.updateMasterWarningIcon("graphics/master_warning_red.png");
      warnings.currentState.updateSeatbeltWarningIcon("graphics/seatbelt_warning_red.png");
      warnings.currentState.updateWiperFluidIcon("graphics/low_wiper_fluid_red.png");
      warnings.currentState.updateTirePressureIcon("graphics/low_tire_pressure_red.png");
      warnings.currentState.updateAirbagFaultIcon("graphics/airbag_fault_red.png");
      warnings.currentState.updateBrakeWarningIcon("graphics/brake_warning_red.png");
      warnings.currentState.updateABSFaultIcon("graphics/abs_fault_red.png");
      warnings.currentState.updateEDSFaultIcon("graphics/electric_drive_system_fault_red.png");
      warnings.currentState.updateTempIcon("graphics/temp_red.png");
      warnings.currentState.updateParkingBrakeIcon("graphics/parking_brake_red.png");
      warnings.currentState.updateLightBeamIcon("graphics/med_lightbeam_green.png");
      warnings.currentState.updateConnectionIcon("graphics/connection_green.png");
      await tester.pump();
      expect(warnings.currentState.getMasterWarningImageName(), "graphics/master_warning_red.png");
      expect(warnings.currentState.getSeatbeltWarningImageName(), "graphics/seatbelt_warning_red.png");
      expect(warnings.currentState.getWiperFluidImageName(), "graphics/low_wiper_fluid_red.png");
      expect(warnings.currentState.getTirePressureImageName(), "graphics/low_tire_pressure_red.png");
      expect(warnings.currentState.getAirbagFaultImageName(), "graphics/airbag_fault_red.png");
      expect(warnings.currentState.getBrakeWarningImageName(), "graphics/brake_warning_red.png");
      expect(warnings.currentState.getABSFaultImageName(), "graphics/abs_fault_red.png");
      expect(warnings.currentState.getEDSFaultImageName(), "graphics/electric_drive_system_fault_red.png");
      expect(warnings.currentState.getTempImageName(), "graphics/temp_red.png");
      expect(warnings.currentState.getParkingBrakeImageName(), "graphics/parking_brake_red.png");
      expect(warnings.currentState.getLightBeamImageName(), "graphics/med_lightbeam_green.png");
      expect(warnings.currentState.getConnectionImageName(), "graphics/connection_green.png");
    });
  });
}