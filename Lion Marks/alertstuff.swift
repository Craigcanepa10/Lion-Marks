//
//  alertstuff.swift
//  Lion Marks
//
//  Created by Craig Canepa on 10/19/21.
//

import SwiftUI

class alertstuff: UIViewController {
    func topMostController() -> UIViewController {
        var topController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
            while (topController.presentedViewController != nil) {
                topController = topController.presentedViewController!
            }
            return topController
        }
    
    
    func locationManagers() {
        let topVC = topMostController()
        print("location manager authorization status changed")

            let alert = UIAlertController(title: "Location Services Off", message: "Please turn on Location Services in Settings > Privacy > Location Services to allow Maps to determine your current location", preferredStyle: .alert)
            let settingsAction = UIAlertAction(title: "Settings", style: .default, handler: {action in

                // open the location services permission in Settings app
                UIApplication.shared.open(URL(string:UIApplication.openSettingsURLString)!)
            })

            let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)

            alert.addAction(settingsAction)
            alert.addAction(cancelAction)
          
            alert.preferredAction = settingsAction

        topVC.present(alert, animated: true, completion: nil)
        
    }
    
    func locationManagerno() {
        let topVC = topMostController()
        print("location manager authorization status changed")

            let alert = UIAlertController(title: "Location access required to get your current location", message: "Please allow location access to get access to certine app features.", preferredStyle: .alert)
            let settingsAction = UIAlertAction(title: "Settings", style: .default, handler: {action in

                // open the app permission in Settings app
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
            })

            let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)

            alert.addAction(settingsAction)
            alert.addAction(cancelAction)
          
            alert.preferredAction = settingsAction

        topVC.present(alert, animated: true, completion: nil)
        
    }
}
