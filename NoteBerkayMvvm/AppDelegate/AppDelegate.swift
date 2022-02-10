//
//  AppDelegate.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 9.02.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let bounds = UIScreen.main.bounds
        self.window = UIWindow(frame: bounds)
        self.window?.makeKeyAndVisible()
        AppRouter.shared.window = window 
        AppRouter.shared.startApp()
        return true
    }
    
}
