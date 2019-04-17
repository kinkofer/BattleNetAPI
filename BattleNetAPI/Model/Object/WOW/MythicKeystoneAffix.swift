//
//  MythicKeystone.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/12/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import Foundation


class KeystoneAffixIndex: Codable {
    let _links: SelfLink<KeystoneAffixIndex>
    let affixes: [KeyLink<KeystoneAffix>]
}


class KeystoneAffix: Codable {
    let _links: SelfLink<KeystoneAffix>
    let id: Int
    let name: String
    let description: String
    let media: MediaLink
}


/// - note: Property of class that contains camelCase and snake_case keys
class KeystoneAffixSummary: Codable {
    let keystoneAffix: KeyLink<KeystoneAffix>
    let startingLevel: Int
    
    enum CodingKeys: String, CodingKey {
        case keystoneAffix = "keystone_affix"
        case startingLevel = "starting_level"
    }
}
