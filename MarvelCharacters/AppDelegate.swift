//
//  AppDelegate.swift
//  MarvelCharacters
//
//  Created by Gabriel Paul on 22/10/19.
//  Copyright © 2019 GabrielPaul. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var appCoordinator: AppCoordinator?
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
        
        return true
    }
    
}

