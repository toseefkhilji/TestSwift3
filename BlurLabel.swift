//
//  BlurLabel.swift
//  TestSwift3
//
//  Created by Toseefhusen Khilji on 20/10/16.
//  Copyright © 2016 Toseef Khilji. All rights reserved.
//

import UIKit


//Ref for custom class
//http://sunnycyk.com/2014/10/ios-subclass-uilabel-swift/
//http://stackoverflow.com/a/33326273/1597744 - Curcle class
class CircleLabel: UILabel {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    func commonInit(){
        self.layer.cornerRadius = self.bounds.width/2
        self.clipsToBounds = true
        self.textColor = UIColor.white
        self.setProperties(borderWidth: 1.0, borderColor:UIColor.black)
    }
    func setProperties(borderWidth: Float, borderColor: UIColor) {
        self.layer.borderWidth = CGFloat(borderWidth)
        self.layer.borderColor = borderColor.cgColor
    }
}

class BlurLabel: UIView {

    var text: String = ""
    var label = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
//        self.setup()
    }
    
    override init(frame:CGRect) {
        super.init(frame:frame)
//        self.setup()
    }
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }
    
    init(message : String) {
        super.init(frame:CGRect.zero)
        self.text = message
        self.setup()
    }

    func setBlurText(text : String){
        self.text = text
        self.setup()
        
    }
    
    func setup(){
        self.label = UILabel()
        
        self.label.font = UIFont.systemFont(ofSize: 10)
        self.label.text = text
        self.label.numberOfLines = 0
        let maximumLabelSize = CGSize.init(width: 280, height: 9999)
        let expectedLabelSize: CGSize = self.label.sizeThatFits(maximumLabelSize)
        // create a frame that is filled with the UILabel frame data
        var newFrame: CGRect = self.label.frame
        // resizing the frame to calculated size
        newFrame.size = expectedLabelSize
        // put calculated frame into UILabel frame
        self.label.frame = newFrame
        
        // Set blur effect
        //https://www.omnigroup.com/developer/how-to-make-text-in-a-uivisualeffectview-readable-on-any-background
        let blurEffect = UIBlurEffect.init(style: .light)
        let blurView = UIVisualEffectView.init(effect: blurEffect)
        blurView.backgroundColor = UIColor().withAlphaComponent(0.60)
        blurView.clipsToBounds = true
        blurView.layer.borderColor = UIColor.black.withAlphaComponent(0.4).cgColor
        blurView.layer.borderWidth = 1.0
        blurView.layer.cornerRadius = 6.0
        
        newFrame.size.height  += 10
        newFrame.size.width += 10
        
        blurView.frame = newFrame
        
        self.label.center = blurView.center
        
        self.label.textColor = UIColor.black.withAlphaComponent(0.7)
        blurView.contentView.addSubview(self.label)
        
        self.addSubview(blurView)
    }
}
