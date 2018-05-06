//
//  WOWClass.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/18/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class WOWClassIndex: Codable {
    var _links: SelfLink<WOWClassIndex> = SelfLink<WOWClassIndex>()
    var classes: [WOWClassLink] = [WOWClassLink]()
}



class WOWClassLink: Codable {
    var key: Link<WOWClass> = Link<WOWClass>()
    var id: Int = 0
    var name: String = ""
}



class WOWClass: Codable {
    var _links: SelfLink<WOWClass> = SelfLink<WOWClass>()
    var id: Int = 0
    var name: String = ""
    var genderName: GenderName = GenderName()
    var powerType: PowerTypeLink = PowerTypeLink()
    var specializations: [SpecializationLink] = [SpecializationLink]()
    var media: MediaLink = MediaLink()
    
    enum CodingKeys: String, CodingKey {
        case _links
        case id
        case name
        case genderName = "gender_name"
        case powerType = "power_type"
        case specializations
        case media
    }
}



class GenderName: Codable {
    var male: String = ""
    var female: String = ""
}



class PowerTypeLink: Codable {
    var key: Link<PowerType> = Link<PowerType>()
    var id: Int = 0
    var name: String = ""
}



// https://us.api.battle.net/data/wow/power-type/0?namespace=static-7.3.5_25875-us
class PowerType: Codable {
    
}



// MARK: - Legacy

class WOWClassIndexLegacy: Codable {
    var classes: [WOWClassLegacy] = [WOWClassLegacy]()
}

class WOWClassLegacy: Codable {
    var id: Int = 0
    var mask: Int = 0
    var powerType: String = ""
    var name: String = ""
}
