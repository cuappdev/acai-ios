//
//  AppDelegate.swift
//  appdev-demo
//
//  Created by Drew Dunne on 2/19/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import Crashlytics
import Fabric
import FutureNova
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupEndpointConfig()
        setupWindow()
        setupFabric()

        return true
    }

    func setupEndpointConfig() {
        Endpoint.config.scheme = "https"
        #if DEBUG
        Endpoint.config.host = Keys.apiDevURL.value
        #else
        Endpoint.config.host = Keys.apiURL.value
        #endif
        Endpoint.config.commonPath = "/api/v1"
    }

    func setupWindow() {
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: MenuViewController())
        window?.makeKeyAndVisible()
    }

    func setupFabric() {
        #if DEBUG
        print("[Running Acai in debug configuration]")
        #else
        print("[Running Acai in release configuration]")
        Crashlytics.start(withAPIKey: Keys.fabricAPIKey.value)
        #endif
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}
