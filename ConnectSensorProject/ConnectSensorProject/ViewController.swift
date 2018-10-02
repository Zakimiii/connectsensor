//
//  ViewController.swift
//  ConnectSensorProject
//
//  Created by Apple on 2018/07/04.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit
import ConnectSensor

class ViewController: UIViewController, ConnectSensorDelegate {
    
    
    @IBOutlet weak var ConnectCondtion: UILabel!
    
    let sensor =  ConnectSensor()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sensor.ConnectSensorDelegate = self
        sensor.observeConnect()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func caseWifiFn() {
        self.ConnectCondtion.text = "WiFi"
    }
    
    func caseCellularFn() {
        self.ConnectCondtion.text = "モバイルデータ通信"
    }
    
    func caseNoneFn() {
        self.ConnectCondtion.text = "現在ネットワークをご利用いただけません"
    }


}

