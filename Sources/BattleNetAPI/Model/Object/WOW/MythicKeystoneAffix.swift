//
//  MythicKeystone.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/12/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import Foundation


public struct KeystoneAffixIndex: Codable {
    public let _links: SelfLink<KeystoneAffixIndex>
    public let affixes: [KeyLink<KeystoneAffix>]
}


public struct KeystoneAffix: Codable {
    public let _links: SelfLink<KeystoneAffix>
    public let id: Int
    public let name: String
    public let description: String
    public let media: MediaLink
}


/// - note: Property of struct that contains camelCase and snake_case keys
public struct KeystoneAffixSummary: Codable {
    public let keystoneAffix: KeyLink<KeystoneAffix>
    public let startingLevel: Int
    
    enum CodingKeys: String, CodingKey {
        case keystoneAffix = "keystone_affix"
        case startingLevel = "starting_level"
    }
}
