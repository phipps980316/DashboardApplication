//
//  DashboardUI.swift
//  ThirdPrototype
//
//  Created by Jon Phipps on 18/03/2020.
//  Copyright © 2020 Jon Phipps. All rights reserved.
//

import Foundation
import UIKit

class DashboardUIManager {
    
    //Index values for the active warnings array
    public static let SEATBELT_WARNING = 0;
    public static let LIGHTS_FAULT = 1;
    public static let LOW_WIPER_FLUID = 2;
    public static let LOW_TIRE_PRESSURE  = 3;
    public static let AIRBAG_WARNING = 4;
    public static let BRAKE_SYSTEM_WARNING = 5;
    public static let ABS_WARNING = 6;
    public static let EDS_WARNING = 7;
    public static let TEMP_WARNING = 8;
    
    //Array to keep track if there are any warnings active
    private var activeWarnings = [false, false, false, false, false, false, false, false, false]
    
    //Function to update the value of a guage and a label
    func updateInfo(label: UILabel, gauge: GaugeView, value: String, suffix: String){
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            UIView.animate(withDuration: 1) {
                gauge.setValue(value: Int(value)!)
                label.text = value + " " + suffix
            }
        }
    }
    
    //Function to update the value of a label
    func updateInfo(label: UILabel, value: String, suffix: String) {
        label.text = value + " " + suffix
    }
    
    //Function to update the master warning icon depending on if there is any active warnings
    func updateWarningIcon(imageView: UIImageView){
        if(activeWarnings.contains(true)){
            imageView.swapImage(imageName: "MasterWarningRed")
        }
        else {
            imageView.swapImage(imageName: "MasterWarningGrey")
        }
    }
    
    //Function to add an active warning
    func addWarning(warning: Int){
        activeWarnings[warning] = true;
    }
    
    //Function to remove an active warning
    func removeWarning(warning: Int){
        activeWarnings[warning] = false;
    }
    
    //Function to update a given icon and change the warning associated if needed
    func updateImage(imageView: UIImageView, imageNames: [String], value: String, warningKey: Int = -1) {
        switch value {
        case "0":
            imageView.swapImage(imageName: imageNames[0])
            if(warningKey >= 0) {removeWarning(warning: warningKey) }
        case "1":
            imageView.swapImage(imageName: imageNames[1])
            if(warningKey >= 0) {addWarning(warning: warningKey) }
        case "2":
            imageView.swapImage(imageName: imageNames[2])
            if(warningKey >= 0) {addWarning(warning: warningKey) }
        default:
            break
        }
    }
    
    //Function to update the light status icon and change the warning associated if needed
    func updateLightImage(imageView: UIImageView, imageNames: [String], value: String, warningKey: Int = -1) {
        switch value {
        case "0":
            imageView.swapImage(imageName: imageNames[0])
            if(warningKey >= 0) {removeWarning(warning: warningKey) }
        case "1":
            imageView.swapImage(imageName: imageNames[1])
            if(warningKey >= 0) {removeWarning(warning: warningKey) }
        case "2":
            imageView.swapImage(imageName: imageNames[2])
            if(warningKey >= 0) {removeWarning(warning: warningKey) }
        case "3":
            imageView.swapImage(imageName: imageNames[3])
            if(warningKey >= 0) {addWarning(warning: warningKey) }
        default:
            break
        }
    }
    
    //Function to update the turning indicator icons
    func updateTurningIndicator(leftIndicatorImage: UIImageView, rightIndicatorImage: UIImageView, value: String){
        switch value {
        case "0":
            leftIndicatorImage.swapImage(imageName: "LeftIndicatorGrey")
            leftIndicatorImage.stopBlinkAnimation()
            rightIndicatorImage.swapImage(imageName: "RightIndicatorGrey")
            rightIndicatorImage.stopBlinkAnimation()
        case "1":
            leftIndicatorImage.swapImage(imageName: "LeftIndicatorGreen")
            leftIndicatorImage.startBlinkAnimation()
            rightIndicatorImage.swapImage(imageName: "RightIndicatorGrey")
            rightIndicatorImage.stopBlinkAnimation()
        case "2":
            rightIndicatorImage.swapImage(imageName: "RightIndicatorGreen")
            rightIndicatorImage.startBlinkAnimation()
            leftIndicatorImage.swapImage(imageName: "LeftIndicatorGrey")
            leftIndicatorImage.stopBlinkAnimation()
        default:
            break
        }
    }
    
    //Function to update the temperature icon and change the warning associated if needed
    func updateTempIndicator(image: UIImageView, value: String){
        let temp = Int(value)!
        if(temp < 10) {
            image.swapImage(imageName: "TempBlue")
            removeWarning(warning: DashboardUIManager.TEMP_WARNING)
        }
        else if(temp >= 10 && temp <= 20) {
            image.swapImage(imageName: "TempGrey")
            removeWarning(warning: DashboardUIManager.TEMP_WARNING)
        }
        else if(temp > 20) {
            image.swapImage(imageName: "TempRed")
            addWarning(warning: DashboardUIManager.TEMP_WARNING)
        }
    }
}

extension UIImageView { //Extend the image view class to set up animation and image swap functions
    func startBlinkAnimation() { //Function to start blinking animation
        self.isHidden = false //Display the image view
        UIView.animate(withDuration: 0.8, delay: 0.0, options:[ .repeat], animations: {self.alpha = 0}, completion: nil) //Animate the image view
    }
    
    func stopBlinkAnimation() { //Function to stop blinking animations
        layer.removeAllAnimations() //Remove all animations
        self.alpha = 1
    }
    
    func swapImage(imageName: String){ //Helper Function to swap images
        image = UIImage(named: imageName)
    }
}
