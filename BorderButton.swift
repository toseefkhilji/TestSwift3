//
//  BorderButton.swift
//  TestSwift3
//
//  Created by Toseefhusen Khilji on 21/10/16.
//  Copyright © 2016 Toseef Khilji. All rights reserved.
//

import UIKit

@IBDesignable
class BorderButton: UIButton {
    var tmpColor : UIColor = UIColor()
    
    // A temporary background color property, which stores the original color while the button is highlighted
    var  temporaryBackgroundColor: UIColor? = UIColor.clear
    
    override var isHighlighted: Bool{
        didSet{
            
            if isHighlighted {
                
                    if highlightedBackgroundColor != nil {
                        temporaryBackgroundColor = backgroundColor!
                        backgroundColor = highlightedBackgroundColor
                    }
                    else {
                        temporaryBackgroundColor = backgroundColor!
                        backgroundColor = darkenColor(color: temporaryBackgroundColor!)
                    }
            }
            else{
                    backgroundColor = temporaryBackgroundColor
                    temporaryBackgroundColor = nil
            }
        }
    }
    
    
    // A new highlightedBackgroundColor, which shows on tap
    @IBInspectable var  highlightedBackgroundColor: UIColor?{
        didSet{
            self .layoutSubviews()
        }
    }
    
    
    @IBInspectable var cornerRadius : CGFloat = 10.0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = cornerRadius > 0.0
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 2 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    
    @IBInspectable var borderColor : UIColor = UIColor.black{
        
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    
    // Darken a color
    func darkenColor(color: UIColor) -> UIColor {
        
        var red = CGFloat(), green = CGFloat(), blue = CGFloat(), alpha = CGFloat()
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        red = max(red - 0.5, 0.0)
        green = max(green - 0.5, 0.0)
        blue = max(blue - 0.5, 0.0)
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}


//extension DarkColor : UIColor{
//    
//    func darkColor(color : UIColor) -> UIColor {
//        var red = CGFloat(), green = CGFloat(), blue = CGFloat(), alpha = CGFloat()
//        
//        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
//        
//        red = max(red - 0.5, 0.0)
//        green = max(green - 0.5, 0.0)
//        blue = max(blue - 0.5, 0.0)
//        
//        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
//    }
//}
