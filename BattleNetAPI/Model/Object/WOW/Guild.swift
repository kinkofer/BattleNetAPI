//
//  Guild.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/25/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class WOWGuild: Codable {
    let name: String
    let realm: String
    let battlegroup: String
    let members: Int
    let achievementPoints: Int
    let emblem: Emblem
}



class Emblem: Codable {
    let icon: Int
    let iconColor: String
    let iconColorID: Int
    let border: Int
    let borderColor: String
    let borderColorID: Int
    let backgroundColor: String
    let backgroundColorID: Int
    
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



class WOWGuildRewardIndex: Codable {
    let rewards: [WOWGuildReward]
}



class WOWGuildReward: Codable {
    let minGuildLevel: Int
    let minGuildRepLevel: Int
    let races: [Int]?
    let achievement: WOWAchievement?
    let item: WOWItemSummary
}



struct WOWGuildField: OptionSet {
    let rawValue: Int
    
    static let achievements = WOWGuildField(rawValue: 1 << 0)
    static let challenges = WOWGuildField(rawValue: 1 << 1)
    static let members = WOWGuildField(rawValue: 1 << 2)
    static let news = WOWGuildField(rawValue: 1 << 3)
    
    
    var toArray: [String] {
        var array = [String]()
        
        if self.contains(.achievements) { array.append("achievements") }
        if self.contains(.challenges) { array.append("challenge") }
        if self.contains(.members) { array.append("members") }
        if self.contains(.news) { array.append("news") }
        
        return array
    }
}



// https://us.api.battle.net/wow/guild/illidan/limit?fields=achievements
class WOWGuildProfile: Codable {
    let lastModified: Int
    let name: String
    let realm: String
    let battlegroup: String
    let level: Int
    let side: Int
    let achievementPoints: Int
    let emblem: Emblem
    
    let achievements: WOWAchievementStatus?
    let challenges: [Challenge]?
    let members: [GuildMember]?
    let news: [Feed]?
    
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



class GuildMember: Codable {
    let character: GuildCharacter?
    let spec: CharacterSpecialization?
}



class GuildCharacter: Codable {
    let name: String
    let `class`: Int
    let gender: Int
    let race: Int
    let level: Int
    
    let realm: String?
    let guild: String?
    let guildRealm: String?
    
    let battlegroup: String?
    let achievementPoints: Int
    let lastModified: Int
    let thumbnail: String
    
    let spec: CharacterSpecialization?
}
