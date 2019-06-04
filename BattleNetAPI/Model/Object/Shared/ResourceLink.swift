//
//  ResourceLink.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/13/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class SelfLink<Resource>: Codable {
    let link: Link<Resource>
    
    enum CodingKeys: String, CodingKey {
        case link = "self"
    }
}



class KeyLink<Resource>: Codable {
    let key: Link<Resource>
    let id: Int?
    let name: String?
}



class Link<Resouce>: Codable {
    let href: String
}
