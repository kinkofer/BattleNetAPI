//
//  D3Class.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/10/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class D3Class: Codable {
    var slug = ""
    var name = ""
    var maleName = ""
    var femaleName = ""
    var icon = ""
    
    var skillCategories = [D3SkillCategory]()
    var skills = D3SkillSet()
}
