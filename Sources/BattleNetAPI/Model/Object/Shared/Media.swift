//
//  Media.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/19/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct MediaLink: Codable {
    public let key: Link<Media>
    public let id: Int
}



public struct Media: Codable, SelfDecodable {
    public let _links: SelfLink<Media>
    public let assets: [MediaAsset]
    public let id: Int?

    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}



public struct MediaAsset: Codable {
    public let key: String
    public let value: String
    public let fileDataId: Int?
}
