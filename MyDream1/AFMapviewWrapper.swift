//
//  AFMapviewWrapper.swift
//  MyDream1
//
//  Created by Fisky on 14/10/18.
//  Copyright © 2018 Fisky. All rights reserved.
//

import UIKit
import GoogleMaps
let GMS_API_key = "AIzaSyC9hotxeRVH7ccwz2ZNwSj_c8HC6PTB6ok"
protocol AFMapviewDelegate {
    
}


class AFMapviewWrapper: NSObject,CLLocationManagerDelegate {
    fileprivate var mapDelegate:AFMapviewDelegate?
    fileprivate var AFLoactionManager:CLLocationManager!
     public private (set)  var mapcameraPosition:GMSCameraPosition!
    static let  sharedManager:AFMapviewWrapper =
    {
        
        let _AFMapviewWrapper = AFMapviewWrapper()
        GMSServices.provideAPIKey(GMS_API_key)
        
        _AFMapviewWrapper.AFLoactionManager = CLLocationManager.init()
        
        _AFMapviewWrapper.AFLoactionManager.delegate = _AFMapviewWrapper
        _AFMapviewWrapper.AFLoactionManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        _AFMapviewWrapper.AFLoactionManager.startUpdatingLocation()
        return _AFMapviewWrapper
    }()
    
//    func getCameraDetail()->GMSCameraPosition
//    {
//
//    }
    
    
}


