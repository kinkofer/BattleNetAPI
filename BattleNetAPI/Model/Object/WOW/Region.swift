//
//  Region.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class RegionIndexResult: Codable {
    let regions: [Link<Region>]
}


// https://us.api.battle.net/data/wow/region/1
class Region: Codable {
    let id: Int
    let name: String
    let tag: String
}
