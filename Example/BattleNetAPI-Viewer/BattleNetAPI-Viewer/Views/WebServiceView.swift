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
            .onChange(of: data) {
                text = (try? data.jsonPrettyPrinted()) ?? "The response could not be parsed, please try again."
            }
            .onDisappear {
                text = ""
            }
    }
}



// MARK: - WebServiceRow

struct WebServiceRow<API: RawRepresentable & Hashable>: View where API.RawValue == String {
    let api: API
    var isOperable: Bool = true
    @Binding var loadingAPI: API?
    let webService: () async throws -> Data
    let onSuccess: (Data) -> Void
    let onError: (Error) -> Void
    
    var body: some View {
        Button {
            loadingAPI = api
            Task {
                do {
                    let data = try await webService()
                    onSuccess(data)
                } catch {
                    onError(error)
                }
                loadingAPI = nil
            }
        } label: {
            HStack {
                if !isOperable {
                    Image(systemName: "exclamationmark.triangle")
                }
                Text(api.rawValue)
                if loadingAPI == api {
                    Spacer()
                    ProgressView()
                }
            }
        }
        .buttonStyle(.plain)
        .disabled(loadingAPI != nil)
    }
}



// MARK: - API List Style

extension View {
    func apiListStyle() -> some View {
        #if os(macOS)
        self.listStyle(.inset(alternatesRowBackgrounds: true))
        #else
        self.listStyle(.insetGrouped)
        #endif
    }
}



// MARK: - Preview

#Preview {
    let data = "Test web service response string".data(using: .utf8)!
    NavigationStack {
        WebServiceView(title: "Test Web Service", data: data)
    }
}
