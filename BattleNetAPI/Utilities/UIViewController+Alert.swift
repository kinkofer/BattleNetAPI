//
//  UIViewController+Alert.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import UIKit


extension UIViewController {
    public typealias AlertAction = ((UIAlertAction) -> Void)?
    
    /**
     Convenience method to present an alert controller. The default action will appear on the right and the cancel on the left.
     
     If no actions are provided, the alert will dismiss itself after two seconds.
     
     - parameter title: Title of the alert
     - parameter message: Message of alert
     - parameter defaultAction: Action for default selection
     - parameter cancelAction: Action for cancel selection
     */
    public func presentAlert(title: String, message: String?, defaultAction: UIAlertAction? = nil, cancelAction: UIAlertAction? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let cancelAction = cancelAction {
            alert.addAction(cancelAction)
        }
        
        if let defaultAction = defaultAction {
            alert.addAction(defaultAction)
        }
        
        var completion: (() -> Void)? = nil
        
        if cancelAction == nil && defaultAction == nil {
            completion = {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
        
        self.present(alert, animated: true, completion: completion)
    }
    
    
    /**
     Convenience method to present an alert controller. The default action will appear on the right and the cancel on the left.
     
     If no actions are provided, the alert will dismiss itself after two seconds.
     
     - parameter title: Title of the alert
     - parameter message: Message of alert
     - parameter okayAction: Action for selecing OK
     */
    public func presentOkayAlert(title: String, message: String?, okayAction: AlertAction = nil) {
        presentAlert(title: title, message: message, defaultAction: UIAlertAction(title: "OK", style: .default, handler: okayAction), cancelAction: nil)
    }
    
    
    /**
     Convenience method to present an alert controller. The default action will appear on the right and the cancel on the left.
     
     If no actions are provided, the alert will dismiss itself after two seconds.
     
     - parameter title: Title of the alert
     - parameter message: Message of alert
     - parameter buttonTitle: The title of the confirm button. Default "Yes"
     - parameter confirmed: Action for selecting confirm
     - parameter denied: Action for selecting cancel
     */
    public func presentConfirmAlert(title: String, message: String?, buttonTitle: String = "Yes", confirmed: AlertAction, denied: AlertAction = nil) {
        let confirmedAction = UIAlertAction(title: buttonTitle, style: .default, handler: confirmed)
        let deniedAction = UIAlertAction(title: "Cancel", style: .cancel, handler: denied)
        
        presentAlert(title: title, message: message, defaultAction: confirmedAction, cancelAction: deniedAction)
    }
}

