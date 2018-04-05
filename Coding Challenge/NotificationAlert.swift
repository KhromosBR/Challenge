//
//  NotificationAlert.swift
//  Coding Challenge
//
//  Created by Ricardo Duarte on 2018-04-04.
//  Copyright © 2018 KhromosTech. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class Notifications: UIAlertController {
    
    func alertEmptyField(titleText: String, messageText: String?){
        
        let alert = UIAlertController(title: titleText, message: messageText, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
}
