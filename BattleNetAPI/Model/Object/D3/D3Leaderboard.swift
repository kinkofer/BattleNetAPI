//
//  Leaderboard.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/18/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class LeaderboardColumn: Codable {
    let id: String
    let hidden: Bool
    let order: Int?
    let label: LocaleString
    let type: LeaderboardColumnType
}



enum LeaderboardColumnType: String, Codable {
    case datetime = "DATETIME"
    case number = "NUMBER"
    case string = "STRING"
    case spanMS = "SPAN_MS"
}



class LeaderboardEntry: Codable {
    let player: [D3Player]
    let order: Int
    let data: [Datum]
}



class Datum: Codable {
    let id: String
    let number: Int?
    let timestamp: Double?
    let string: String?
}



class D3Player: Codable {
    let key: String
    let accountID: Double
    let data: [Datum]
    
    enum CodingKeys: String, CodingKey {
        case key
        case accountID = "accountId"
        case data
    }
}
