//
//  SC2Season.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/11/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import Foundation


class SC2Season: Codable {
    let seasonID: Int
    let number: Int
    let year: Int
    let startDate: String
    let endDate: String
    
    enum CodingKeys: String, CodingKey {
        case seasonID = "seasonId"
        case number, year, startDate, endDate
    }
}
