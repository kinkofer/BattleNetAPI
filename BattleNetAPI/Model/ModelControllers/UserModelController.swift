//
//  UserModelController.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class UserModelController {
    static let shared = UserModelController()
    private init() { }
    
    
    func getUser(region: APIRegion = .us, completion: @escaping (_ result: Result<User>) -> Void) {
        BattleNetAPI.user.getUserInfo(region: region) { result in
            result.decode(completion: completion)
        }
    }
}
