//
//  ButtonViewController.swift
//  TestSwift3
//
//  Created by Toseefhusen Khilji on 21/10/16.
//  Copyright © 2016 Toseef Khilji. All rights reserved.
//

import UIKit

class ButtonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let buttonSimple = UIButton(type: .custom)
        buttonSimple.translatesAutoresizingMaskIntoConstraints = false
        buttonSimple.backgroundColor = UIColor.green
        buttonSimple.setTitle("Simple Button", for: .normal)
        
        self.view.addSubview(buttonSimple)
        
        buttonSimple.topAnchor.constraint(greaterThanOrEqualTo: self.view.topAnchor, constant: 60).isActive = true
        buttonSimple.leadingAnchor.constraint(greaterThanOrEqualTo: self.view.leadingAnchor, constant: 20).isActive = true
//        buttonSimple.layoutMargins.left = 100
        buttonSimple.widthAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        buttonSimple.heightAnchor.constraint(lessThanOrEqualToConstant: 30).isActive = true
        
        let sysbtn : UIButton? = UIButton(type: .infoLight)
        self.view.addSubview(sysbtn!)
        sysbtn?.frame = CGRect(x: buttonSimple.bounds.size.width + 100, y: buttonSimple.frame.origin.y, width: 20, height: 20)
//        
//        sysbtn?.topAnchor.constraint(greaterThanOrEqualTo: self.view.topAnchor, constant: 60).isActive = true
//        sysbtn?.leadingAnchor.constraint(greaterThanOrEqualTo: self.view.leadingAnchor, constant: 210).isActive = true
//                buttonSimple.layoutMargins.left = 100
//        sysbtn?.widthAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
//        sysbtn?.heightAnchor.constraint(lessThanOrEqualToConstant: 30).isActive = true
        
        
        
        
        
        var bfrm = CGRect(x: 0, y: 130, width: 200, height: 50)
        let  viewforblur = UIView(frame: bfrm)
        viewforblur.backgroundColor = UIColor(patternImage: UIImage(named: "url.jpg")!)

        self.view.addSubview(viewforblur)

        let blurEffect2: UIBlurEffect = UIBlurEffect(style: .dark)
        let blurView: UIVisualEffectView = UIVisualEffectView(effect: blurEffect2)
        bfrm.origin.y = 0
        blurView.frame = bfrm
        viewforblur.addSubview(blurView)
        
        let vibrancyView: UIVisualEffectView = UIVisualEffectView(effect: UIVibrancyEffect.init(blurEffect: blurEffect2))
        vibrancyView.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        blurView.contentView.addSubview(vibrancyView)
        
        let btnVib = UIButton(type: .custom)
        btnVib.setTitle("Vibrancy Button", for: .normal)
        btnVib.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        btnVib.setTitleColor(UIColor.white, for: .normal)
        btnVib.setTitleColor(UIColor.green, for: .highlighted)
        btnVib.titleLabel?.textAlignment = .center
    
        vibrancyView.contentView.addSubview(btnVib)
        
        
        
// Simple blur View
//        let blurEffect = UIBlurEffect.init(style: .light)
//        let visualEffectView = UIVisualEffectView.init(effect: blurEffect)
//        visualEffectView.clipsToBounds = true
//        visualEffectView.frame = CGRect(x: 0, y: 200, width: 200, height: 50)
//        self.view.addSubview(visualEffectView)
        
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
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
