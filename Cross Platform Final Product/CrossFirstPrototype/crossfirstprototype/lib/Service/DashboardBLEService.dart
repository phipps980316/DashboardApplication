import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:crossfirstprototype/UI/Dashboard/DashboardWidget.dart';
import 'DashboardUUIDs.dart';
import 'DashboardUIManager.dart';

class DashboardBLEService {

  // Attributes for BLE
  FlutterBlue bluetoothInstance;
  BluetoothDevice device;
  DashboardUUIDs dashboardUUIDs;
  DashboardUIManager dashboardUIManager;
  StreamSubscription<ScanResult> foundDevices;

  DashboardBLEService(GlobalKey<DashboardWidgetState> dashboardUI, bool doConnect){
    dashboardUUIDs = DashboardUUIDs();
    dashboardUIManager = DashboardUIManager(dashboardUI);

    // When the DashboardBLEService is created, the application will start to scan for devices
    if(doConnect) {
      // Creates a new instance of FlutterBlue
      bluetoothInstance = FlutterBlue.instance;
      startScan();
    }
  }

  // Scans for the specified Service UUID
  void startScan() {
    // This starts a new scan with the filter of the service UUID
    foundDevices = bluetoothInstance.scan(withServices: [new Guid(dashboardUUIDs.getService())]).listen((scanResult) {
      stopScan(); // When a device is found with the UUID, the scan is stopped
      device = scanResult.device; // The device is then saved
      connectToDevice(); // Starts to connect to the device
    }, onDone: () => stopScan());
  }

  // Stops the currently running scan
  void stopScan() {
    foundDevices?.cancel();
    foundDevices = null; // Resets so there is no found devices
  }

  // Connects to the found device
  void connectToDevice() async {
    if (device != null){
      await device.connect(autoConnect: false); // When the method has finished, the device will then connected
      device.state.listen((state) {
        // If the device is disconnected, the state will update and disconnect from the device
        if(state == BluetoothDeviceState.disconnected){
          dashboardUIManager.updateConnection(false);
          disconnectFromDevice();
        }
      });
      discoverServices(); // After this has finished connecting the services will be discovered on the connected device
    }
  }

  // Disconnects from the device
  void disconnectFromDevice() {
    if (device != null){
      device.disconnect();
    }
  }

  // Finds the services on the device and saves the required service
  void discoverServices() async {
    if (device != null){
      List<BluetoothService> services = await device.discoverServices();
      services.forEach((service) {
        // Matches the service UUID to the required UUID and discovers the characteristics to read
        if(service.uuid.toString() == dashboardUUIDs.getService()){
          discoverCharacteristics(service);
        }
      });
    }
  }

  // Finds all of the characteristics in the service
  void discoverCharacteristics(BluetoothService service) async{
    Iterable<String> dashboardCharacteristics = dashboardUUIDs.getCharacteristics().values;

    for(var characteristic in service.characteristics){
      if(dashboardCharacteristics.contains(characteristic.uuid.toString())){
        await characteristic.setNotifyValue(true);  // Sets a notification for each characteristic
        // Sets up a listener for when a value has changed
        characteristic.value.listen((value) {
          String receivedData = Utf8Decoder().convert(value);
          characteristicDidUpdate(receivedData, characteristic.uuid.toString());
        });
        await characteristic.read();
      }
    }
    dashboardUIManager.updateConnection(true);  // Calls the dashboard UI manager to update the connection icon on the display to "connected"
  }

  // When a characteristic has been changed, the value will update on the UI correctly
  void characteristicDidUpdate(String receivedData, String uuid) {
    switch (uuid) {
      case "7b9b53ff-5421-4bdf-beb0-ca8c949542c1":  // Speed
        dashboardUIManager.updateSpeed(receivedData);
        break;
      case "76a247fb-a76f-42da-91ce-d6a5bdebd0e2":  // Battery Level
        dashboardUIManager.updateBattery(receivedData);
        break;
      case "74df0c8f-f3e1-4cf5-b875-56d7ca609a2e":  // Turning Indicator
        dashboardUIManager.updateIndicator(receivedData);
        break;
      case "5bebe839-c2e2-4fad-bb18-65f792ddb16f":  // Distance Travelled
        dashboardUIManager.updateDistance(receivedData);
        break;
      case "bf252fd6-c1e3-4835-b4be-b5e353e62d7b":  // Range Left
        dashboardUIManager.updateRange(receivedData);
        break;
      case "da2d9231-ae69-4b5b-b4dc-d7c940e72815":  // Seat Belt
        dashboardUIManager.updateSeatbeltWarning(receivedData);
        break;
      case "0b458d6d-4e0c-442d-9c18-febd81281d78":  // Wiper Warning
        dashboardUIManager.updateWiperFluidFault(receivedData);
        break;
      case "ce99220c-75ed-4d38-9b25-5a0f7e766016":  // Tire Pressure
        dashboardUIManager.updateTirePressureFault(receivedData);
        break;
      case "8be2a5a1-5e2e-4344-9304-fb642b55746e":  // Air Bag Warning
        dashboardUIManager.updateAirbagFault(receivedData);
        break;
      case "b45ea8a5-7d70-41bc-82a3-51cd35d594cc":  // Brake Warning
        dashboardUIManager.updateBrakeWarning(receivedData);
        break;
      case "ce3843db-ef55-4b8d-a02a-e0eb4963a1e0":  // ABS Warning
        dashboardUIManager.updateABSWarning(receivedData);
        break;
      case "d93f1c6c-6e14-44b3-95ce-d0a7f71efbb5":  // EDS Warning
        dashboardUIManager.updateEDSWarning(receivedData);
        break;
      case "4751b324-3935-4b1e-a4e7-9c0888d03325":  // Temp Warning
        dashboardUIManager.updateTempWarning(receivedData);
        break;
      case "f05976f6-aa9e-4d19-a255-aeda7dbb624f":  // Parking Brake
        dashboardUIManager.updateParkingBrakeStatus(receivedData);
        break;
      case "131223c4-1e5f-486a-9ab5-d85c41984f6f":  // Lights Status
        dashboardUIManager.updateLightBeamStatus(receivedData);
        break;
    }
  }
}