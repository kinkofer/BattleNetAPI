//
//  API_Enums.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 6/2/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import Foundation


/// The type of data being retrieved from the web services. Raw data used in web service urls, and used to determine if client or user authorization is required.
public enum APIType: String {
    case gameData = "data"
    case profile
    case community
    
    public var displayName: String {
        switch self {
        case .gameData: return "Game Data APIs"
        case .profile: return "Profile APIs"
        case .community: return "Community APIs"
        }
    }
}



public enum APINamespace {
    case `static`
    case staticClassic
    case dynamic
    case dynamicClassic
    case profile
    case profileClassic
    case custom(String)

    func getHeader(for region: APIRegion) -> HTTPHeader {
        switch self {
        case .static:
            return .namespace("static" + region.namespaceExtension)
        case .staticClassic:
            return .namespace("static-classic" + region.namespaceExtension)
        case .dynamic:
            return .namespace("dynamic" + region.namespaceExtension)
        case .dynamicClassic:
            return .namespace("dynamic-classic" + region.namespaceExtension)
        case .profile:
            return .namespace("profile" + region.namespaceExtension)
        case .profileClassic:
            return .namespace("profile-classic1x" + region.namespaceExtension)
        case .custom(let namespace):
            return .namespace(namespace)
        }
    }
}



/// The supported regions for the API services
public enum APIRegion: String, CaseIterable, Codable {
    /// China
    case cn
    /// Europe
    case eu
    /// Korea
    case kr
    /// Taiwan
    case tw
    /// North America
    case us
    
    /// The base url of the authorization service
    var oauthURI: String {
        switch self {
        case .us, .eu:
            return "https://\(self.rawValue).battle.net/oauth"
        case .kr, .tw:
            return "https://apac.battle.net/oauth"
        case .cn:
            return "https://www.battlenet.com.cn/oauth"
        }
    }
    
    /// The base url of the token service
    var tokenURI: String {
        switch self {
        case .us, .eu:
            return "https://\(self.rawValue).battle.net/oauth/token"
        case .kr, .tw:
            return "https://apac.battle.net/oauth/authorize"
        case .cn:
            return "https://www.battlenet.com.cn/oauth/token"
        }
    }
    
    /// The base url of the API services
    var apiURI: String {
        switch self {
        case .cn:
            return "https://gateway.battlenet.com.cn"
        default:
            return "https://\(self.rawValue).api.blizzard.com"
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
    
    
    /// The id associated with the region.
    var id: Int {
        switch self {
        case .us: return 1
        case .eu: return 2
        case .kr, .tw: return 3
        case .cn: return 5
        }
    }
    
    
    /// The display name of the region
    public var displayName: String {
        switch self {
        case .us: return "North America"
        case .eu: return "Europe"
        case .kr: return "Korea"
        case .tw: return "Taiwan"
        case .cn: return "China"
        }
    }
    
    
    /// The available locales for a region
    public var supportedLocales: [APILocale] {
        switch self {
        case .us:
            return [.en_US, .es_MX, .pt_BR]
        case .eu:
            return [.en_GB, .es_ES, .fr_FR, .ru_RU, .de_DE, .pt_PT, .it_IT]
        case .kr:
            return [.ko_KR]
        case .tw:
            return [.zh_TW]
        case .cn:
            return [.zh_CN]
        }
    }
    
    
    /// The url to validate a token
    func getCheckTokenURI(token: String) -> String {
        switch self {
        case .us, .eu:
            return "https://\(self.rawValue).battle.net/oauth/check_token?token=\(token)"
        case .kr, .tw:
            return "https://apac.battle.net/oauth/check_token?token=\(token)"
        case .cn:
            return "https://www.battlenet.com.cn/oauth/check_token?token=\(token)"
        }
    }
}



/// The locale is used to retrieve values in the specified language
public enum APILocale: String {
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
    
    
    /// The language name most closely associated with the locale
    public var language: String {
        switch self {
        case .de_DE: return "Deutsch"
        case .en_US: return "English (US)"
        case .en_GB: return "English (EU)"
        case .es_ES: return "Español (EU)"
        case .es_MX: return "Español (Latino)"
        case .fr_FR: return "Français"
        case .it_IT: return "Italiano"
        case .ko_KR: return "한국어"
        case .pt_BR: return "Português (Brasil)"
        case .pt_PT: return "Português (EU)"
        case .ru_RU: return "Русский"
        case .zh_CN: return "中文"
        case .zh_TW: return "繁體中文"
        }
    }
    
    
    /// The flag emoji most closely associated with the locale
    public var flag: String {
        switch self {
        case .de_DE: return "🇩🇪"
        case .en_US: return "🇺🇸"
        case .en_GB: return "🇬🇧"
        case .es_ES: return "🇪🇸"
        case .es_MX: return "🇲🇽"
        case .fr_FR: return "🇫🇷"
        case .it_IT: return "🇮🇹"
        case .ko_KR: return "🇰🇷"
        case .pt_BR: return "🇧🇷"
        case .pt_PT: return "🇵🇹"
        case .ru_RU: return "🇷🇺"
        case .zh_CN: return "🇨🇳"
        case .zh_TW: return "🇹🇼"
        }
    }
}
