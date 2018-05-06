//
//  Locale.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/13/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class LocaleString: Codable {
    var de_DE: String? = nil
    var en_US: String? = nil
    var en_GB: String? = nil
    var es_ES: String? = nil
    var es_MX: String? = nil
    var fr_FR: String? = nil
    var it_IT: String? = nil
    var ko_KR: String? = nil
    var pl_PL: String? = nil
    var pt_BR: String? = nil
    var pt_PT: String? = nil
    var ru_RU: String? = nil
    var zh_CN: String? = nil
    var zh_TW: String? = nil
    
    
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
