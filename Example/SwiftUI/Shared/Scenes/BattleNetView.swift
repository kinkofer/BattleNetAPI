//
//  BattleNetView.swift
//  BattleNetAPI-Example
//
//  Created by Christopher Jennewein on 2/9/21.
//

import BattleNetAPI
import SwiftUI


struct BattleNetView: View {
    @EnvironmentObject var battleNetAPI: BattleNetAPI
    @State var alertType: AlertType?
    
    @State var apiSelection: API?
    @State var webServiceData: Data = Data()
    
    let apiType: APIType
    
    let title = "BattleNet API"
    
    
    var body: some View {
        apiList
            .navigationTitle(Text(title))
            .alert(item: $alertType) {
                alert(for: $0)
            }
    }
    
    
    var apiList: some View {
        List {
            Section(header: Text(APIType.profile.displayName)) {
                webServiceRow(api: .userInfo) {
                    battleNetAPI.user.getUserInfo(completion: { parseResult($0, for: .userInfo) })
                }
            }
        }
        .listStyle(SidebarListStyle())
    }
    
    
    func webServiceRow(api: API, webService: @escaping () -> Void) -> some View {
        let selectionBinding: Binding<API?> = Binding(
            get: { return apiSelection },
            set: { newValue in
                guard newValue != nil else { self.apiSelection = nil; return }
                webService()
            }
        )
        return NavigationLink(destination: WebServiceView(title: api.rawValue, data: webServiceData), tag: api, selection: selectionBinding) {
            Text(api.rawValue)
        }
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
    enum AlertType: Identifiable {
        case error(Error)
        case notify(String)
        
        
        var id: String {
            switch self {
            case .error: return "error"
            case .notify: return "notify"
            }
        }
        
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
    
    private func alert(for alertType: AlertType) -> Alert {
        switch alertType {
        case .error(let error):
            return Alert(error: error)
        case .notify:
            return Alert(title: Text(alertType.title))
        }
    }
}



extension BattleNetView {
    enum API: String, CaseIterable, Hashable, Identifiable {
        case userInfo = "User Info"
        
        var id: String { return rawValue }
    }
}



struct BattleNetView_Previews: PreviewProvider {
    static var previews: some View {
        BattleNetView(apiType: .profile)
    }
}
