//
//  DashboardService.swift
//  FirstPrototype
//
//  Created by Jon Phipps on 26/11/2019.
//  Copyright © 2019 Jon Phipps. All rights reserved.
//

import Foundation
import CoreBluetooth

class DashboardService { //Class to hold all the uuids and keys for the services and characteristics for the bluetooth
    
    //uuid keys
    public static let SPEED = "SPEED_UUID"
    public static let BATTERY_LEVEL = "BATTERY_LEVEL_UUID"
    public static let TURNING_INDICATOR = "TURNING_INDICATOR_UUID"
    public static let DISTANCE_TRAVELLED = "DISTANCE_TRAVELLED_UUID"
    public static let RANGE_LEFT = "RANGE_LEFT_UUID"
    public static let SEATBELT_WARNING = "SEATBELT_WARNING_UUID"
    public static let WIPER_WARNING = "WIPER_WARNING_UUID"
    public static let TIRE_PRESSURE_WARNING = "TIRE_PRESSURE_WARNING_UUID"
    public static let AIRBAG_WARNING = "AIRBAG_WARNING_UUID"
    public static let BRAKE_WARNING = "BRAKE_WARNING_UUID"
    public static let ABS_WARNING = "ABS_WARNING_UUID"
    public static let EDS_WARNING = "EDS_WARNING_UUID"
    public static let TEMP_WARNING = "TEMP_WARNING_UUID"
    public static let PARKING_BRAKE = "PARKING_BRAKE_UUID"
    public static let LIGHTS_STATUS = "LIGHTS_STATUS_UUID"
    
    public static let SERVICE_UUID = CBUUID.init(string: "dee0e505-9680-430e-a4c4-a225905ce33d") //uuid for the bluetooth service
    public static let CHARACTERISTICS:[String:CBUUID] = [SPEED:CBUUID.init(string: "7b9b53ff-5421-4bdf-beb0-ca8c949542c1"), //uuids for the bluetooth characteristics
                                                         BATTERY_LEVEL:CBUUID.init(string: "76a247fb-a76f-42da-91ce-d6a5bdebd0e2"),
                                                         TURNING_INDICATOR:CBUUID.init(string: "74df0c8f-f3e1-4cf5-b875-56d7ca609a2e"),
                                                         DISTANCE_TRAVELLED:CBUUID.init(string: "5bebe839-c2e2-4fad-bb18-65f792ddb16f"),
                                                         RANGE_LEFT:CBUUID.init(string: "bf252fd6-c1e3-4835-b4be-b5e353e62d7b"),
                                                         SEATBELT_WARNING:CBUUID.init(string: "da2d9231-ae69-4b5b-b4dc-d7c940e72815"),
                                                         WIPER_WARNING:CBUUID.init(string: "0b458d6d-4e0c-442d-9c18-febd81281d78"),
                                                         TIRE_PRESSURE_WARNING:CBUUID.init(string: "ce99220c-75ed-4d38-9b25-5a0f7e766016"),
                                                         AIRBAG_WARNING:CBUUID.init(string: "8be2a5a1-5e2e-4344-9304-fb642b55746e"),
                                                         BRAKE_WARNING:CBUUID.init(string: "b45ea8a5-7d70-41bc-82a3-51cd35d594cc"),
                                                         ABS_WARNING:CBUUID.init(string: "ce3843db-ef55-4b8d-a02a-e0eb4963a1e0"),
                                                         EDS_WARNING:CBUUID.init(string: "d93f1c6c-6e14-44b3-95ce-d0a7f71efbb5"),
                                                         TEMP_WARNING:CBUUID.init(string: "4751b324-3935-4b1e-a4e7-9c0888d03325"),
                                                         PARKING_BRAKE:CBUUID.init(string: "f05976f6-aa9e-4d19-a255-aeda7dbb624f"),
                                                         LIGHTS_STATUS:CBUUID.init(string: "131223c4-1e5f-486a-9ab5-d85c41984f6f")]
}
