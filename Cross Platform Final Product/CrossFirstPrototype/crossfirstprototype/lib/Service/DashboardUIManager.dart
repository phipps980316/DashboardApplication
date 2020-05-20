import 'package:flutter/material.dart';
import 'package:crossfirstprototype/UI/Dashboard/DashboardWidget.dart';

class DashboardUIManager {
  GlobalKey<DashboardWidgetState> _dashboardUI;

  // Positions for each warning in the activeWarnings map
  static final int _SEATBELT_WARNING = 0;
  static final int _LIGHTS_FAULT = 1;
  static final int _LOW_WIPER_FLUID = 2;
  static final int _LOW_TIRE_PRESSURE  = 3;
  static final int _AIRBAG_WARNING = 4;
  static final int _BRAKE_SYSTEM_WARNING = 5;
  static final int _ABS_WARNING = 6;
  static final int _EDS_WARNING = 7;
  static final int _TEMP_WARNING = 8;

  // Map to hold if any of the warnings are enabled or not
  Map<int, bool> _activeWarnings = {
    _SEATBELT_WARNING: false,
    _LIGHTS_FAULT: false,
    _LOW_WIPER_FLUID: false,
    _LOW_TIRE_PRESSURE: false,
    _AIRBAG_WARNING: false,
    _BRAKE_SYSTEM_WARNING: false,
    _ABS_WARNING: false,
    _EDS_WARNING: false,
    _TEMP_WARNING: false
  };

  // Constructor for this class
  DashboardUIManager(GlobalKey<DashboardWidgetState> dashboardUI){
    this._dashboardUI = dashboardUI;
  }

  // Method created to update the dashboard UI
  DashboardWidgetState updateDashboard(){
    return _dashboardUI.currentState;
  }

  // When at least one warning is enabled in activeWarnings, the master warning will turn on
  void _updateMasterWarning(){
    if(_activeWarnings.containsValue(true)){
      updateDashboard().updateWarningBar().updateMasterWarningIcon(
          'graphics/master_warning_red.png');
    } else {
      updateDashboard().updateWarningBar().updateMasterWarningIcon(
          'graphics/master_warning_grey.png');
    }
  }

  // Handles displaying the state for the seatbelt warning
  void updateSeatbeltWarning(String value){
    switch (value) {
      case "0":
        updateDashboard().updateWarningBar().updateSeatbeltWarningIcon(
            'graphics/seatbelt_warning_grey.png');
        _activeWarnings[_SEATBELT_WARNING] = false;
        break;
      case "1":
        updateDashboard().updateWarningBar().updateSeatbeltWarningIcon(
            'graphics/seatbelt_warning_red.png');
        _activeWarnings[_SEATBELT_WARNING] = true;
        break;
    }
    _updateMasterWarning();
  }

  // Handles displaying the state for the wiper fluid warning
  void updateWiperFluidFault(String value){
    switch (value) {
      case "0":
        updateDashboard().updateWarningBar().updateWiperFluidIcon(
            'graphics/low_wiper_fluid_grey.png');
        _activeWarnings[_LOW_WIPER_FLUID] = false;
        break;
      case "1":
        updateDashboard().updateWarningBar().updateWiperFluidIcon(
            'graphics/low_wiper_fluid_red.png');
        _activeWarnings[_LOW_WIPER_FLUID] = true;
        break;
    }
    _updateMasterWarning();
  }

  // Handles displaying the state for the tire pressure warning
  void updateTirePressureFault(String value){
    switch (value) {
      case "0":
        updateDashboard().updateWarningBar().updateTirePressureIcon(
            'graphics/low_tire_pressure_grey.png');
        _activeWarnings[_LOW_TIRE_PRESSURE] = false;
        break;
      case "1":
        updateDashboard().updateWarningBar().updateTirePressureIcon(
            'graphics/low_tire_pressure_red.png');
        _activeWarnings[_LOW_TIRE_PRESSURE] = true;
        break;
    }
    _updateMasterWarning();
  }

  // Handles displaying the state for the airbag warning
  void updateAirbagFault(String value){
    switch (value) {
      case "0":
        updateDashboard().updateWarningBar().updateAirbagFaultIcon(
            'graphics/airbag_fault_grey.png');
        _activeWarnings[_AIRBAG_WARNING] = false;
        break;
      case "1":
        updateDashboard().updateWarningBar().updateAirbagFaultIcon(
            'graphics/airbag_fault_red.png');
        _activeWarnings[_AIRBAG_WARNING] = true;
        break;
    }
    _updateMasterWarning();
  }

  // Handles displaying the state for the brake warning
  void updateBrakeWarning(String value){
    switch (value) {
      case "0":
        updateDashboard().updateWarningBar().updateBrakeWarningIcon(
            'graphics/brake_warning_grey.png');
        _activeWarnings[_BRAKE_SYSTEM_WARNING] = false;
        break;
      case "1":
        updateDashboard().updateWarningBar().updateBrakeWarningIcon(
            'graphics/brake_warning_orange.png');
        _activeWarnings[_BRAKE_SYSTEM_WARNING] = true;
        break;
      case "2":
        updateDashboard().updateWarningBar().updateBrakeWarningIcon('graphics/brake_warning_red.png');
        _activeWarnings[_BRAKE_SYSTEM_WARNING] = true;
        break;
    }
    _updateMasterWarning();
  }

  // Handles displaying the state for the abs warning
  void updateABSWarning(String value){
    switch (value) {
      case "0":
        updateDashboard().updateWarningBar().updateABSFaultIcon(
            'graphics/abs_fault_grey.png');
        _activeWarnings[_ABS_WARNING] = false;
        break;
      case "1":
        updateDashboard().updateWarningBar().updateABSFaultIcon(
            'graphics/abs_fault_orange.png');
        _activeWarnings[_ABS_WARNING] = true;
        break;
      case "2":
        updateDashboard().updateWarningBar().updateABSFaultIcon('graphics/abs_fault_red.png');
        _activeWarnings[_ABS_WARNING] = true;
        break;
    }
    _updateMasterWarning();
  }

  // Handles displaying the state for the eds warning
  void updateEDSWarning(String value){
    switch (value) {
      case "0":
        updateDashboard().updateWarningBar().updateEDSFaultIcon(
            'graphics/electric_drive_system_fault_grey.png');
        _activeWarnings[_EDS_WARNING] = false;
        break;
      case "1":
        updateDashboard().updateWarningBar().updateEDSFaultIcon(
            'graphics/electric_drive_system_fault_orange.png');
        _activeWarnings[_EDS_WARNING] = true;
        break;
      case "2":
        updateDashboard().updateWarningBar().updateEDSFaultIcon('graphics/electric_drive_system_fault_red.png');
        _activeWarnings[_EDS_WARNING] = true;
        break;
    }
    _updateMasterWarning();
  }

  // Handles displaying the state for the temperature status
  void updateTempWarning(String value){
    int temp = int.parse(value);
    if (temp <= 10){
      updateDashboard().updateWarningBar().updateTempIcon('graphics/temp_blue.png');
      _activeWarnings[_TEMP_WARNING] = false;
    }
    else if (temp > 10 && temp < 20){
      updateDashboard().updateWarningBar().updateTempIcon('graphics/temp_grey.png');
      _activeWarnings[_TEMP_WARNING] = false;
    }
    else if (temp > 20){
      updateDashboard().updateWarningBar().updateTempIcon('graphics/temp_red.png');
      _activeWarnings[_TEMP_WARNING] = true;
    }
    _updateMasterWarning();
  }

  // Handles displaying the state for the parking brake status
  void updateParkingBrakeStatus(String value){
    switch (value) {
      case "0":
        updateDashboard().updateWarningBar().updateParkingBrakeIcon(
            'graphics/parking_brake_grey.png');
        break;
      case "1":
        updateDashboard().updateWarningBar().updateParkingBrakeIcon(
            'graphics/parking_brake_red.png');
        break;
    }
  }

  // Handles displaying the state for the light beam status
  void updateLightBeamStatus(String value){
    switch (value) {
      case "0":
        updateDashboard().updateWarningBar().updateLightBeamIcon(
            'graphics/no_lightbeam_grey.png');
        _activeWarnings[_LIGHTS_FAULT] = false;
        break;
      case "1":
        updateDashboard().updateWarningBar().updateLightBeamIcon(
            'graphics/med_lightbeam_green.png');
        _activeWarnings[_LIGHTS_FAULT] = false;
        break;
      case "2":
        updateDashboard().updateWarningBar().updateLightBeamIcon(
            'graphics/high_lightbeam_blue.png');
        _activeWarnings[_LIGHTS_FAULT] = false;
        break;
      case "3":
        updateDashboard().updateWarningBar().updateLightBeamIcon(
            'graphics/lights_fault_red.png');
        _activeWarnings[_LIGHTS_FAULT] = true;
        break;
    }
    _updateMasterWarning();
  }

  // Handles displaying the state for the connection status
  void updateConnection(bool connected){
    switch(connected) {
      case true:
        updateDashboard().updateWarningBar().updateConnectionIcon('graphics/connection_green.png');
        break;
      case false:
        updateDashboard().updateWarningBar().updateConnectionIcon('graphics/connection_grey.png');
        break;
    }
  }

  // Handles displaying the current speed on the UI
  void updateSpeed(String value){
    updateDashboard().updateInfoBar().updateSpeedInfo(value);
  }

  // Handles displaying the current distance travelled on the UI
  void updateDistance(String value){
    updateDashboard().updateInfoBar().updateDistanceInfo(value);
  }

  // Handles displaying the current battery range on the UI
  void updateRange(String value){
    updateDashboard().updateInfoBar().updateRangeInfo(value);
  }

  // Handles displaying the current battery level on the UI
  void updateBattery(String value){
    updateDashboard().updateInfoBar().updateBatteryInfo(value);
  }

  // Handles displaying the current indicator status on the UI
  void updateIndicator(String value){
    switch (value) {
      case "0":
        updateDashboard().updateIndicatorBar().noIndicatorOn();
        break;
      case "1":
        updateDashboard().updateIndicatorBar().leftIndicatorOn();
        break;
      case "2":
        updateDashboard().updateIndicatorBar().rightIndicatorOn();
        break;
    }
  }
}