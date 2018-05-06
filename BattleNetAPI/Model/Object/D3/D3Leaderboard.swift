//
//  Leaderboard.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/18/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class LeaderboardColumn: Codable {
    var id: String = ""
    var hidden: Bool = false
    var order: Int? = 0
    var label: LocaleString = LocaleString()
    var type: LeaderboardColumnType = .string
}



enum LeaderboardColumnType: String, Codable {
    case datetime = "DATETIME"
    case number = "NUMBER"
    case string = "STRING"
    case spanMS = "SPAN_MS"
}



class LeaderboardEntry: Codable {
    var player: [D3Player] = [D3Player]()
    var order: Int = 0
    var data: [Datum] = [Datum]()
}



class Datum: Codable {
    var id: String = ""
    var number: Int? = nil
    var timestamp: Double? = nil
    var string: String? = nil
}



class D3Player: Codable {
    var key: String = ""
    var accountID: Double = 0
    var data: [Datum] = [Datum]()
    
    enum CodingKeys: String, CodingKey {
        case key
        case accountID = "accountId"
        case data
    }
}
