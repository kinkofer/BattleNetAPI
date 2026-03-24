//
//  Locale.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/13/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct LocaleString: Codable {
    public let de_DE: String?
    public let en_US: String?
    public let en_GB: String?
    public let es_ES: String?
    public let es_MX: String?
    public let fr_FR: String?
    public let it_IT: String?
    public let ko_KR: String?
    public let pl_PL: String?
    public let pt_BR: String?
    public let pt_PT: String?
    public let ru_RU: String?
    public let zh_CN: String?
    public let zh_TW: String?
    
    
    enum CodingKeys: String, CodingKey {
        case de_DE = "de_DE"
        case en_US = "en_US"
        case en_GB = "en_GB"
        case es_ES = "es_ES"
        case es_MX = "es_MX"
        case fr_FR = "fr_FR"
        case it_IT = "it_IT"
        case ko_KR = "ko_KR"
        case pl_PL = "pl_PL"
        case pt_BR = "pt_BR"
        case pt_PT = "pt_PT"
        case ru_RU = "ru_RU"
        case zh_CN = "zh_CN"
        case zh_TW = "zh_TW"
    }
}
