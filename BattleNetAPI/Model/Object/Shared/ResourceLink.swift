//
//  ResourceLink.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/13/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public class SelfLink<Resource>: Codable {
    public let link: Link<Resource>
    
    enum CodingKeys: String, CodingKey {
        case link = "self"
    }
}



public class KeyLink<Resource>: Codable {
    public let key: Link<Resource>
    public let id: Int?
    public let name: String?
}



public class Link<Resouce>: Codable {
    public let href: String
}
