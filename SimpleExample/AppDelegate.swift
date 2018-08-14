//
//  AppDelegate.swift
//  SimpleExample
//
//  Created by TanKou on 14/08/2018.
//  Copyright © 2018 webgeoservices. All rights reserved.
//

import UIKit
import WoosmapNow
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        Now.shared.setPrivateKey(privateKey: "__YOUR_WOOSMAP_MOBILE_PRIVATE_KEY__")
        
        if (CLLocationManager.authorizationStatus() != .notDetermined) {
            Now.shared.startMonitoringInBackground()
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        if CLLocationManager.authorizationStatus() != .notDetermined {
            Now.shared.startMonitoringInBackground()
        }
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
       
    }

    func applicationWillTerminate(_ application: UIApplication) {
        Now.shared.willTerminate()
    }
    
    // Handle remote notification registration. (succes)
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data){
        Now.shared.setRemoteNotificationToken(remoteNotificationToken: deviceToken)
    }
    
    // Handle remote notification registration. (failed)
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        NSLog("Error on getting remote notification token : \(error.localizedDescription)")
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> ())
    {
        if ( application.applicationState == UIApplicationState.inactive || application.applicationState == UIApplicationState.background ){
            Now.shared.notificationOpened(userInfo: userInfo)
        }
    }

}

