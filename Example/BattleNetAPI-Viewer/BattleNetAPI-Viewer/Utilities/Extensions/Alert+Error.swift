//
//  ErrorView.swift
//  iOS
//
//  Created by Christopher Jennewein on 2/10/21.
//

import BattleNetAPI
import Foundation


extension Error {
    var detailedDescription: String {
        var message = localizedDescription
        
        #if DEBUG
        if let httpError = self as? HTTPError,
           case let .serverResponse(_, data) = httpError,
           let errorData = data {
            message.append("\n\((try? errorData.jsonPrettyPrinted()) ?? "")")
        }
        #endif
        
        return message
    }
}
