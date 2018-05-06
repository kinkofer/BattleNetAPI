//
//  SC2Achievement.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/12/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class SC2AchievementIndex: Codable {
    var achievements = [SC2Achievement]()
    var categories = [SC2AchievementCategory]()
}

class SC2Achievement: Codable {
    var title = ""
    var description = ""
    var achievementId: Double = 0
    var categoryId = 0
    var points = 0
    var icon = Image()
}



class SC2AchievementCategory: Codable {
    var title = ""
    var categoryId = 0
    var featuredAchievementId: Double = 0
    var children: [SC2AchievementCategory]? = nil
}
