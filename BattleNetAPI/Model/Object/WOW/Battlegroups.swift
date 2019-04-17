//
//  Battlegroups.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/23/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class BattlegroupIndex: Codable {
    let battlegroups: [Battlegroup]
}


class Battlegroup: Codable {
    let name: String
    let slug: String
}
