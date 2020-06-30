//
//  User.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public class User: Codable {
    public let id: Int
    public let battletag: String
    public let sub: String
}
