//
//  WOWClass.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/18/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public class WOWClassIndex: Codable {
    public let _links: SelfLink<WOWClassIndex>
    public let classes: [KeyLink<WOWClass>]
}


public class WOWClass: Codable, SelfDecodable {
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



public class GenderName: Codable {
    public let male: String
    public let female: String
}


public class GenderName2: Codable, SelfDecodable {
    public let maleName: String
    public let femaleName: String
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}



// MARK: - public class Data Resource

public class WOWCharacterClassIndex: Codable {
    public let classes: [WOWCharacterClass]
}


public class WOWCharacterClass: Codable {
    public let id: Int
    public let mask: Int
    public let powerType: String
    public let name: String
}
