//
//  ResourceLink.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/13/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public protocol ResourceLinkable {
    associatedtype Resource
    
    var link: Link<Resource> { get }
}


public struct SelfLink<Resource>: Codable, ResourceLinkable {
    public let link: Link<Resource>
    
    enum CodingKeys: String, CodingKey {
        case link = "self"
    }
}



public struct KeyLink<Resource>: Codable, ResourceLinkable {
    public let key: Link<Resource>
    public let id: Int?
    public let name: String?
    
    public var link: Link<Resource> { return key }
}



public struct Link<Resouce>: Codable {
    public let href: String
}
