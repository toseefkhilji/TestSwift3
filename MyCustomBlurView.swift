//
//  MyCustomBlurView.swift
//  TestSwift3
//
//  Created by Toseefhusen Khilji on 20/10/16.
//  Copyright © 2016 Toseef Khilji. All rights reserved.
//

import UIKit

@IBDesignable
class MyCustomBlurView: UIView {
    
    var shadowAdded: Bool = false
    
//    @IBInspectable var cornerRadius: CGFloat = 0 {
//        didSet {
//            layer.cornerRadius = cornerRadius
//            layer.masksToBounds = cornerRadius > 0
//        }
//    }
//    
   
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
//        self.backgroundColor = UIColor.clear
        
        
        let blurEffect = UIBlurEffect.init(style: .dark)
        let visualEffectView = UIVisualEffectView.init(effect: blurEffect)
        visualEffectView.backgroundColor = UIColor().withAlphaComponent(0.60)
        visualEffectView.clipsToBounds = true
        visualEffectView.layer.borderColor = UIColor.black.withAlphaComponent(0.4).cgColor
        visualEffectView.layer.borderWidth = 1.0
        visualEffectView.layer.cornerRadius = 6.0
        visualEffectView.frame = self.bounds
        self.insertSubview(visualEffectView, at: 0)
    }
    
//    var shadowLayer: CAShapeLayer!
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        
//        if shadowLayer == nil {
//            shadowLayer = CAShapeLayer()
//            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 12).cgPath
//            shadowLayer.fillColor = UIColor.white.cgColor
//            
//            shadowLayer.shadowColor = UIColor.darkGray.cgColor
//            shadowLayer.shadowPath = shadowLayer.path
//            shadowLayer.shadowOffset = CGSize(width: 2.0, height: 2.0)
//            shadowLayer.shadowOpacity = 0.8
//            shadowLayer.shadowRadius = 2
//            
//            layer.insertSublayer(shadowLayer, at: 0)
//            //layer.insertSublayer(shadowLayer, below: nil) // also works
//        }        
//    }
}
