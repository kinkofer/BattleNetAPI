//
//  D3Skill.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/10/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class D3Skill: Codable {
    let slug: String
    let name: String
    let icon: String
    let level: Int
    
    let tooltipUrl: String
    let description: String
    let descriptionHtml: String
}


class D3SkillCategory: Codable {
    let slug: String
    let name: String
}


class D3SkillSet: Codable {
    let active: [D3Skill]
    let passive: [D3Skill]
}


class D3SkillConfiguration: Codable {
    let skill: D3Skill
    let runes: [Rune]?
    let rune: Rune?
}


class Rune: Codable {
    let slug: String
    let name: String
    let type: String
    let level: Int
    
    let description: String
    let descriptionHtml: String
}
