//
//  WOWClass.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/18/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class WOWClassIndex: Codable {
    let _links: SelfLink<WOWClassIndex>
    let classes: [KeyLink<WOWClass>]
}


class WOWClass: Codable, SelfDecodable {
    let _links: SelfLink<WOWClass>
    let id: Int
    let name: String
    let genderName: GenderName
    let powerType: KeyLink<PowerType>
    let specializations: [KeyLink<Specialization>]
    let media: MediaLink
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}



class GenderName: Codable {
    let male: String
    let female: String
}


class GenderName2: Codable, SelfDecodable {
    let maleName: String
    let femaleName: String
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}



// MARK: - Class Data Resource

class WOWCharacterClassIndex: Codable {
    let classes: [WOWCharacterClass]
}


class WOWCharacterClass: Codable {
    let id: Int
    let mask: Int
    let powerType: String
    let name: String
}
