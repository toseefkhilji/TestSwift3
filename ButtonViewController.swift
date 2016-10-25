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
        buttonSimple.leadingAnchor.constraint(greaterThanOrEqualTo: self.view.leadingAnchor, constant: 10).isActive = true
//        buttonSimple.layoutMargins.left = 100
        buttonSimple.widthAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        buttonSimple.heightAnchor.constraint(lessThanOrEqualToConstant: 30).isActive = true
        
        let sysbtn : UIButton? = UIButton(type: .infoLight)
        self.view.addSubview(sysbtn!)
        sysbtn?.frame = CGRect(x: buttonSimple.bounds.size.width + 100, y: buttonSimple.frame.origin.y, width: 20, height: 20)
        
//        sysbtn.topAnchor.constraint(greaterThanOrEqualTo: self.view.topAnchor, constant: 60).isActive = true
//        sysbtn.leadingAnchor.constraint(greaterThanOrEqualTo: self.view.leadingAnchor, constant: 210).isActive = true
        //        buttonSimple.layoutMargins.left = 100
//        sysbtn.widthAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
//        sysbtn.heightAnchor.constraint(lessThanOrEqualToConstant: 30).isActive = true
//     
        
        
        var imge : UIImage?{
            didSet{
                buttonSimple.setImage(imge, for: .normal)
            }
        }
        
    
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "blue3.png")!)
        
        let bfrm = CGRect(x: 5, y: 250, width: 300, height: 100)
//        let blureff : UIBlurEffect = UIBlurEffect.init(style: .extraLight)
        let vibEffect : UIVibrancyEffect = UIVibrancyEffect(blurEffect: .init(style: .extraLight))
        let vibView = UIVisualEffectView(effect: vibEffect)
        vibView.frame = bfrm
        
        let btnVib = UIButton(type: .custom)
        btnVib.setTitle("Vibrancy Button", for: .normal)
        btnVib.frame = CGRect(x: 5, y: 200, width: 150, height: 40)
        
        vibView.contentView.addSubview(btnVib)
        self.view.addSubview(vibView)
        
        
        
        
        
        
        
        
        
//        
//        let blurEffect = UIBlurEffect.init(style: .dark)
//        let visualEffectView = UIVisualEffectView.init(effect: blurEffect)
//        visualEffectView.backgroundColor = UIColor().withAlphaComponent(0.60)
//        visualEffectView.clipsToBounds = true
//        visualEffectView.layer.borderColor = UIColor.black.withAlphaComponent(0.4).cgColor
//        visualEffectView.layer.borderWidth = 1.0
//        visualEffectView.layer.cornerRadius = 6.0
//        visualEffectView.frame = self.bounds
//        self.insertSubview(visualEffectView, at: 0)
        
        
        
        
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
