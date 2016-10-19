//
//  LabelViewController.swift
//  TestSwift3
//
//  Created by Toseefhusen Khilji on 18/10/16.
//  Copyright © 2016 Toseef Khilji. All rights reserved.
//

import UIKit

class LabelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let frame = CGRect(x: 5, y: 100, width: 300, height: 50)
        let lbl = UILabel(frame: frame)
        lbl.text = "Do any additional setup after loading the view."
        lbl.lineBreakMode = .byWordWrapping
        lbl.numberOfLines = 0
        lbl.textColor = UIColor.purple
        lbl.backgroundColor =  UIColor(red: 64.0/255.0, green: 88.0/255.0, blue: 41.0/225.0, alpha: 0.5)

        lbl.font = UIFont(name: "Avenir", size: 15)
        
        self.view.addSubview(lbl)
        
        let frame2 = CGRect(x: 5, y: 150, width: 300, height: 50)
        let label1 = UILabel(frame: frame2)

        label1.layer.shadowOffset = CGSize.init(width: 3, height: 3);
        label1.layer.shadowOpacity = 0.7;
        label1.layer.shadowRadius = 2;
        label1.text = "MARK: - Navigation"
        self.view.addSubview(label1)

        
//        let frame3 = CGRect(x: 5, y: 200, width: 300, height: 50)
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(greaterThanOrEqualToConstant: 120).isActive = true
        label.widthAnchor.constraint(lessThanOrEqualToConstant: 100).isActive = true
//        label.topAnchor.constraint(equalTo: label1.topAnchor, constant: 8.0).isActive = true
        label.minimumScaleFactor = 0.5
        label.text = "Dispose of any resources that can be recreated."
        self.view.addSubview(label)
        
        
        
        let attributedString = NSMutableAttributedString(string: "The grass is green; the sky is blue.")
        attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.green, range: NSRange(location: 13, length: 5))
        attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue, range: NSRange(location: 31, length: 4))
        attributedString.addAttribute(NSFontAttributeName , value: UIFont.systemFont(ofSize: 30), range: NSRange(location: 13, length: 5))

        
        let frm4 = CGRect(x: 5, y: 200, width: 300, height: 100)
        let lableAttr = UILabel(frame: frm4)
        lableAttr.attributedText = attributedString

        self.view.addSubview(lableAttr)
        
        
        
        
        
        
        
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
