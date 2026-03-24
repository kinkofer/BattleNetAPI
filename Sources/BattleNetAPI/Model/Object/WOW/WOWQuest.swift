//
//  WOWQuest.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/23/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct WOWQuest: Codable, SelfDecodable {
    public let _links: SelfLink<WOWQuest>
    public let id: Int
    public let title: String
    public let area: KeyLink<QuestArea>
    public let description: String
    public let requirements: QuestRequirements
    public let rewards: Rewards
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}

public struct QuestRequirements: Codable, SelfDecodable {
    public let minCharacterLevel: Int
    public let maxCharacterLevel: Int
    public let faction: EnumType
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}

public struct Rewards: Codable {
    public let experience: Int
    public let reputations: [ReputationReward]
    public let money: Money
}


public struct Money: Codable {
    public let value: Int
    public let units: Units
}

public struct Units: Codable {
    public let gold: Int
    public let silver: Int
    public let copper: Int
}

public struct ReputationReward: Codable {
    public let reward: KeyLink<ReputationFaction>
    public let value: Int
}

public struct QuestArea: Codable {
    
}

public struct ReputationFaction: Codable {
    
}
