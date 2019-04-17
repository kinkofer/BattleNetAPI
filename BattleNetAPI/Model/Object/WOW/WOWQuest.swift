//
//  WOWQuest.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/23/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class WOWQuest: Codable {
    let id: Int
    let title: String
    let reqLevel: Int
    let suggestedPartyMembers: Int
    let category: String
    let level: Int
}
