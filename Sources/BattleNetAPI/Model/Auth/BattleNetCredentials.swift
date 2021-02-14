//
//  BattleNetCredentials.swift
//  BattleNetAPI
//
//  Created by Chris Jennewein on 10/24/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


/// A class to hold the credentials and tokens that are required to use the BattleNet API.
public class BattleNetCredentials {
    /// The clientID of your application, provided by Blizzard
    public let clientID: String
    /// The clientSecret of your application, provided by Blizzard
    public let clientSecret: String
    
    /// The token required to access game data web services
    public var clientAccessToken: String?
    /// The token required to access community and profile web services
    public var userAccessToken: String?
    
    var encryptedCredentials: String? {
        guard !clientID.isEmpty,
            !clientSecret.isEmpty else {
                return nil
        }
        
        let credentials = String(format: "%@:%@", clientID, clientSecret)
        return credentials.data(using: .utf8)?.base64EncodedString()
    }
    
    
    // MARK: - Init
    
    public init(clientID: String, clientSecret: String, clientAccessToken: String? = nil, userAccessToken: String? = nil) {
        self.clientID = clientID
        self.clientSecret = clientSecret
        self.clientAccessToken = clientAccessToken
        self.userAccessToken = userAccessToken
    }
}
