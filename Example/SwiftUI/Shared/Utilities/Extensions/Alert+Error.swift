//
//  ErrorView.swift
//  iOS
//
//  Created by Christopher Jennewein on 2/10/21.
//

import BattleNetAPI
import SwiftUI


extension Alert {
    init(error: Error, title: String = "Error") {
        var message = error.localizedDescription
        
        #if DEBUG
        if let httpError = error as? HTTPError,
           case let .serverResponse(_, data) = httpError,
           let errorData = data {
            message.append("\n\((try? errorData.jsonPrettyPrinted()) ?? "")")
        }
        #endif
        
        self = Alert(title: Text(title), message: Text(message), dismissButton: .default(Text("OK")))
    }
}
