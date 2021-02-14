//
//  Ladder.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/12/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public class LadderSummary: Codable {
    public let showCaseEntries: [ShowCaseEntry]
    public let placementMatches: [PlacementMatch]
    public let allLadderMemberships: [LadderMembership]
}


public class ShowCaseEntry: Codable {
    public let ladderID: String
    public let team: Team
    public let leagueName: String
    public let localizedDivisionName: String
    public let rank: Int
    public let wins: Int
    public let losses: Int
    
    enum CodingKeys: String, CodingKey {
        case ladderID = "ladderId"
        case team, leagueName, localizedDivisionName, rank, wins, losses
    }
}


public class PlacementMatch: Codable {
    public let localizedGameMode: String
    public let members: [TeamMember]
    public let gamesRemaining: Int
}


public class LadderMembership: Codable {
    public let ladderID: String
    public let localizedGameMode: String
    public let rank: Int?
    
    enum CodingKeys: String, CodingKey {
        case ladderID = "ladderId"
        case localizedGameMode, rank
    }
}


public class Team: Codable {
    public let localizedGameMode: String
    public let members: [TeamMember]
}


public class TeamMember: Codable {
    public let favoriteRace: FavoriteRace?
    public let name: String
    public let playerID: String
    public let region: Int
    public let clanTag: String?
    
    enum CodingKeys: String, CodingKey {
        case favoriteRace
        case name
        case playerID = "playerId"
        case region
        case clanTag
    }
}


public class Ladder: Codable {
    public let ladderTeams: [LadderTeam]
    public let allLadderMemberships: [LadderMembership]
    public let localizedDivision: String?
    public let league: String?
    public let currentLadderMembership: LadderMembership?
    public let ranksAndPools: [RanksAndPool]
}


public class LadderTeam: Codable {
    public let teamMembers: [LadderTeamMember]
    public let previousRank: Int
    public let points: Int
    public let wins: Int
    public let losses: Int
    public let mmr: Int?
    public let joinTimestamp: Int
}


public class LadderTeamMember: Codable {
    public let id: String
    public let realm: Int
    public let region: Int
    public let displayName: String
    public let favoriteRace: FavoriteRace?
    public let clanTag: String?
}


public enum FavoriteRace: String, Codable {
    case protoss = "protoss"
    case random = "random"
    case terran = "terran"
    case zerg = "zerg"
}


public class RanksAndPool: Codable {
    public let rank: Int
    public let mmr: Int
    public let bonusPool: Int
}


public class GrandmasterLeaderboard: Codable {
    public let ladderTeams: [LadderTeam]
}
