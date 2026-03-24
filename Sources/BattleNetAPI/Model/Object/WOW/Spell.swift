//
//  Spell.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/23/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct Spell: Codable {
    public let _links: SelfLink<Spell>?
    public let id: Int
    public let name: String
    public let description: String
    public let media: MediaLink
}
