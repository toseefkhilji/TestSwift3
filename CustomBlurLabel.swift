//
//  CustomBlurLabel.swift
//  TestSwift3
//
//  Created by Toseefhusen Khilji on 20/10/16.
//  Copyright © 2016 Toseef Khilji. All rights reserved.
//

import UIKit

class CustomBlurLabel: UIView {

    /** The string that will be put in the placeholder */
    @IBInspectable var title: NSString? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var label = UILabel()
    var blurView = UIVisualEffectView()
    
    @IBInspectable var cornerRadius: CGFloat = 6.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = cornerRadius > 0.0
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    override func draw(_ rect: CGRect) {

        self.backgroundColor = UIColor.clear
        self.label.backgroundColor = UIColor.clear
        
        self.label.text = title as String?
        self.label.numberOfLines = 2
        self.label.adjustsFontSizeToFitWidth = true
        self.label.minimumScaleFactor = 0.25
        self.label .sizeToFit()

        
        let blurEffect = UIBlurEffect.init(style: .light)
        blurView = UIVisualEffectView.init(effect: blurEffect)
        blurView.backgroundColor = UIColor().withAlphaComponent(0.60)
        blurView.clipsToBounds = true
        blurView.layer.borderColor = UIColor.black.withAlphaComponent(0.4).cgColor
        blurView.layer.borderWidth = 1.0
        blurView.layer.cornerRadius = 6.0
        var newFrame: CGRect = self.label.frame

        newFrame.size.height  += 10
        newFrame.size.width += 10
        
        blurView.frame = newFrame
        
        self.label.center = blurView.center
        
        self.label.textColor = UIColor.black.withAlphaComponent(0.7)
        blurView.contentView.addSubview(self.label)
        
        self.addSubview(blurView)
        
    }

}
