//
//  Media.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/19/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public class MediaLink: Codable {
    public let key: Link<Media>
    public let id: Int
}



public class Media: Codable {
    public let _links: SelfLink<Media>
    public let assets: [MediaAsset]
}



public class MediaAsset: Codable {
    public let key: String
    public let value: String
}
