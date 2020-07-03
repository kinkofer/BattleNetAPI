//
//  UserModelController.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct UserModelController {
    let battleNetAPI: BattleNetAPI
    
    var region: APIRegion
    var locale: APILocale?
    
    public init(region: APIRegion, locale: APILocale?) {
        self.battleNetAPI = BattleNetAPI(region: .us, locale: .en_US)
        self.region = region
        self.locale = locale
    }
    
    
    public func getUser(completion: @escaping (_ result: Result<User, HTTPError>) -> Void) {
        battleNetAPI.user.getUserInfo() { result in
            result.decode(completion: completion)
        }
    }
}
