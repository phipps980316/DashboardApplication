import 'package:flutter_test/flutter_test.dart';
import 'package:crossfirstprototype/Service/DashboardUUIDs.dart';

void main(){
  DashboardUUIDs dashboardUUIDs;

  group('Dashboard UUID Tests', () {

    setUp(() {
      dashboardUUIDs = new DashboardUUIDs();
    });

    test('Should Fetch Service UUID', () {
      String serviceUUID = dashboardUUIDs.getService();
      expect(serviceUUID, "dee0e505-9680-430e-a4c4-a225905ce33d");
    });

    test('Should Fetch Characteristic UUIDs', () {
      Map<String, String> charUUIDs = dashboardUUIDs.getCharacteristics();
      expect(charUUIDs["SPEED"], "7b9b53ff-5421-4bdf-beb0-ca8c949542c1");
      expect(charUUIDs["BATTERY_LEVEL"], "76a247fb-a76f-42da-91ce-d6a5bdebd0e2");
      expect(charUUIDs["TURNING_INDICATOR"], "74df0c8f-f3e1-4cf5-b875-56d7ca609a2e");
      expect(charUUIDs["DISTANCE_TRAVELLED"], "5bebe839-c2e2-4fad-bb18-65f792ddb16f");
      expect(charUUIDs["RANGE_LEFT"], "bf252fd6-c1e3-4835-b4be-b5e353e62d7b");
      expect(charUUIDs["SEATBELT_WARNING"], "da2d9231-ae69-4b5b-b4dc-d7c940e72815");
      expect(charUUIDs["WIPER_WARNING"], "0b458d6d-4e0c-442d-9c18-febd81281d78");
      expect(charUUIDs["TIRE_PRESSURE_WARNING"], "ce99220c-75ed-4d38-9b25-5a0f7e766016");
      expect(charUUIDs["AIRBAG_WARNING"], "8be2a5a1-5e2e-4344-9304-fb642b55746e");
      expect(charUUIDs["BRAKE_WARNING"], "b45ea8a5-7d70-41bc-82a3-51cd35d594cc");
      expect(charUUIDs["ABS_WARNING"], "ce3843db-ef55-4b8d-a02a-e0eb4963a1e0");
      expect(charUUIDs["EDS_WARNING"], "d93f1c6c-6e14-44b3-95ce-d0a7f71efbb5");
      expect(charUUIDs["TEMP_WARNING"], "4751b324-3935-4b1e-a4e7-9c0888d03325");
      expect(charUUIDs["PARKING_BRAKE"], "f05976f6-aa9e-4d19-a255-aeda7dbb624f");
      expect(charUUIDs["LIGHTS_STATUS"], "131223c4-1e5f-486a-9ab5-d85c41984f6f");
    });
  });
}