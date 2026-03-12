//
//  WOWClass.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/18/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct WOWClassIndex: Codable {
    public let _links: SelfLink<WOWClassIndex>
    public let classes: [KeyLink<WOWClass>]
}


public struct WOWClass: Codable, SelfDecodable {
    public let _links: SelfLink<WOWClass>
    public let id: Int
    public let name: String
    public let genderName: GenderName
    public let powerType: KeyLink<PowerType>
    public let specializations: [KeyLink<Specialization>]
    public let media: MediaLink
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}



public struct GenderName: Codable {
    public let male: String
    public let female: String
}



// MARK: - public struct Data Resource

public struct WOWCharacterClassIndex: Codable {
    public let classes: [WOWCharacterClass]
}


public struct WOWCharacterClass: Codable {
    public let id: Int
    public let mask: Int
    public let powerType: String
    public let name: String
}
