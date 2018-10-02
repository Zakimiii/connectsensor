//
//  ConnectSensor.swift
//  ConnectSensor
//
//  Created by Apple on 2018/07/04.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

@available(iOS 11.0, tvOS 11.0, *)
@objc public protocol ConnectSensorDelegate {
    
    @objc optional func caseWifiFn()
    
    @objc optional func caseCellularFn()
    
    @objc optional func caseNoneFn()
}

@objcMembers
@available(iOS 11.0, tvOS 11.0, *)
public class ConnectSensor: NSObject, ConnectSensorDelegate {
    
    open var ConnectSensorDelegate: ConnectSensorDelegate!
    
    open let reachability = Reachability()
    
    open func observeConnect() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.reachabilityChanged), name: .reachabilityChanged, object: reachability)
        try? reachability?.startNotifier()
    }
    
    open func reachabilityChanged() {
        if let reachability = Reachability() {
            switch reachability.connection {
            case .wifi :
                ConnectSensorDelegate!.caseWifiFn!()
            case .cellular:
                ConnectSensorDelegate!.caseCellularFn!()
            case .none:
                ConnectSensorDelegate!.caseNoneFn!()
            }
        }
    }
}

