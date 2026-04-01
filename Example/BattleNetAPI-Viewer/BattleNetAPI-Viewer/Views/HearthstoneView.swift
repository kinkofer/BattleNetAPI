//
//  HearthstoneView.swift
//  BattleNetAPI-Example
//
//  Created by Christopher Jennewein on 3/25/26.
//

import BattleNetAPI
import SwiftUI


struct HearthstoneView: View {
    @Environment(BattleNetAPI.self) private var battleNetAPI
    @State private var alertType: AlertType?

    @State private var apiSelection: API?
    @State private var loadingAPI: API?
    @State private var webServiceData: Data = Data()

    let apiType: APIType

    let title = "Hearthstone API"



    // MARK: - Views

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
            if apiType == .gameData {
                gameDataSection
            }
        }
        .apiListStyle()
    }


    var gameDataSection: some View {
        Group {
            Section(header: Text(HearthstoneView.APISection.cards.rawValue)) {
                webServiceRow(api: .searchCards) {
                    let queries = [
                        "gameMode": "constructed",
                        "orderby": "manaCost",
                        "_page": "1"
                    ]
                    return try await battleNetAPI.hearthstone.searchCards(queries: queries)
                }
                webServiceRow(api: .card) {
                    // TODO: Replace with a real card ID or slug
                    try await battleNetAPI.hearthstone.getCard(idOrSlug: "52119-arch-villain-rafaam")
                }
            }

            Section(header: Text(HearthstoneView.APISection.cardBacks.rawValue)) {
                webServiceRow(api: .searchCardBacks) {
                    let queries = [
                        "cardBackCategory": "base",
                        "orderby": "id",
                        "_page": "1"
                    ]
                    return try await battleNetAPI.hearthstone.searchCardBacks(queries: queries)
                }
                webServiceRow(api: .cardBack) {
                    // TODO: Replace with a real card back ID or slug
                    try await battleNetAPI.hearthstone.getCardBack(idOrSlug: "0-classic")
                }
            }

            Section(header: Text(HearthstoneView.APISection.deck.rawValue)) {
                webServiceRow(api: .deck) {
                    // TODO: Replace with a real deck code
                    let queries = ["code": "AAECAQcG+wSRBccIyQjdCcMKDh9uwKcDuAOfBIAFogXFBdIHhwjA+gOGgwSXgwQA"]
                    return try await battleNetAPI.hearthstone.getDeck(queries: queries)
                }
            }

            Section(header: Text(HearthstoneView.APISection.metadata.rawValue)) {
                webServiceRow(api: .metadata) {
                    try await battleNetAPI.hearthstone.getMetadata()
                }
                webServiceRow(api: .metadataByType) {
                    // TODO: Replace with desired metadata type (sets, setGroups, types, rarities, classes, minionTypes, keywords, etc.)
                    try await battleNetAPI.hearthstone.getMetadata(type: "sets")
                }
            }
        }
    }


    func webServiceRow(api: API, webService: @escaping () async throws -> Data) -> some View {
        WebServiceRow(api: api, loadingAPI: $loadingAPI, webService: webService) { data in
            webServiceData = data
            apiSelection = api
        } onError: { error in
            alertType = .error(error)
        }
    }



    // MARK: - Web Services


}



// MARK: - Alert

extension HearthstoneView {
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



// MARK: - API

extension HearthstoneView {
    enum API: String, CaseIterable, Hashable, Identifiable {
        // Game Data APIs
        // Cards API
        case searchCards
        case card
        // Card Backs API
        case searchCardBacks
        case cardBack
        // Deck API
        case deck
        // Metadata API
        case metadata
        case metadataByType


        var id: String { return rawValue }
    }


    enum APISection: String {
        // Game Data
        case cards = "Cards API"
        case cardBacks = "Card Backs API"
        case deck = "Deck API"
        case metadata = "Metadata API"
    }
}



#Preview {
    HearthstoneView(apiType: .gameData)
}
