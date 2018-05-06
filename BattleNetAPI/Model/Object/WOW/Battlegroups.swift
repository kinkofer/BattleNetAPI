//
//  Battlegroups.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/23/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class BattlegroupIndex: Codable {
    var battlegroups: [Battlegroup] = [Battlegroup]()
}


class Battlegroup: Codable {
    var name: String = ""
    var slug: String = ""
}
