//
//  Scope.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/7/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct Scope: OptionSet {
    public let rawValue: Int
    
    /// World of Warcraft scope
    public static let wow = Scope(rawValue: 1 << 0)
    /// Starcraft 2 scope
    public static let sc2 = Scope(rawValue: 1 << 1)
    /// Diable 3 scope
    public static let d3 = Scope(rawValue: 1 << 2)
    /// OpenID Connect (OIDC) scope
    public static let openID = Scope(rawValue: 1 << 3)
    
    
    public var scopeValue: String {
        var values = [String]()
        
        if self.contains(.wow) {
            values.append("wow.profile")
        }
        
        if self.contains(.sc2) {
            values.append("sc2.profile")
        }
        
        if self.contains(.d3) {
            values.append("d3.profile")
        }
        
        if self.contains(.openID) {
            values.append("openid")
        }
        
        return values.joined(separator: " ")
    }
    
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}
