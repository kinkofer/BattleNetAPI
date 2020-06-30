//
//  Region.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public class RegionIndexResult: Codable {
    public let regions: [Link<Region>]
}


// https://us.api.battle.net/data/wow/region/1
public class Region: Codable {
    public let id: Int
    public let name: String
    public let tag: String
}
