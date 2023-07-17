//
//  D3Skill.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/10/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct D3Skill: Codable {
    public let slug: String
    public let name: String
    public let icon: String
    public let level: Int
    
    public let tooltipUrl: String
    public let description: String
    public let descriptionHtml: String
}


public struct D3SkillCategory: Codable {
    public let slug: String
    public let name: String
}


public struct D3SkillSet: Codable {
    public let active: [D3Skill]
    public let passive: [D3Skill]
}


public struct D3SkillConfiguration: Codable {
    public let skill: D3Skill
    public let runes: [Rune]?
    public let rune: Rune?
}


public struct Rune: Codable {
    public let slug: String
    public let name: String
    public let type: String
    public let level: Int
    
    public let description: String
    public let descriptionHtml: String
}
