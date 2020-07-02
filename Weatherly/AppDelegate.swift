//
//  AppDelegate.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 02/04/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Check if units are set
    // If none are set, set a default value to "si", meaning metric units to be used
    let defaults = UserDefaults.standard
    if defaults.object(forKey: "units") as? String == "" && defaults.object(forKey: "units") == nil {
      defaults.set("si", forKey: "units")
    } else {
      print("Got a default units set: \(defaults.object(forKey: "units") ?? "No value set for units")")
    }
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = HomeViewController()
    window?.makeKeyAndVisible()
    return true
  }
}

