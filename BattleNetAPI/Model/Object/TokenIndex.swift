//
//  TokenIndex.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class TokenIndex: Codable {
    var lastUpdatedTimestamp = 0
    var price = 0
    
    enum CodingKeys: String, CodingKey {
        case lastUpdatedTimestamp = "last_updated_timestamp"
        case price
    }
}
