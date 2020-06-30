//
//  SC2Season.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/11/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import Foundation


public class SC2Season: Codable {
    public let seasonID: Int
    public let number: Int
    public let year: Int
    public let startDate: String
    public let endDate: String
    
    enum CodingKeys: String, CodingKey {
        case seasonID = "seasonId"
        case number, year, startDate, endDate
    }
}
