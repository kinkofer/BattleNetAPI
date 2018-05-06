//
//  ResourceLink.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/13/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class SelfLink<Resource>: Codable {
    var `self`: Link<Resource> = Link<Resource>()
}



class Link<Resouce>: Codable {
    var href: String = ""
}
