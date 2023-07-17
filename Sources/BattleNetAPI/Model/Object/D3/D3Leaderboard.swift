//
//  Leaderboard.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/18/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct LeaderboardColumn: Codable {
    public let id: String
    public let hidden: Bool
    public let order: Int?
    public let label: LocaleString
    public let type: LeaderboardColumnType
}



public enum LeaderboardColumnType: String, Codable {
    case datetime = "DATETIME"
    case number = "NUMBER"
    case string = "STRING"
    case spanMS = "SPAN_MS"
}



public struct LeaderboardEntry: Codable {
    public let player: [D3Player]
    public let order: Int
    public let data: [Datum]
}



public struct Datum: Codable {
    public let id: String
    public let number: Int?
    public let timestamp: Double?
    public let string: String?
}



public struct D3Player: Codable {
    public let key: String
    public let accountID: Double
    public let data: [Datum]
    
    enum CodingKeys: String, CodingKey {
        case key
        case accountID = "accountId"
        case data
    }
}
