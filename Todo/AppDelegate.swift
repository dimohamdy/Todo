//
//  AppDelegate.swift
//  Todo
//
//  Created by BinaryBoy on 7/28/19.
//  Copyright © 2019 dimohamdy. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: TodoListBuilder.viewController( dataSource: TodoRepository()))
        self.window?.makeKeyAndVisible()
        
        return true
    }
}
