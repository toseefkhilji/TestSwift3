//
//  ViewController.swift
//  TestSwift3
//
//  Created by Toseefhusen Khilji on 06/10/16.
//  Copyright © 2016 Toseef Khilji. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var tblview: UITableView!
    var arrayData = [String]()
//    var arraYDict = [String:Any]()
    
    var arrayM = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        arrayData = ["Label","Button","TextField","TextView","TableView","CollectionView"]
        arrayData += ["StackView"]
        
        for item in arrayData {
            print(item)
        }
        
        for (index, value) in arrayData.enumerated() {
            print("Item \(index + 1): \(value)")
        }
        
        
        tblview.delegate = self;
        tblview.dataSource = self;
//        tblview.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        arrayM .addObjects(from: arrayData)
        
        
//        arraYDict = ["name":"Toseef"]
//        arraYDict.append(["key":"Value"])
        
        let objCMutableArray = NSMutableArray(array: ["a", "b", "c"])
        let swiftArray = objCMutableArray as NSArray as! [String]

        print(swiftArray)
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "UIControls"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath) as UITableViewCell
        
        //        let cell2: UITableViewCell = UITableViewCell(style: .default, reuseIdentifier: "CellId")
        
        cell.textLabel?.text = arrayData[indexPath.row] as String
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if indexPath.row == 0 {
            let vc = storyboard.instantiateViewController(withIdentifier: "LabelViewController")
            self.navigationController!.pushViewController(vc, animated: true)
        }
        else{
            let vc = storyboard.instantiateViewController(withIdentifier: "ButtonViewController")
            self.navigationController!.pushViewController(vc, animated: true)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

