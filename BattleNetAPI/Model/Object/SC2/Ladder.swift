//
//  Ladder.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/12/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class LadderOverview: Codable {
    var currentSeason = [LadderSeason]()
    var previousSeason = [LadderSeason]()
//    var showcasePlacement
}



class Ladder: Codable {
    var ladderMembers = [LadderMember]()
}



class LadderSummary: Codable {
    var ladderName = ""
    var ladderId = 0
    var division = 0
    var rank = 0
    var league = ""
    var matchMakingQueue = ""
    var wins = 0
    var losses = 0
    var showcase = false
}



class LadderSeason: Codable {
    var ladder = [LadderSummary]()
    var characters = [SC2CharacterSummary]()
//    var nonRanked
}



class LadderMember: Codable {
    var character = SC2CharacterSummary()
    var joinTimestamp: Double = 0
    var points = 0.0
    var wins = 0
    var losses = 0
    var highestRank = 0
    var previousRank = 0
    var favoriteRaceP1 = ""
}

