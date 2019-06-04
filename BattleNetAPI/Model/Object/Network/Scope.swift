//
//  Scope.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/7/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


struct Scope: OptionSet {
    let rawValue: Int
    
    /// World of Warcraft scope
    static let wow = Scope(rawValue: 1 << 0)
    /// Starcraft 2 scope
    static let sc2 = Scope(rawValue: 1 << 1)
    
    
    var scopeValue: String {
        var values = [String]()
        
        if self.contains(.wow) {
            values.append("wow.profile")
        }
        
        if self.contains(.sc2) {
            values.append("sc2.profile")
        }
        
        return values.joined(separator: " ")
    }
}
