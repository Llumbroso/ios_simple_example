//
//  ViewController.swift
//  SimpleExample
//
//  Created by TanKou on 14/08/2018.
//  Copyright © 2018 webgeoservices. All rights reserved.
//

import UIKit
import WoosmapNow
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func ActivateNotifications(_ sender: UIButton) {
        if #available(iOS 10, *) {
            UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
            UNUserNotificationCenter.current().requestAuthorization(options:[.badge, .alert, .sound]) { granted, error in }
        } else {
            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil))
        }
        UIApplication.shared.registerForRemoteNotifications()
    }
    
    @IBAction func ActivateWoosmapNow(_ sender: UIButton) {
        Now.shared.updateUserTracking(tracking: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

