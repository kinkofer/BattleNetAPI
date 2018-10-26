//
//  BattleNetAPI.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/6/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


/// The supported regions for the API services
enum APIRegion: String {
    /// China
    case cn
    /// Europe
    case eu
    /// Korea
    case kr
    /// South East Asia
    /// - note: Only has endpoints for SC2 game data and OAuth profiles
    case sea
    /// Taiwan
    case tw
    /// United States
    case us
    
    /// The base url of the authorization service
    var authorizeURI: String {
        switch self {
        case .us, .eu:
            return "https://\(self.rawValue).battle.net/oauth/authorize"
        case .kr, .tw:
            return "https://apac.battle.net/oauth/authorize"
        case .sea:
            return "https://us.battle.net/oauth/authorize"
        case .cn:
            return "https://www.battlenet.com.cn/oauth/authorize"
        }
    }
    
    /// The base url of the token service
    var tokenURI: String {
        switch self {
        case .us, .eu:
            return "https://\(self.rawValue).battle.net/oauth/token"
        case .kr, .tw:
            return "https://apac.battle.net/oauth/authorize"
        case .sea:
            return "https://us.battle.net/oauth/authorize"
        case .cn:
            return "https://www.battlenet.com.cn/oauth/token"
        }
    }
    
    /// The url to validate a token
    var checkTokenURI: String {
        switch self {
        case .us, .eu:
            return "https://\(self.rawValue).battle.net/oauth/check_token"
        case .kr, .tw:
            return "https://apac.battle.net/oauth/authorize"
        case .sea:
            return "https://us.battle.net/oauth/authorize"
        case .cn:
            return "https://www.battlenet.com.cn/oauth/check_token"
        }
    }
    
    /// The base url of the API services
    var apiURI: String {
        switch self {
        case .cn:
            return "https://www.battlenet.com.cn"
        default:
            return "https://\(self.rawValue).api.battle.net"
        }
    }
    
    /// The regional extension added to the "namespace" URL parameter
    var namespaceExtension: String {
        switch self {
        case .us, .eu, .kr, .tw:
            return "-\(self.rawValue)"
        default:
            return ""
        }
    }
}



/// The type of data being retrieved from the web services. Raw data used in web service urls, and used to determine if client or user authorization is required.
enum APIType: String {
    case gameData = "data"
    case profile
}


/// The locale is used to retrieve values in the specified language
enum APILocale: String {
    case de_DE
    case en_US
    case en_GB
    case es_ES
    case es_MX
    case fr_FR
    case it_IT
    case ko_KR
    case pt_BR
    case pt_PT
    case ru_RU
    case zh_CN
    case zh_TW
}


/// This class is an interface to all the web services, with separate properties for accessing authentication, user, and specific game web services. It further makes a distinction between legacy services that only require an app key, and are expected to be deprecated in the near future.
class BattleNetAPI {
    /// Authenication web services
    public static let authentication = WS_Authentication()
    /// Legacy authenication web services
    public static let authenticationLegacy = WS_AuthenticationLegacy()
    /// User web services
    public static let user = WS_User()
    
    /// World of Warcraft web services
    public static let wow = WS_WorldOfWarcraft()
    /// Legacy World of Warcraft web services
    public static let wowLegacy = WS_WorldOfWarcraftLegacy()
    /// StarCraft 2 web services
    public static let sc2 = WS_StarCraft2()
    /// Legacy StarCraft 2 web services
    public static let sc2Legacy = WS_StarCraft2Legacy()
    /// Diablo 3 web services
    public static let d3 = WS_Diablo3()
    /// Legacy Diablo 3 web services
    public static let d3Legacy = WS_Diablo3Legacy()
}
