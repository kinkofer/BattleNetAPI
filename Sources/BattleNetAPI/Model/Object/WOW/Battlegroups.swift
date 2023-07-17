//
//  Battlegroups.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/23/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct BattlegroupIndex: Codable {
    public let battlegroups: [Battlegroup]
}


public struct Battlegroup: Codable {
    public let name: String
    public let slug: String
}
