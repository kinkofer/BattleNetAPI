//
//  GeneralTypes.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 3/12/26.
//

import Foundation


public struct EnumType: Codable {
    public let type: String
    public let name: String?
}


public struct EnumSlug: Codable {
    public let slug: String
    public let name: String?
}


public struct Quantity: Codable {
    public let value: Int
}


public struct ValueForDisplay: Codable, SelfDecodable {
    public let value: Double
    public let displayString: String

    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
