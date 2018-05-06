//
//  Region.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class RegionIndexResult: Codable {
    var regions = [RegionIndex]()
}



class RegionIndex: Codable {
    var href = ""
    
}


// https://us.api.battle.net/data/wow/region/1
class Region: Codable {
    var id: Int = 0
    var name: String = ""
    var tag: String = ""
}



class RegionLink: Codable {
    var key: Link<Region> = Link<Region>()
    var id: Int = 0
    var name: String = ""
}
