//
//  SearchTextField.swift
//  TestSwift3
//
//  Created by Toseefhusen Khilji on 11/11/16.
//  Copyright © 2016 Toseef Khilji. All rights reserved.
//

import UIKit

class SearchTextField: UITextField {

    
    @IBInspectable var inset: CGFloat = 0
    
    @IBInspectable var leftImage: String = String(){
        didSet{
            leftViewMode = UITextFieldViewMode.always
            
            
            
            let theImageView = UIImageView(image: UIImage(named:leftImage)!.withRenderingMode(UIImageRenderingMode.alwaysTemplate))
            theImageView.tintColor = UIColor.red
//
//            let theImageView = UIImageView(image: UIImage(named: leftImage))
//            theImageView.tintColor = UIColor.red
            leftView = theImageView
        }
    }
    
//    override func textRect(forBounds bounds: CGRect) -> CGRect {
//        return bounds.insetBy(dx: inset, dy: inset)
//    }
//    
//    override func editingRect(forBounds bounds: CGRect) -> CGRect {
//        return textRect(forBounds: bounds)
//    }
//    
//    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
//        return CGRect(x: 0, y: 2, width: 40, height: 40).insetBy(dx: 10, dy: 10)
//    }

}
