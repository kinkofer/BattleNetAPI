//
//  D3Class.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/10/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct D3Class: Codable {
    public let slug: String
    public let name: String
    public let maleName: String
    public let femaleName: String
    public let icon: String
    
    public let skillCategories: [EnumSlug]
    public let skills: D3SkillSet
}
