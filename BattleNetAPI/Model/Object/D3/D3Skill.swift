//
//  D3Skill.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/10/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class D3Skill: Codable {
    var slug: String = ""
    var name: String = ""
    var icon: String = ""
    var level: Int = 0
    
    var tooltipUrl: String = ""
    var description: String = ""
    var descriptionHtml: String = ""
}


class D3SkillCategory: Codable {
    var slug: String = ""
    var name: String = ""
}


class D3SkillSet: Codable {
    var active: [D3Skill] = [D3Skill]()
    var passive: [D3Skill] = [D3Skill]()
}


class D3SkillConfiguration: Codable {
    var skill: D3Skill = D3Skill()
    var runes: [Rune]? = nil
    var rune: Rune? = nil
}


class Rune: Codable {
    var slug = ""
    var name = ""
    var type = ""
    var level = 0
    
    var description = ""
    var descriptionHtml = ""
}
