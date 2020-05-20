//
//  CentralViewController.swift
//  FirstPrototype
//
//  Created by Jon Phipps on 26/11/2019.
//  Copyright © 2019 Jon Phipps. All rights reserved.
//

import UIKit
import CoreBluetooth

class DashboardViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate { //View controller for the dashboard activity

    private var myCentralManager:CBCentralManager? //Central manager to handle the central functions
    private var connectedPeripheral:CBPeripheral? //Holds the peripheral that is connected to the central
    private var dashboard:DashboardService = DashboardService() //Instance of dashboard service

    @IBOutlet weak var speedLabel: UILabel! //Outlet to the label on the view to display the speed
    @IBOutlet weak var batteryLabel: UILabel! //Outlet to the label on the view to display the battery level
    @IBOutlet weak var leftIndicatorImage: UIImageView! //Outlet to the image view for the left indictator arrow
    @IBOutlet weak var rightIndicatorImage: UIImageView! //Outlet to the image view for the right indictator arrow
    
    override func viewDidLoad() { //Starts the central activity
            super.viewDidLoad()
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
        if let data = characteristic.value { //Get the characteristic value
            let dataString = String(data: data, encoding: String.Encoding.utf8)! //Turn the data back into a string
            //Check which characteristic was read or updated and update the view accordingly
            if(characteristic.uuid == DashboardService.CHARACTERISTICS[DashboardService.SPEED]){
                speedLabel.text = dataString
            }
            if(characteristic.uuid == DashboardService.CHARACTERISTICS[DashboardService.BATTERY_LEVEL]){
                batteryLabel.text = dataString
            }
            if(characteristic.uuid == DashboardService.CHARACTERISTICS[DashboardService.TURNING_INDICATOR]){
                if(dataString == "0"){
                    leftIndicatorImage.stopBlinkAnimation()
                    rightIndicatorImage.stopBlinkAnimation()
                }
                if(dataString == "1"){
                    leftIndicatorImage.startBlinkAnimation()
                    rightIndicatorImage.stopBlinkAnimation()
                }
                if(dataString == "2"){
                    rightIndicatorImage.startBlinkAnimation()
                    leftIndicatorImage.stopBlinkAnimation()
                }
            }
        }
    }
}

extension UIImageView { //Extend the image view class to set up animation functions
    func startBlinkAnimation() { //Function to start blinking animation
        self.isHidden = false //Display the image view
        UIView.animate(withDuration: 0.8, delay: 0.0, options:[ .repeat], animations: {self.alpha = 0}, completion: nil) //Animate the image view
    }
    
    func stopBlinkAnimation() { //Function to stop blinking animations
        layer.removeAllAnimations() //Remove all animations
        self.alpha = 1
        self.isHidden = true //Hide the image view
    }
}
