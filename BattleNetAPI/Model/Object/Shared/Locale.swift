//
//  Locale.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/13/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class LocaleString: Codable {
    let de_DE: String?
    let en_US: String?
    let en_GB: String?
    let es_ES: String?
    let es_MX: String?
    let fr_FR: String?
    let it_IT: String?
    let ko_KR: String?
    let pl_PL: String?
    let pt_BR: String?
    let pt_PT: String?
    let ru_RU: String?
    let zh_CN: String?
    let zh_TW: String?
    
    
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
