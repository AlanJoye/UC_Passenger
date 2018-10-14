//
//  GeneralRouterManager.swift
//  vectone-ios
//
//  Created by Fisky  on 12/01/2018.
//  Copyright © 2017 Mundio Mobile. All rights reserved.
//

import UIKit


class GeneralRouterManager: NSObject {
    // Can't init is singleton
    private override init() {
        super.init()
    }
    
    //MARK: Shared Instance
    static let sharedInstance: GeneralRouterManager = GeneralRouterManager()

    
    func presentLogin(){
        //check if first time launching app
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        var storyboard: UIStoryboard
        storyboard = UIStoryboard(name: "Login", bundle: nil)
        appDelegate.window?.rootViewController = storyboard.instantiateInitialViewController()
       // appDelegate.customiseTabbar()
    }
    
    func presentMain() {
        //check if first time launching app
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        var storyboard: UIStoryboard
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        appDelegate.window?.rootViewController = storyboard.instantiateInitialViewController()
       // appDelegate.customiseTabbar()
        
    }
    
    
}


