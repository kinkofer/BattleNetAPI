//
//  Error+Alert.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 6/28/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import UIKit


extension HTTPError {
    var alert: UIAlertController {
        let alert = UIAlertController(title: "Error", message: self.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
        return alert
    }
}
