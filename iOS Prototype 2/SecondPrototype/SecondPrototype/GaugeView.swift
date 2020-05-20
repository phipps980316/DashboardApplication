//
//  GaugeView.swift
//  GaugeViewTest
//
//  Created by Jon Phipps on 28/11/2019.
//  Copyright © 2019 Jon Phipps. All rights reserved.
//

import UIKit
//Custom view to draw and animate gauges in the dashboard view
class GaugeView : UIView {
    //Member Variables
    private var maxValue: Int = 0 //Maximum value of the gauge
    private var value: Int = 0 //Current value of the gauge
    
    //UIComponents
    private let needle = UIView()
    
    //Constructors and Setting Up
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = .clear
    }
    
    func setup(){
        drawOuterCircle()
        drawMeasurementTicks()
        drawNeedle()
    }
    
    //Drawing Functions
    private func drawOuterCircle() {
        let radius = (frame.size.height / 2) //Radius of the outer circle
        let circleLayer = CAShapeLayer() //Setup a new shape layer
        circleLayer.frame = CGRect(x: self.center.x, y: self.center.y, width: self.frame.width, height: self.frame.height) //Set the frame for the frame layer
        circleLayer.fillColor = UIColor.white.cgColor //Set the fill color for the layer
        circleLayer.strokeColor = UIColor.black.cgColor //Set the line color for the layer
        circleLayer.lineWidth = 2 //Set the width of the line
        circleLayer.path = UIBezierPath(arcCenter: .zero, radius: radius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: false).cgPath //set the line path as a circle
        self.layer.addSublayer(circleLayer) //Add the shape layer to the view
    }
    
    private func drawMeasurementTicks() {
        let radius = (frame.size.height / 2) - 10 //Radius of the measurement ticks
        let measurementLayer = CAShapeLayer() //Setup a new shape layer
        measurementLayer.fillColor = UIColor.clear.cgColor //Set the fill color for the layer
        measurementLayer.strokeColor = UIColor.black.cgColor //Set the line color for the ticks
        measurementLayer.lineWidth = 1 //Set the line width
        measurementLayer.position = CGPoint(x: 0,y: 0) //Set the position of the layer
        
        let path = UIBezierPath() //Create a new path
        for point in stride(from: 0, to: maxValue, by: 5) { //for every multiple of 5 until the maxValue
            let degree = getDegreeOnCircle(value: point) //Get the angle that the line should be drawn at
            
            var lineLength:CGFloat
            if (point % 20) == 0 {lineLength = radius - 15} //If the value is also a multiple of 20, draw a larger line
            else {lineLength = radius - 7} //Otherwise draw a shorter line
            
            path.move(to: getPointOnCircle(lineLength, degree)) //Go to the start of the line
            path.addLine(to: getPointOnCircle(radius, degree)) //Add the line to the path
        }
        //Add the layer to the view
        measurementLayer.path = path.cgPath
        self.layer.addSublayer(measurementLayer)
    }
    
    private func drawNeedle() {
        needle.backgroundColor = UIColor.red //Set the color of the needle
        needle.translatesAutoresizingMaskIntoConstraints = false
        needle.bounds = CGRect(x: center.x, y: center.y, width: 2, height: bounds.height / 3) //Set the bounds
        needle.layer.anchorPoint = CGPoint(x: 0, y: 1) //Anchor the needle to a point in the view
        needle.center = CGPoint(x: center.x, y: center.y) //Set the center of thr neddle
        addSubview(needle) //Add to the main view
    }
    
    //Setters For Member Variables
    func setMaxValue(value: Int) {
        self.maxValue = value+1 //Set the max value of the gauge
    }
    
    //Set the new value of the gauge and rotate the needle to point to the corresponding value
    func setValue(value:Int) {
        self.value = value
        let degrees = getDegreeOnCircle(value: value) - 270
        needle.transform = CGAffineTransform(rotationAngle: CGFloat(deg2rad(degrees)))
    }
    
    //Maths Functions
    private func getPointOnCircle(_ radius: CGFloat, _ degree: Float) -> CGPoint{
        var point = CGPoint()
        point.x = cos(deg2rad(degree))*radius + center.x
        point.y = sin(deg2rad(degree))*radius + center.y
        return point
    }
    
    private func getDegreeOnCircle(value: Int) -> Float{
        if value >= maxValue {
            return 405
        }
        if value <= 0 {
            return 135
        }
        let percent = (Float(value) * 100) / Float(maxValue)
        return ((percent * 270) / 100) + 135
    }
    
    private func deg2rad(_ number: Float) -> CGFloat {
        return CGFloat(number * .pi / 180)
    }
}
