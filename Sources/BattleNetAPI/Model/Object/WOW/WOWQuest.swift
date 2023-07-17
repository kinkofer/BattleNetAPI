//
//  WOWQuest.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/23/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct WOWQuest: Codable {
    public let id: Int
    public let title: String
    public let reqLevel: Int
    public let suggestedPartyMembers: Int
    public let category: String
    public let level: Int
}
