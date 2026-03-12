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
    
    @State private var apiSelection: API?
    @State private var webServiceData: Data = Data()
    
    let apiType: APIType
    
    let title = "BattleNet API"
    
    
    var body: some View {
        apiList
            .navigationTitle(Text(title))
            .navigationDestination(item: $apiSelection) { api in
                WebServiceView(title: api.rawValue, data: webServiceData)
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
                Button(API.userInfo.rawValue) {
                    battleNetAPI.user.getUserInfo(completion: { parseResult($0, for: .userInfo) })
                }
            }
        }
        .listStyle(SidebarListStyle())
    }
    
    
    
    // MARK: - Web Services
    
    /// Parses a web service result, preparing to navigate to WebServiceView is success, or showing an error if failure.
    func parseResult(_ result: Result<Data, Error>, for selection: API) {
        switch result {
        case .success(let data):
            webServiceData = data
            apiSelection = selection
        case .failure(let error):
            alertType = .error(error)
        }
    }
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
