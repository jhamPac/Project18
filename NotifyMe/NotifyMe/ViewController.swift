//
//  ViewController.swift
//  NotifyMe
//
//  Created by jhampac on 2/9/16.
//  Copyright © 2016 jhampac. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBAction func registerLocal(sender: UIButton)
    {
        let notificationSettings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
    }
    
    @IBAction func scheduleLocal(sender: UIButton)
    {
        guard let settings = UIApplication.sharedApplication().currentUserNotificationSettings() else { return }
        
        if settings.types == .None
        {
            let ac = UIAlertController(title: "Can't schedule", message: "Please turn on permissions", preferredStyle: .Alert)
            let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
            ac.addAction(action)
            presentViewController(ac, animated: true, completion: nil)
            return
        }
        
        let notification = UILocalNotification()
        notification.fireDate = NSDate(timeIntervalSinceNow: 5)
        notification.alertBody = "Hey you! Yeah you, swipe me"
        notification.alertAction = "NOW NOW NOW"
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.userInfo = ["CustomeField1": "woo"]
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}

