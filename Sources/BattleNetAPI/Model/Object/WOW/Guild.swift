//
//  Guild.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/25/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct WOWGuild: Codable {
    public let name: String
    public let realm: String
    public let battlegroup: String
    public let members: Int
    public let achievementPoints: Int
    public let emblem: Emblem
}



public struct Emblem: Codable {
    public let icon: Int
    public let iconColor: String
    public let iconColorID: Int
    public let border: Int
    public let borderColor: String
    public let borderColorID: Int
    public let backgroundColor: String
    public let backgroundColorID: Int
    
    enum CodingKeys: String, CodingKey {
        case icon
        case iconColor
        case iconColorID = "iconColorId"
        case border
        case borderColor
        case borderColorID = "borderColorId"
        case backgroundColor
        case backgroundColorID = "backgroundColorId"
    }
}



public struct WOWGuildRewardIndex: Codable {
    public let rewards: [WOWGuildReward]
}



public struct WOWGuildReward: Codable {
    public let minGuildLevel: Int
    public let minGuildRepLevel: Int
    public let races: [Int]?
    public let achievement: WOWAchievement?
    public let item: WOWItemSummary
}



public struct WOWGuildField: OptionSet {
    public let rawValue: Int
    
    public static let achievements = WOWGuildField(rawValue: 1 << 0)
    public static let challenges = WOWGuildField(rawValue: 1 << 1)
    public static let members = WOWGuildField(rawValue: 1 << 2)
    public static let news = WOWGuildField(rawValue: 1 << 3)
    
    
    public var toArray: [String] {
        var array = [String]()
        
        if self.contains(.achievements) { array.append("achievements") }
        if self.contains(.challenges) { array.append("challenge") }
        if self.contains(.members) { array.append("members") }
        if self.contains(.news) { array.append("news") }
        
        return array
    }
    
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}



// https://us.api.battle.net/wow/guild/illidan/limit?fields=achievements
public struct WOWGuildProfile: Codable {
    public let lastModified: Int
    public let name: String
    public let realm: String
    public let battlegroup: String
    public let level: Int
    public let side: Int
    public let achievementPoints: Int
    public let emblem: Emblem
    
    public let achievements: WOWAchievementStatus?
    public let challenges: [Challenge]?
    public let members: [GuildMember]?
    public let news: [Feed]?
    
    enum CodingKeys: String, CodingKey {
        case lastModified
        case name
        case realm
        case battlegroup
        case level
        case side
        case achievementPoints
        case emblem
        case achievements
        case challenges = "challenge"
        case members
        case news
    }
}



public struct GuildMember: Codable {
    public let character: GuildCharacter?
    public let spec: CharacterSpecialization?
}



public struct GuildCharacter: Codable {
    public let name: String
    public let `class`: Int
    public let gender: Int
    public let race: Int
    public let level: Int
    
    public let realm: String?
    public let guild: String?
    public let guildRealm: String?
    
    public let battlegroup: String?
    public let achievementPoints: Int
    public let lastModified: Int
    public let thumbnail: String
    
    public let spec: CharacterSpecialization?
}
