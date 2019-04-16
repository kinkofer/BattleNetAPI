//
//  PowerType.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/14/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import Foundation


class PowerTypeIndex: Codable, SelfDecodable {
    let _links: SelfLink<PowerTypeIndex>
    let powerTypes: [KeyLink<PowerType>]
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


class PowerType: Codable {
    let _links: SelfLink<PowerType>
    let id: Int
    let name: String
}
