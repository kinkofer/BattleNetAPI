//
//  WOWQuest.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/23/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class WOWQuest: Codable {
    var id: Int = 0
    var title: String = ""
    var reqLevel: Int = 0
    var suggestedPartyMembers: Int = 0
    var category: String = ""
    var level: Int = 0
}
