//
//  Ladder.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/12/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class LadderSummary: Codable {
    let showCaseEntries: [ShowCaseEntry]
    let placementMatches: [PlacementMatch]
    let allLadderMemberships: [LadderMembership]
}


class ShowCaseEntry: Codable {
    let ladderID: String
    let team: Team
    let leagueName: String
    let localizedDivisionName: String
    let rank: Int
    let wins: Int
    let losses: Int
    
    enum CodingKeys: String, CodingKey {
        case ladderID = "ladderId"
        case team, leagueName, localizedDivisionName, rank, wins, losses
    }
}


class PlacementMatch: Codable {
    let localizedGameMode: String
    let members: [TeamMember]
    let gamesRemaining: Int
}


class LadderMembership: Codable {
    let ladderID: String
    let localizedGameMode: String
    let rank: Int?
    
    enum CodingKeys: String, CodingKey {
        case ladderID = "ladderId"
        case localizedGameMode, rank
    }
}


class Team: Codable {
    let localizedGameMode: String
    let members: [TeamMember]
}


class TeamMember: Codable {
    let favoriteRace: FavoriteRace?
    let name: String
    let playerID: String
    let region: Int
    let clanTag: String?
    
    enum CodingKeys: String, CodingKey {
        case favoriteRace
        case name
        case playerID = "playerId"
        case region
        case clanTag
    }
}


class Ladder: Codable {
    let ladderTeams: [LadderTeam]
    let allLadderMemberships: [LadderMembership]
    let localizedDivision: String?
    let league: String?
    let currentLadderMembership: LadderMembership?
    let ranksAndPools: [RanksAndPool]
}


class LadderTeam: Codable {
    let teamMembers: [LadderTeamMember]
    let previousRank: Int
    let points: Int
    let wins: Int
    let losses: Int
    let mmr: Int?
    let joinTimestamp: Int
}


class LadderTeamMember: Codable {
    let id: String
    let realm: Int
    let region: Int
    let displayName: String
    let favoriteRace: FavoriteRace?
    let clanTag: String?
}


enum FavoriteRace: String, Codable {
    case protoss = "protoss"
    case random = "random"
    case terran = "terran"
    case zerg = "zerg"
}


class RanksAndPool: Codable {
    let rank: Int
    let mmr: Int
    let bonusPool: Int
}


class GrandmasterLeaderboard: Codable {
    let ladderTeams: [LadderTeam]
}
