//
//  D3Class.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/10/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class D3Class: Codable {
    let slug: String
    let name: String
    let maleName: String
    let femaleName: String
    let icon: String
    
    let skillCategories: [D3SkillCategory]
    let skills: D3SkillSet
}
