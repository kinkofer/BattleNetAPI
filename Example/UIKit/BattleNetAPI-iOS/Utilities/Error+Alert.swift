//
//  Error+Alert.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 6/28/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import UIKit
import BattleNetAPI


extension HTTPError {
    var alert: UIAlertController {
        let alert = UIAlertController(title: "Error", message: self.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
        return alert
    }
}



extension Result where Failure == HTTPError {
    /// Returns the success value in a closure or logs the error
    /// - parameter presentErrorOn: If a viewController is passed in it will present the default HTTPError alert controller, otherwise it will log the error messsage in the console
    /// - parameter successHandler: The closure contains the success value
    public func getSuccessValue(presentErrorOn viewController: UIViewController? = nil, file: String = #file, function: String = #function, line: Int = #line, successHandler: @escaping (Success) -> Void) {
        do {
            successHandler(try get())
        }
        catch let error as HTTPError {
            if let viewController = viewController {
                DispatchQueue.main.async {
                    viewController.present(error.alert, animated: true)
                }
            }
            else {
                Debug.print(error.localizedDescription, file: file, function: function, line: line)
            }
        }
        catch { }
    }
}
