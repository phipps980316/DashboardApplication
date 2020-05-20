//
//  CentralViewController.swift
//  FirstPrototype
//
//  Created by Jon Phipps on 26/11/2019.
//  Copyright © 2019 Jon Phipps. All rights reserved.
//

import UIKit
import CoreBluetooth

class DashboardMainViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate { //View controller for the peripheral activity

    private var myCentralManager:CBCentralManager? //Central manager to handle the central functions
    private var connectedPeripheral:CBPeripheral? //Holds the peripheral that is connected to the central
    private var dashboardUIManager:DashboardUIManager = DashboardUIManager() //Instance of dashboard UI manager
    private var dashboardService:DashboardService = DashboardService() //Instance of the dashboard service
    
    @IBOutlet weak var speedGauge: GaugeView!  //Custom gauge view to display the speed
    @IBOutlet weak var speedLabel: UILabel! //Label to display the speed
    @IBOutlet weak var batteryGauge: GaugeView! //Custom gauge view to display the battery level
    @IBOutlet weak var batteryLabel: UILabel! //Label to display the battery level
    @IBOutlet weak var distanceLabel: UILabel! //Label to display the distance
    @IBOutlet weak var rangeLabel: UILabel! //Label to display the range left
    @IBOutlet weak var leftIndicatorImage: UIImageView! //Outlet to the image view for the left indictator arrow
    @IBOutlet weak var rightIndicatorImage: UIImageView! //Outlet to the image view for the right indictator arrow
    
    //ImageViews for various warning icons on the dashboard
    @IBOutlet weak var masterWarningImage: UIImageView!
    @IBOutlet weak var seatbeltWarningImage: UIImageView!
    @IBOutlet weak var lightsFaultImage: UIImageView!
    @IBOutlet weak var wiperFluidImage: UIImageView!
    @IBOutlet weak var tirePressureImage: UIImageView!
    @IBOutlet weak var airbagFaultImage: UIImageView!
    @IBOutlet weak var brakeWarningImage: UIImageView!
    @IBOutlet weak var ABSFaultImage: UIImageView!
    @IBOutlet weak var EDSFaultImage: UIImageView!
    @IBOutlet weak var tempImage: UIImageView!
    @IBOutlet weak var parkingBrakeImage: UIImageView!
    @IBOutlet weak var lightImage: UIImageView!
    @IBOutlet weak var chargingImage: UIImageView!
    
    override func viewDidLoad() { //Starts the central activity
        super.viewDidLoad()
        
        //Set up the speed gauge with a max value of 120 and a current value of 0
        speedGauge.setMaxValue(value: 120)
        speedGauge.setValue(value: 0)
        speedGauge.setup()
        
        //Set up the battery gauge with a max vakue of 100 and a current value of 0
        batteryGauge.setMaxValue(value: 100)
        batteryGauge.setValue(value: 0)
        batteryGauge.setup()
        
        myCentralManager = CBCentralManager.init(delegate: self, queue: nil, options: nil) //Initalise the central manager
    }
        
    func centralManagerDidUpdateState(_ central: CBCentralManager) { //Function which is called when the central manager has updated state
        if(central.state == CBManagerState.poweredOn){ //If the central manager is powered on
            myCentralManager!.scanForPeripherals(withServices: [DashboardService.SERVICE_UUID], options: nil) //Start scanning for peripherals with the matching uuid
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) { //Function called when a peripheral is discovered
        connectedPeripheral = peripheral //Record the discovered peripheral
        myCentralManager!.connect(connectedPeripheral!, options: nil) //Connect to the discovered peripheral
    }
        
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) { //Function called when connected to the discovered peripheral
        peripheral.delegate = self //Set the peripherals delegate
        peripheral.discoverServices([DashboardService.SERVICE_UUID]) //Discover services for the matching service uuid
    }
        
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) { //Function called when discovered a relevent service
        var characterisics:[CBUUID] = []
        for characterisic in  DashboardService.CHARACTERISTICS { //Collect uuids for all the charactistics in dashboard service
            characterisics.append(characterisic.value)
        }
            
        for service in peripheral.services! { //For each service
            peripheral.discoverCharacteristics(characterisics, for: service) //Discover all of the relevent characteristic
        }
    }
        
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) { //Function called when relevant characteristics have been found
        for characteristic in service.characteristics! { //For each characteristic found
            peripheral.setNotifyValue(true, for: characteristic) //Get notified when a characteristics value changed
            peripheral.readValue(for: characteristic) //Read the initial value of the characteristic
        }
    }
        
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) { //Function called when a characteristic's value is read or updated
        if let value = String(data: characteristic.value!, encoding: String.Encoding.utf8) { //Get the characteristic value as a string
            //Check which characteristic was read or updated and update the view accordingly
            
            let BLECharacteristics = DashboardService.CHARACTERISTICS
            let UUID = characteristic.uuid
            
            switch UUID {
            case BLECharacteristics[DashboardService.SPEED]:
                dashboardUIManager.updateInfo(label: speedLabel, gauge: speedGauge, value: value, suffix: "MPH")
                
            case BLECharacteristics[DashboardService.BATTERY_LEVEL]:
                dashboardUIManager.updateInfo(label: batteryLabel, gauge: batteryGauge, value: value, suffix: "%")
                
            case BLECharacteristics[DashboardService.TURNING_INDICATOR]:
                dashboardUIManager.updateTurningIndicator(leftIndicatorImage: leftIndicatorImage, rightIndicatorImage: rightIndicatorImage, value: value)
                
            case BLECharacteristics[DashboardService.DISTANCE_TRAVELLED]:
                dashboardUIManager.updateInfo(label: distanceLabel, value: value, suffix: "Mi.")
                
            case BLECharacteristics[DashboardService.RANGE_LEFT]:
                dashboardUIManager.updateInfo(label: rangeLabel, value: value, suffix: "Mi.")
                
            case BLECharacteristics[DashboardService.SEATBELT_WARNING]:
                let imageNames = ["SeatbeltWarningGrey", "SeatbeltWarningRed"]
                dashboardUIManager.updateImage(imageView: seatbeltWarningImage, imageNames: imageNames, value: value, warningKey: DashboardUIManager.SEATBELT_WARNING)
                dashboardUIManager.updateWarningIcon(imageView: masterWarningImage)
                 
            case BLECharacteristics[DashboardService.WIPER_WARNING]:
                let imageNames = ["WiperFluidGrey", "WiperFluidRed"]
                dashboardUIManager.updateImage(imageView: wiperFluidImage, imageNames: imageNames, value: value, warningKey: DashboardUIManager.LOW_WIPER_FLUID)
                dashboardUIManager.updateWarningIcon(imageView: masterWarningImage)
                
            case BLECharacteristics[DashboardService.TIRE_PRESSURE_WARNING]:
                let imageNames = ["TirePressureGrey", "TirePressureRed"]
                dashboardUIManager.updateImage(imageView: tirePressureImage, imageNames: imageNames, value: value, warningKey: DashboardUIManager.LOW_TIRE_PRESSURE)
                dashboardUIManager.updateWarningIcon(imageView: masterWarningImage)
                
            case BLECharacteristics[DashboardService.AIRBAG_WARNING]:
                let imageNames = ["AirbagFaultGrey", "AirbagFaultRed"]
                dashboardUIManager.updateImage(imageView: airbagFaultImage, imageNames: imageNames, value: value, warningKey: DashboardUIManager.AIRBAG_WARNING)
                dashboardUIManager.updateWarningIcon(imageView: masterWarningImage)
                
            case BLECharacteristics[DashboardService.BRAKE_WARNING]:
                let imageNames = ["BrakeWarningGrey", "BrakeWarningOrange", "BrakeWarningRed"]
                dashboardUIManager.updateImage(imageView: brakeWarningImage, imageNames: imageNames, value: value, warningKey: DashboardUIManager.BRAKE_SYSTEM_WARNING)
                dashboardUIManager.updateWarningIcon(imageView: masterWarningImage)
                
            case BLECharacteristics[DashboardService.ABS_WARNING]:
                let imageNames = ["ABSFaultGrey", "ABSFaultOrange", "ABSFaultRed"]
                dashboardUIManager.updateImage(imageView: ABSFaultImage, imageNames: imageNames, value: value, warningKey: DashboardUIManager.ABS_WARNING)
                dashboardUIManager.updateWarningIcon(imageView: masterWarningImage)
                
            case BLECharacteristics[DashboardService.EDS_WARNING]:
                let imageNames = ["EDSFaultGrey", "EDSFaultOrange", "EDSFaultRed"]
                dashboardUIManager.updateImage(imageView: EDSFaultImage, imageNames: imageNames, value: value, warningKey: DashboardUIManager.EDS_WARNING)
                dashboardUIManager.updateWarningIcon(imageView: masterWarningImage)
                
            case BLECharacteristics[DashboardService.TEMP_WARNING]:
                dashboardUIManager.updateTempIndicator(image: tempImage, value: value)
                dashboardUIManager.updateWarningIcon(imageView: masterWarningImage)
                
            case BLECharacteristics[DashboardService.PARKING_BRAKE]:
                let imageNames = ["ParkingBrakeGrey", "ParkingBrakeRed"]
                dashboardUIManager.updateImage(imageView: parkingBrakeImage, imageNames: imageNames, value: value)
                
            case BLECharacteristics[DashboardService.LIGHTS_STATUS]:
                let imageNames = ["LightNoBeam", "LightMediumBeam", "LightHighBeam", "LightsFaultRed"]
                dashboardUIManager.updateLightImage(imageView: lightImage, imageNames: imageNames, value: value, warningKey: DashboardUIManager.LIGHTS_FAULT)
                dashboardUIManager.updateWarningIcon(imageView: masterWarningImage)
            default:
                break
            }
        }
    }
}
