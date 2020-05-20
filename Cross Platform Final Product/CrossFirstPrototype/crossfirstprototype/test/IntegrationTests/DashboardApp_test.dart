import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:crossfirstprototype/Service/DashboardBLEService.dart';
import 'package:crossfirstprototype/UI/Dashboard/DashboardWidget.dart';

void main() {
  GlobalKey<DashboardWidgetState> dashboard;
  DashboardWidget dashboardWidget;
  DashboardBLEService bleService;

  group("Dashboard Application Intergration Tests", () {

    setUp(() {
      dashboard = new GlobalKey<DashboardWidgetState>();
      dashboardWidget = new DashboardWidget(dashboard);
      bleService = new DashboardBLEService(dashboard, false);
    });

    testWidgets('Dashboard Should Update Speed Value', (WidgetTester tester) async {
      await tester.pumpWidget(dashboardWidget);
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateInfoBar().getSpeedInfo(), "0");
      bleService.characteristicDidUpdate("66", "7b9b53ff-5421-4bdf-beb0-ca8c949542c1");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateInfoBar().getSpeedInfo(), "66");
      expect(find.text("66 MPH"), findsOneWidget);
    });

    testWidgets('Dashboard Should Update Battery Level Value', (WidgetTester tester) async {
      await tester.pumpWidget(dashboardWidget);
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateInfoBar().getBatteryInfo(), "0");
      bleService.characteristicDidUpdate("80", "76a247fb-a76f-42da-91ce-d6a5bdebd0e2");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateInfoBar().getBatteryInfo(), "80");
      expect(find.text("80 %"), findsOneWidget);
    });

    testWidgets('Dashboard Should Update Distance Value', (WidgetTester tester) async {
      await tester.pumpWidget(dashboardWidget);
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateInfoBar().getDistanceInfo(), "0");
      bleService.characteristicDidUpdate("1000", "5bebe839-c2e2-4fad-bb18-65f792ddb16f");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateInfoBar().getDistanceInfo(), "1000");
      expect(find.text("1000 Mi."), findsOneWidget);
    });

    testWidgets('Dashboard Should Update Range Value', (WidgetTester tester) async {
      await tester.pumpWidget(dashboardWidget);
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateInfoBar().getRangeInfo(), "0");
      bleService.characteristicDidUpdate("540", "bf252fd6-c1e3-4835-b4be-b5e353e62d7b");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateInfoBar().getRangeInfo(), "540");
      expect(find.text("540 Mi."), findsOneWidget);
    });

    testWidgets('Dashboard Should Update Seatbelt Warning', (WidgetTester tester) async {
      await tester.pumpWidget(dashboardWidget);
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_grey.png");
      expect(dashboard.currentState.updateWarningBar().getSeatbeltWarningImageName(), "graphics/seatbelt_warning_grey.png");
      bleService.characteristicDidUpdate("1", "da2d9231-ae69-4b5b-b4dc-d7c940e72815");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_red.png");
      expect(dashboard.currentState.updateWarningBar().getSeatbeltWarningImageName(), "graphics/seatbelt_warning_red.png");
      bleService.characteristicDidUpdate("0", "da2d9231-ae69-4b5b-b4dc-d7c940e72815");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_grey.png");
      expect(dashboard.currentState.updateWarningBar().getSeatbeltWarningImageName(), "graphics/seatbelt_warning_grey.png");
    });

    testWidgets('Dashboard Should Update Wiper Warning', (WidgetTester tester) async {
      await tester.pumpWidget(dashboardWidget);
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_grey.png");
      expect(dashboard.currentState.updateWarningBar().getWiperFluidImageName(), "graphics/low_wiper_fluid_grey.png");
      bleService.characteristicDidUpdate("1", "0b458d6d-4e0c-442d-9c18-febd81281d78");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_red.png");
      expect(dashboard.currentState.updateWarningBar().getWiperFluidImageName(), "graphics/low_wiper_fluid_red.png");
      bleService.characteristicDidUpdate("0", "0b458d6d-4e0c-442d-9c18-febd81281d78");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_grey.png");
      expect(dashboard.currentState.updateWarningBar().getWiperFluidImageName(), "graphics/low_wiper_fluid_grey.png");
    });

    testWidgets('Dashboard Should Update Tire Warning', (WidgetTester tester) async {
      await tester.pumpWidget(dashboardWidget);
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_grey.png");
      expect(dashboard.currentState.updateWarningBar().getTirePressureImageName(), "graphics/low_tire_pressure_grey.png");
      bleService.characteristicDidUpdate("1", "ce99220c-75ed-4d38-9b25-5a0f7e766016");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_red.png");
      expect(dashboard.currentState.updateWarningBar().getTirePressureImageName(), "graphics/low_tire_pressure_red.png");
      bleService.characteristicDidUpdate("0", "ce99220c-75ed-4d38-9b25-5a0f7e766016");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_grey.png");
      expect(dashboard.currentState.updateWarningBar().getTirePressureImageName(), "graphics/low_tire_pressure_grey.png");
    });

    testWidgets('Dashboard Should Update Airbag Warning', (WidgetTester tester) async {
      await tester.pumpWidget(dashboardWidget);
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_grey.png");
      expect(dashboard.currentState.updateWarningBar().getAirbagFaultImageName(), "graphics/airbag_fault_grey.png");
      bleService.characteristicDidUpdate("1", "8be2a5a1-5e2e-4344-9304-fb642b55746e");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_red.png");
      expect(dashboard.currentState.updateWarningBar().getAirbagFaultImageName(), "graphics/airbag_fault_red.png");
      bleService.characteristicDidUpdate("0", "8be2a5a1-5e2e-4344-9304-fb642b55746e");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_grey.png");
      expect(dashboard.currentState.updateWarningBar().getAirbagFaultImageName(), "graphics/airbag_fault_grey.png");
    });

    testWidgets('Dashboard Should Update Brake Warning', (WidgetTester tester) async {
      await tester.pumpWidget(dashboardWidget);
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_grey.png");
      expect(dashboard.currentState.updateWarningBar().getBrakeWarningImageName(), "graphics/brake_warning_grey.png");
      bleService.characteristicDidUpdate("1", "b45ea8a5-7d70-41bc-82a3-51cd35d594cc");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_red.png");
      expect(dashboard.currentState.updateWarningBar().getBrakeWarningImageName(), "graphics/brake_warning_orange.png");
      bleService.characteristicDidUpdate("0", "b45ea8a5-7d70-41bc-82a3-51cd35d594cc");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_grey.png");
      expect(dashboard.currentState.updateWarningBar().getBrakeWarningImageName(), "graphics/brake_warning_grey.png");
      bleService.characteristicDidUpdate("2", "b45ea8a5-7d70-41bc-82a3-51cd35d594cc");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_red.png");
      expect(dashboard.currentState.updateWarningBar().getBrakeWarningImageName(), "graphics/brake_warning_red.png");
    });

    testWidgets('Dashboard Should Update ABS Warning', (WidgetTester tester) async {
      await tester.pumpWidget(dashboardWidget);
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_grey.png");
      expect(dashboard.currentState.updateWarningBar().getABSFaultImageName(), "graphics/abs_fault_grey.png");
      bleService.characteristicDidUpdate("1", "ce3843db-ef55-4b8d-a02a-e0eb4963a1e0");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_red.png");
      expect(dashboard.currentState.updateWarningBar().getABSFaultImageName(), "graphics/abs_fault_orange.png");
      bleService.characteristicDidUpdate("0", "ce3843db-ef55-4b8d-a02a-e0eb4963a1e0");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_grey.png");
      expect(dashboard.currentState.updateWarningBar().getABSFaultImageName(), "graphics/abs_fault_grey.png");
      bleService.characteristicDidUpdate("2", "ce3843db-ef55-4b8d-a02a-e0eb4963a1e0");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_red.png");
      expect(dashboard.currentState.updateWarningBar().getABSFaultImageName(), "graphics/abs_fault_red.png");
    });

    testWidgets('Dashboard Should Update EDS Warning', (WidgetTester tester) async {
      await tester.pumpWidget(dashboardWidget);
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_grey.png");
      expect(dashboard.currentState.updateWarningBar().getEDSFaultImageName(), "graphics/electric_drive_system_fault_grey.png");
      bleService.characteristicDidUpdate("1", "d93f1c6c-6e14-44b3-95ce-d0a7f71efbb5");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_red.png");
      expect(dashboard.currentState.updateWarningBar().getEDSFaultImageName(), "graphics/electric_drive_system_fault_orange.png");
      bleService.characteristicDidUpdate("0", "d93f1c6c-6e14-44b3-95ce-d0a7f71efbb5");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_grey.png");
      expect(dashboard.currentState.updateWarningBar().getEDSFaultImageName(), "graphics/electric_drive_system_fault_grey.png");
      bleService.characteristicDidUpdate("2", "d93f1c6c-6e14-44b3-95ce-d0a7f71efbb5");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_red.png");
      expect(dashboard.currentState.updateWarningBar().getEDSFaultImageName(), "graphics/electric_drive_system_fault_red.png");
    });

    testWidgets('Dashboard Should Update Temperature Warning', (WidgetTester tester) async {
      await tester.pumpWidget(dashboardWidget);
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_grey.png");
      expect(dashboard.currentState.updateWarningBar().getTempImageName(), "graphics/temp_grey.png");
      bleService.characteristicDidUpdate("5", "4751b324-3935-4b1e-a4e7-9c0888d03325");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_grey.png");
      expect(dashboard.currentState.updateWarningBar().getTempImageName(), "graphics/temp_blue.png");
      bleService.characteristicDidUpdate("15", "4751b324-3935-4b1e-a4e7-9c0888d03325");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_grey.png");
      expect(dashboard.currentState.updateWarningBar().getTempImageName(), "graphics/temp_grey.png");
      bleService.characteristicDidUpdate("25", "4751b324-3935-4b1e-a4e7-9c0888d03325");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_red.png");
      expect(dashboard.currentState.updateWarningBar().getTempImageName(), "graphics/temp_red.png");
    });

    testWidgets('Dashboard Should Update Parking Brake Warning', (WidgetTester tester) async {
      await tester.pumpWidget(dashboardWidget);
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getParkingBrakeImageName(), "graphics/parking_brake_grey.png");
      bleService.characteristicDidUpdate("1", "f05976f6-aa9e-4d19-a255-aeda7dbb624f");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getParkingBrakeImageName(), "graphics/parking_brake_red.png");
      bleService.characteristicDidUpdate("0", "f05976f6-aa9e-4d19-a255-aeda7dbb624f");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getParkingBrakeImageName(), "graphics/parking_brake_grey.png");
    });

    testWidgets('Dashboard Should Update Light Status', (WidgetTester tester) async {
      await tester.pumpWidget(dashboardWidget);
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_grey.png");
      expect(dashboard.currentState.updateWarningBar().getLightBeamImageName(), "graphics/no_lightbeam_grey.png");
      bleService.characteristicDidUpdate("1", "131223c4-1e5f-486a-9ab5-d85c41984f6f");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_grey.png");
      expect(dashboard.currentState.updateWarningBar().getLightBeamImageName(), "graphics/med_lightbeam_green.png");
      bleService.characteristicDidUpdate("2", "131223c4-1e5f-486a-9ab5-d85c41984f6f");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_grey.png");
      expect(dashboard.currentState.updateWarningBar().getLightBeamImageName(), "graphics/high_lightbeam_blue.png");
      bleService.characteristicDidUpdate("3", "131223c4-1e5f-486a-9ab5-d85c41984f6f");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_red.png");
      expect(dashboard.currentState.updateWarningBar().getLightBeamImageName(), "graphics/lights_fault_red.png");
      bleService.characteristicDidUpdate("0", "131223c4-1e5f-486a-9ab5-d85c41984f6f");
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(dashboard.currentState.updateWarningBar().getMasterWarningImageName(), "graphics/master_warning_grey.png");
      expect(dashboard.currentState.updateWarningBar().getLightBeamImageName(), "graphics/no_lightbeam_grey.png");
    });
  });
}