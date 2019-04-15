//
//  TokenIndex.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class TokenIndex: Codable {
    let lastUpdatedTimestamp: Int
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case lastUpdatedTimestamp = "last_updated_timestamp"
        case price
    }
}
