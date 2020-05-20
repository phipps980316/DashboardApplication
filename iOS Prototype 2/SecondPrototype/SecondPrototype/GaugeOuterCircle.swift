//
//  GaugeOuterCircle.swift
//  ThirdPrototype
//
//  Created by Jon Phipps on 17/03/2020.
//  Copyright © 2020 Jon Phipps. All rights reserved.
//

import Foundation
import UIKit

class GaugeOuterCircle:UIView{
    override func draw(_ rect: CGRect) {
        let radius = rect.height/2
        let circlePath = UIBezierPath(arcCenter: self.center, radius: radius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        circlePath.lineWidth = 2
        UIColor.black.setStroke()
        circlePath.stroke()
        
        /*
        let radius = (frame.size.height / 2)
        let circleLayer = CAShapeLayer()
        circleLayer.fillColor = UIColor.white.cgColor
        circleLayer.strokeColor = UIColor.black.cgColor

        circleLayer.position = CGPoint(x: 0,y: 0)
        self.layer.addSublayer(circleLayer)
 */
    }
}
