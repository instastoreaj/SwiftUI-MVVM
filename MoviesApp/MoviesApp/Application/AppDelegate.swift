//
//  AppDelegate.swift
//  MoviesApp
//
//  Created by Lucas Ferreira Machado on 7/29/20.
//  Copyright © 2020 Lucas Ferreira Machado. All rights reserved.
//

import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let initialScreen = MoviesListScreen()
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIHostingController(rootView: initialScreen)
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

