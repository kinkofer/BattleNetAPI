//
//  LeagueEnums.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 1/27/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import Foundation


public enum LeagueQueue: String {
    case woL1v1 = "WoL 1v1"
    case woL2v2 = "WoL 2v2"
    case woL3v3 = "WoL 3v3"
    case woL4v4 = "WoL 4v4"
    case hotS1v1 = "HotS 1v1"
    case hotS2v2 = "HotS 2v2"
    case hotS3v3 = "HotS 3v3"
    case hotS4v4 = "HotS 4v4"
    case lotV1v1 = "LotV 1v1"
    case lotV2v2 = "LotV 2v2"
    case lotV3v3 = "LotV 3v3"
    case lotV4v4 = "LotV 4v4"
    case lotVArchon = "LotV Archon"
    
    
    public var title: String {
        return rawValue
    }
    
    
    public var id: Int {
        switch self {
        case .woL1v1: return 1
        case .woL2v2: return 2
        case .woL3v3: return 3
        case .woL4v4: return 4
        case .hotS1v1: return 101
        case .hotS2v2: return 102
        case .hotS3v3: return 103
        case .hotS4v4: return 104
        case .lotV1v1: return 201
        case .lotV2v2: return 202
        case .lotV3v3: return 203
        case .lotV4v4: return 204
        case .lotVArchon: return 206
        }
    }
}



public enum LeagueTeam: String {
    case arranged = "Arranged"
    case random = "Random"
    
    
    public var title: String {
        return rawValue
    }
    
    
    public var id: Int {
        switch self {
        case .arranged: return 0
        case .random: return 1
        }
    }
}



public enum LeagueType: String {
    case bronze = "Bronze"
    case silver = "Silver"
    case gold = "Gold"
    case platinum = "Platinum"
    case diamond = "Diamond"
    case master = "Master"
    case grandmaster = "Grandmaster"
    
    
    public var title: String {
        return rawValue
    }
    
    
    public var id: Int {
        switch self {
        case .bronze: return 0
        case .silver: return 1
        case .gold: return 2
        case .platinum: return 3
        case .diamond: return 4
        case .master: return 5
        case .grandmaster: return 6
        }
    }
}
