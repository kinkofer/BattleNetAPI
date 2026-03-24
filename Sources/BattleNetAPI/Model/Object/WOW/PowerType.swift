//
//  PowerType.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/14/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import Foundation


public struct PowerTypeIndex: Codable, SelfDecodable {
    public let _links: SelfLink<PowerTypeIndex>
    public let powerTypes: [KeyLink<PowerType>]
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


public struct PowerType: Codable {
    public let _links: SelfLink<PowerType>
    public let id: Int
    public let name: String
}
