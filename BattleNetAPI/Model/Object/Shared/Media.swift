//
//  Media.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/19/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class MediaLink: Codable {
    let key: Link<Media>
    let id: Int
}



class Media: Codable {
    let _links: SelfLink<Media>
    let assets: [MediaAsset]
}



class MediaAsset: Codable {
    let key: String
    let value: String
}
