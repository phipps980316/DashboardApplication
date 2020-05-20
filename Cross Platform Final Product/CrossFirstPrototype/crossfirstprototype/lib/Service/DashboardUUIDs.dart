class DashboardUUIDs {

  // Map to hold all of the characteristics
  final Map<String, String> _characteristicUUIDs = Map();

  // Service UUID to be used when connecting to the device
  final String _serviceUUID = "dee0e505-9680-430e-a4c4-a225905ce33d";

  // Adds all of the characteristic UUIDs to the map so they can be updated on the UI
  DashboardUUIDs(){
    _characteristicUUIDs["SPEED"] = "7b9b53ff-5421-4bdf-beb0-ca8c949542c1";
    _characteristicUUIDs["BATTERY_LEVEL"] = "76a247fb-a76f-42da-91ce-d6a5bdebd0e2";
    _characteristicUUIDs["TURNING_INDICATOR"] = "74df0c8f-f3e1-4cf5-b875-56d7ca609a2e";
    _characteristicUUIDs["DISTANCE_TRAVELLED"] = "5bebe839-c2e2-4fad-bb18-65f792ddb16f";
    _characteristicUUIDs["RANGE_LEFT"] = "bf252fd6-c1e3-4835-b4be-b5e353e62d7b";
    _characteristicUUIDs["SEATBELT_WARNING"] = "da2d9231-ae69-4b5b-b4dc-d7c940e72815";
    _characteristicUUIDs["WIPER_WARNING"] = "0b458d6d-4e0c-442d-9c18-febd81281d78";
    _characteristicUUIDs["TIRE_PRESSURE_WARNING"] = "ce99220c-75ed-4d38-9b25-5a0f7e766016";
    _characteristicUUIDs["AIRBAG_WARNING"] = "8be2a5a1-5e2e-4344-9304-fb642b55746e";
    _characteristicUUIDs["BRAKE_WARNING"] = "b45ea8a5-7d70-41bc-82a3-51cd35d594cc";
    _characteristicUUIDs["ABS_WARNING"] = "ce3843db-ef55-4b8d-a02a-e0eb4963a1e0";
    _characteristicUUIDs["EDS_WARNING"] = "d93f1c6c-6e14-44b3-95ce-d0a7f71efbb5";
    _characteristicUUIDs["TEMP_WARNING"] = "4751b324-3935-4b1e-a4e7-9c0888d03325";
    _characteristicUUIDs["PARKING_BRAKE"] = "f05976f6-aa9e-4d19-a255-aeda7dbb624f";
    _characteristicUUIDs["LIGHTS_STATUS"] = "131223c4-1e5f-486a-9ab5-d85c41984f6f";
  }

  String getService(){
    return _serviceUUID;
  }

  Map<String, String> getCharacteristics() {
    return _characteristicUUIDs;
  }
}