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
    
    @IBOutlet weak var trackingSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.trackingSwitch.isOn = Now.shared.getUserTracking()
    }
    
    @IBAction func trackingSwitchChanged(_ sender: UISwitch) {
        Now.shared.updateUserTracking(tracking: sender.isOn)
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

