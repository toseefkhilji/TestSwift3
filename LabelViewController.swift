//
//  LabelViewController.swift
//  TestSwift3
//
//  Created by Toseefhusen Khilji on 18/10/16.
//  Copyright © 2016 Toseef Khilji. All rights reserved.
//

import UIKit

extension String {
    func nsRange(from range: Range<String.Index>) -> NSRange {
        let from = range.lowerBound.samePosition(in: utf16)
        let to = range.upperBound.samePosition(in: utf16)
        return NSRange(location: utf16.distance(from: utf16.startIndex, to: from),
                       length: utf16.distance(from: from, to: to))
    }
}

extension String {
    func range(from nsRange: NSRange) -> Range<String.Index>? {
        guard
            let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location, limitedBy: utf16.endIndex),
            let to16 = utf16.index(from16, offsetBy: nsRange.length, limitedBy: utf16.endIndex),
            let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self)
            else { return nil }
        return from ..< to
    }
}
// Range ref
//http://stackoverflow.com/questions/25138339/nsrange-to-rangestring-index/30404532#30404532

extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let r = CGFloat((hex >> 16) & 0xff) / 255
        let g = CGFloat((hex >> 08) & 0xff) / 255
        let b = CGFloat((hex >> 00) & 0xff) / 255
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}

extension UIColor {
    convenience init(hexCode: String) {
        
        let hexS : NSString = hexCode as NSString
        let hex = hexS.trimmingCharacters(in: NSCharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
// Color ref
//http://stackoverflow.com/documentation/ios/956/uicolor#t=201610200940074857355

class LabelViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Simple label with frame with HEX color
        let frame = CGRect(x: 5, y: 100, width: 300, height: 50)
        let lbl = UILabel(frame: frame)
        lbl.text = "Simple Label with frame. \nDo any additional setup after loading the view."
//        lbl.lineBreakMode = .byClipping
        lbl.numberOfLines = 2
        lbl.textColor = UIColor(hexCode: "#FFFFFF")
        lbl.backgroundColor =  UIColor(hex: 336699, alpha: 0.7)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.25;
        
        // Font
        lbl.font = UIFont(name: "Avenir", size: 15)
        self.view.addSubview(lbl)
        
        
        // Label with shadow
        let frame2 = CGRect(x: 5, y: 150, width: 300, height: 50)
        let label1 = UILabel(frame: frame2)
        label1.layer.shadowOffset = CGSize.init(width: 3, height: 3);
        label1.layer.shadowOpacity = 0.3;
        label1.layer.shadowRadius = 2;
        label1.text = "Shadow Label"
        self.view.addSubview(label1)
        
        
        //Label with new auto layout constraint
        // http://stackoverflow.com/a/34459374 - Autolayout constraints
        //http://stackoverflow.com/documentation/ios/792/auto-layout#t=201610200513553490505
        
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        label.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
        label.minimumScaleFactor = 0.5
        label.backgroundColor = UIColor.yellow

        label.text = "This is autolayout Label"
        self.view.addSubview(label)

        label.topAnchor.constraint(greaterThanOrEqualTo: self.view.topAnchor, constant: 60).isActive = true
        label.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
//        myView.widthAnchor.constraintEqualToAnchor(nil, constant: 200).active = true
//        myView.heightAnchor.constraintEqualToAnchor(nil, constant: 100).active = true

        
        
        //Label with Attributed text
        let attributedString = NSMutableAttributedString(string: "The grass is green; the sky is blue. and the land is red ")
        let str = NSString(string: attributedString.string)
        let rng  = str.range(of: "red")
        
        attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.green, range: NSRange(location: 13, length: 5))
        attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue, range: NSRange(location: 31, length: 4))
        attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.red, range: rng)
        
        attributedString.addAttribute(NSFontAttributeName , value: UIFont.systemFont(ofSize: 30), range: NSRange(location: 13, length: 5))
        attributedString.addAttribute(NSFontAttributeName , value: UIFont.systemFont(ofSize: 20), range: rng)
        
        let frm4 = CGRect(x: 5, y: 200, width: 300, height: 100)
        let lableAttr = UILabel(frame: frm4)
        lableAttr.attributedText = attributedString
        lableAttr.numberOfLines = 0
        self.view.addSubview(lableAttr)
        
        
        
        //Label with Custom class
        
        let frm5 = CGRect(x: 45, y: 250, width: 300, height: 100)
        let lblBlur = BlurLabel.init(frame:frm5)
        lblBlur.setBlurText(text: "This is Blur Label")
        self.view.addSubview(lblBlur)
        
        
        let frm6 = CGRect(x: 45, y: 300, width: 50, height: 50)
        let curlbl = CircleLabel.init(frame: frm6)
        curlbl.text = "Circle"
        curlbl.textColor = UIColor.red
        self.view.addSubview(curlbl)
        
        
        
        
        // Gradient
       // http://stackoverflow.com/documentation/ios/1190/cagradientlayer#t=201610200514168328286
        
        let lblGrd: UILabel = UILabel(frame: CGRect(x: 0, y: 350, width: 320, height: 100))
        
        // Initialize gradient layer.
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        
        // Set frame of gradient layer.
        gradientLayer.frame = lblGrd.bounds
        
        // Color at the top of the gradient.
        let topColor: CGColor = UIColor.red.cgColor
        
        // Color at the bottom of the gradient.
        let bottomColor: CGColor = UIColor.yellow.cgColor
        
        // Set colors.
        gradientLayer.colors = [topColor, bottomColor]
        
        // Set locations of the colors.
        gradientLayer.locations = [0.0, 1.0]
        
        // Insert gradient layer into view's layer heirarchy.
        lblGrd.layer.insertSublayer(gradientLayer, at: 0)
        
        lblGrd.backgroundColor = UIColor.clear
        lblGrd.text = "This is the gradiant color lable"
        
        self.view.insertSubview(lblGrd, at: 0)
        
        
        
        let attach = NSTextAttachment.init()
        attach.image = UIImage(named: "upload")
        
        let attaribtImg = NSAttributedString(attachment: attach)
        
        let attString = NSMutableAttributedString.init(string: "Upload Attribute")
        attString.append(attaribtImg)
        
        let myImgLabel = UILabel.init(frame: CGRect(x: 150, y: 280, width: 300, height: 30))
        myImgLabel.attributedText = attString;
        myImgLabel.backgroundColor = UIColor.lightGray

        self.view.addSubview(myImgLabel)
        
        
        
        
                
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
