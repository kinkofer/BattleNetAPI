//
//  ErrorView.swift
//  iOS
//
//  Created by Christopher Jennewein on 2/10/21.
//

import SwiftUI


extension Alert {
    init(error: Error, title: String = "Error") {
        self = Alert(title: Text(title), message: Text(error.localizedDescription), dismissButton: .default(Text("OK")))
    }
}
