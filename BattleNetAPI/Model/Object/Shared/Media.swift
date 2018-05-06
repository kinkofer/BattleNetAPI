//
//  Media.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/19/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class MediaLink: Codable {
    var key: Link<Media> = Link<Media>()
    var id: Int = 0
}



class Media: Codable {
    var _links: SelfLink<Media> = SelfLink<Media>()
    var assets: [MediaAsset] = [MediaAsset]()
}



class MediaAsset: Codable {
    var key: String = ""
    var value: String = ""
}
