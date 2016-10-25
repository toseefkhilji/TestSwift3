//
//  CustomButton.swift
//  TestSwift3
//
//  Created by Toseefhusen Khilji on 20/10/16.
//  Copyright © 2016 Toseef Khilji. All rights reserved.
//

import UIKit

class CustomPlayButton: UIButton {

    @IBInspectable var fillColor: UIColor = UIColor.clear
    @IBInspectable var lineColor: UIColor = UIColor.black
    var constantSize: CGFloat = 0.30
    var spaceX: CGFloat = 5
    @IBInspectable var percentSize: CGFloat {
        set(newValue){
            if newValue >= 0 && newValue <= 100{
                constantSize = newValue / 100
            } else {
                constantSize = 0.30
            }
        } get{
            return constantSize
        }
    }
    
    @IBInspectable var addSpace: CGFloat{
        set(newValue){
            if newValue >= 0 && newValue <= 10{
                spaceX = newValue
            } else {
                spaceX = 0
            }
        }get {
            return spaceX
        }
    }
    
    let blur: UIBlurEffect = UIBlurEffect(style: .light)
    
    override func draw(_ rect: CGRect) {
        let topX = (bounds.width * constantSize) + spaceX
        let topY = bounds.height * constantSize
        
        let middleX = (bounds.width * (1 - constantSize)) + spaceX
        let middleY = bounds.height * 0.5
        
        let bottomX = topX
        let bottomY = bounds.height * (1 - constantSize)
        
        
        
        let blurEffect = UIVisualEffectView(effect: blur)
        blurEffect.alpha = 0.9
        let path = UIBezierPath(ovalIn: rect)
        
        blurEffect.frame = path.bounds
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        blurEffect.layer.mask = mask
        self.insertSubview(blurEffect, at: 0)
        
        let trianglePath = UIBezierPath()
        trianglePath.lineJoinStyle = .round
        
        trianglePath.move(to: CGPoint(x: topX, y: topY))
        trianglePath.addLine(to: CGPoint(x: middleX, y: middleY))
        trianglePath.addLine(to: CGPoint(x: bottomX, y: bottomY))
        trianglePath.addLine(to: CGPoint(x: topX, y: topY))
        
        let maskImage = CAShapeLayer()
        maskImage.path = trianglePath.cgPath
        maskImage.lineJoin = kCALineJoinRound
        maskImage.lineWidth = 2
        maskImage.fillColor = fillColor.cgColor
        maskImage.strokeColor = lineColor.cgColor
        
        self.layer.addSublayer(maskImage)
    }
}
