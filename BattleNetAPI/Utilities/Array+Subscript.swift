//
//  Array+Subscript.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import Foundation


extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
