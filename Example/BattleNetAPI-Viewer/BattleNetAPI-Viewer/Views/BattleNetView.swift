//
//  BattleNetView.swift
//  BattleNetAPI-Example
//
//  Created by Christopher Jennewein on 2/9/21.
//

import BattleNetAPI
import SwiftUI


struct BattleNetView: View {
    @Environment(BattleNetAPI.self) private var battleNetAPI
    @State private var alertType: AlertType?
    
    @State private var selection: WebServiceSelection<API>?
    @State private var loadingAPI: API?
    
    let apiType: APIType
    
    let title = "BattleNet API"
    
    
    var body: some View {
        apiList
            .navigationTitle(Text(title))
            .navigationDestination(item: $selection) { selection in
                WebServiceView(title: selection.api.rawValue, data: selection.data)
            }
            .alert(alertType?.title ?? "", isPresented: showingAlert, presenting: alertType) { _ in
                Button("OK", role: .cancel) { }
            } message: { alertType in
                if let message = alertType.message {
                    Text(message)
                }
            }
    }
    
    
    var apiList: some View {
        List {
            Section(header: Text(APIType.profile.displayName)) {
                webServiceRow(api: .userInfo) {
                    try await battleNetAPI.user.getUserInfo()
                }
            }
        }
        .apiListStyle()
    }
    
    
    func webServiceRow(api: API, webService: @escaping () async throws -> Data) -> some View {
        WebServiceRow(api: api, loadingAPI: $loadingAPI, webService: webService) { data in
            selection = WebServiceSelection(api: api, data: data)
        } onError: { error in
            alertType = .error(error)
        }
    }
    
    
    
    // MARK: - Web Services
    

}



// MARK: - Alert

extension BattleNetView {
    enum AlertType {
        case error(Error)
        case notify(String)
        
        var title: String {
            switch self {
            case .error: return "Error"
            case .notify(let title): return title
            }
        }
        
        var message: String? {
            switch self {
            case .error(let error): return error.localizedDescription
            case .notify: return nil
            }
        }
    }
    
    private var showingAlert: Binding<Bool> {
        Binding(
            get: { alertType != nil },
            set: { if !$0 { alertType = nil } }
        )
    }
}



extension BattleNetView {
    enum API: String, CaseIterable, Hashable, Identifiable {
        case userInfo = "User Info"
        
        var id: String { return rawValue }
    }
}



#Preview {
    NavigationStack {
        BattleNetView(apiType: .profile)
    }
}
