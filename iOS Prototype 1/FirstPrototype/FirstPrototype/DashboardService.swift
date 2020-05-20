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
    public static let SPEED = "SPEED_UUID" //key for the speed uuid
    public static let BATTERY_LEVEL = "BATTERY_LEVEL_UUID" //key for the battery level uuid
    public static let TURNING_INDICATOR = "TURNING_INDICATOR_UUID" //key for the turning indictator uuid
    
    public static let SERVICE_UUID = CBUUID.init(string: "dee0e505-9680-430e-a4c4-a225905ce33d") //uuid for the bluetooth service
    public static let CHARACTERISTICS:[String:CBUUID] = [SPEED:CBUUID.init(string: "7b9b53ff-5421-4bdf-beb0-ca8c949542c1"), //uuids for the bluetooth characteristics
                                                         BATTERY_LEVEL:CBUUID.init(string: "76a247fb-a76f-42da-91ce-d6a5bdebd0e2"),
                                                         TURNING_INDICATOR:CBUUID.init(string: "74df0c8f-f3e1-4cf5-b875-56d7ca609a2e")]
}

