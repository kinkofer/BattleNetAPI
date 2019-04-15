//
//  PowerType.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/14/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import Foundation


class PowerTypeIndex: Codable {
    let _links: SelfLink<PowerTypeIndex>
    let powerTypes: [KeyLink<PowerType>]
    
    enum CodingKeys: String, CodingKey {
        case _links
        case powerTypes = "power_types"
    }
}


class PowerType: Codable {
    let _links: SelfLink<PowerType>
    let id: Int
    let name: String
}
