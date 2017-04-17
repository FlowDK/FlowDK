//
//  AppDelegate.swift
//  FlowDK
//
//  Created by JP McGlone on 01/30/2017.
//  Copyright (c) 2017 JP McGlone. All rights reserved.
//

import UIKit
import FlowDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    self.window = UIWindow.window(rootViewController: ViewController(), makeKeyAndVisible: true)
    return true
  }
}

