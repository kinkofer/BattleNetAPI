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



public struct Media: Codable {
    public let _links: SelfLink<Media>
    public let assets: [MediaAsset]
}



public struct MediaAsset: Codable {
    public let key: String
    public let value: String
}
