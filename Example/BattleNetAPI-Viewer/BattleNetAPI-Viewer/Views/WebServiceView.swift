//
//  WebServiceView.swift
//  BattleNetAPI-Example
//
//  Created by Christopher Jennewein on 2/10/21.
//

import SwiftUI

struct WebServiceView: View {
    var title: String
    var data: Data
    
    @State private var text: String = ""
    
    
    
    // MARK: - Views
    
    var body: some View {
        TextEditor(text: $text)
            .navigationTitle(Text(title))
            .onAppear {
                text = (try? data.jsonPrettyPrinted()) ?? "The response could not be parsed, please try again."
            }
            .onDisappear {
                text = ""
            }
    }
}



// MARK: - Preview

struct WebServiceView_Previews: PreviewProvider {
    static var previews: some View {
        let string = "Test web service response string"
        let data = string.data(using: .utf8)!
        NavigationView {
            WebServiceView(title: "Test Web Service", data: data)
        }
    }
}
