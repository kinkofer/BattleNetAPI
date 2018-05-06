//
//  Guild.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/25/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class WOWGuild: Codable {
    var name: String = ""
    var realm: String = ""
    var battlegroup: String = ""
    var members: Int = 0
    var achievementPoints: Int = 0
    var emblem: Emblem = Emblem()
}



class Emblem: Codable {
    var icon: Int = 0
    var iconColor: String = ""
    var iconColorID: Int = 0
    var border: Int = 0
    var borderColor: String = ""
    var borderColorID: Int = 0
    var backgroundColor: String = ""
    var backgroundColorID: Int = 0
    
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
    var rewards: [WOWGuildReward] = [WOWGuildReward]()
}



class WOWGuildReward: Codable {
    var minGuildLevel: Int = 0
    var minGuildRepLevel: Int = 0
    var races: [Int]? = nil
    var achievement: WOWAchievement? = nil
    var item: WOWItemSummary = WOWItemSummary()
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
    var lastModified: Int = 0
    var name: String = ""
    var realm: String = ""
    var battlegroup: String = ""
    var level: Int = 0
    var side: Int = 0
    var achievementPoints: Int = 0
    var emblem: Emblem = Emblem()
    
    var achievements: WOWAchievementStatus? = nil
    var challenges: [Challenge]? = nil
    var members: [GuildMember]? = nil
    var news: [Feed]? = nil
    
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
    var character: GuildCharacter = GuildCharacter()
    var rank: Int = 0
}



class GuildCharacter: Codable {
    var name: String = ""
    var `class`: Int = 0
    var gender: Int = 0
    var race: Int = 0
    var level: Int = 0
    
    var realm: String = ""
    var guild: String = ""
    var guildRealm: String = ""
    
    var battlegroup: String = ""
    var achievementPoints: Int = 0
    var lastModified: Int = 0
    var thumbnail: String = ""
    
    var spec: SpecializationLegacy? = nil
}
