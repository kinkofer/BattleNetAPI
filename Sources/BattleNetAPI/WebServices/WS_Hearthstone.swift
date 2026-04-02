//
//  WS_Hearthstone.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 3/25/26.
//  Copyright © 2026 Prismatic Games. All rights reserved.
//

import Foundation


public struct WS_Hearthstone: WebService {
    public enum API: APICall {
        // Game Data APIs

        // Cards API
        case searchCards([String: String]?)
        case card(String)

        // Card Backs API
        case searchCardBacks([String: String]?)
        case cardBack(String)

        // Deck API
        case deck([String: String]?)

        // Metadata API
        case metadata
        case metadataByType(String)


        var path: String {
            switch self {
            case .searchCards:
                return "/hearthstone/cards"
            case .card(let idOrSlug):
                return "/hearthstone/cards/\(idOrSlug)"

            case .searchCardBacks:
                return "/hearthstone/cardbacks"
            case .cardBack(let idOrSlug):
                return "/hearthstone/cardbacks/\(idOrSlug)"

            case .deck:
                return "/hearthstone/deck"

            case .metadata:
                return "/hearthstone/metadata"
            case .metadataByType(let type):
                return "/hearthstone/metadata/\(type)"
            }
        }


        var apiType: APIType? {
            return .gameData
        }


        var basePath: String? {
            return nil
        }


        var queries: [String: String]? {
            switch self {
            case .searchCards(let queries), .searchCardBacks(let queries), .deck(let queries):
                return queries
            default:
                return nil
            }
        }
    }


    var region: APIRegion
    var locale: APILocale?

    var session: URLSession

    var baseURL: URL? { return URL(string: region.apiURI) }

    var authenticationService: AuthenticationWebService?


    // MARK: - Game Data API

    // MARK: Cards API

    /**
     Returns an optionally filtered, paginated index of all cards.

     - parameter queries: Optional search/filter parameters (e.g. set, class, manaCost, attack, health, collectible, rarity, type, minionType, keyword, textFilter, gameMode, spellSchool, page, pageSize, sort, order).
     - parameter namespace: The namespace to use to locate this document.
     */
    public func searchCards(queries: [String: String]? = nil, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.searchCards(queries), namespace: namespace)
    }


    /**
     Returns the card with an ID or slug that matches the one you specify.

     - parameter idOrSlug: The slug or ID of the card.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCard(idOrSlug: String, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.card(idOrSlug), namespace: namespace)
    }



    // MARK: Card Backs API

    /**
     Returns an optionally filtered, paginated index of all card backs.

     - parameter queries: Optional search/filter parameters (e.g. cardBackCategory, textFilter, sort, order, page, pageSize).
     - parameter namespace: The namespace to use to locate this document.
     */
    public func searchCardBacks(queries: [String: String]? = nil, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.searchCardBacks(queries), namespace: namespace)
    }


    /**
     Returns a specific card back by its ID or slug.

     - parameter idOrSlug: The slug or ID of the card back.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCardBack(idOrSlug: String, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.cardBack(idOrSlug), namespace: namespace)
    }



    // MARK: Deck API

    /**
     Finds a deck by its deck code.

     - parameter queries: Query parameters including the deck code (e.g. ["code": "AAECAQcG..."]).
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getDeck(queries: [String: String], namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.deck(queries), namespace: namespace)
    }



    // MARK: Metadata API

    /**
     Returns information about the sets, classes, rarities, types, and keywords
     that are available in the game.

     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMetadata(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.metadata, namespace: namespace)
    }


    /**
     Returns information about just one type of metadata.

     - parameter type: The type of the metadata to retrieve (e.g. "sets", "setGroups", "types", "rarities", "classes", "minionTypes", "keywords", "filterableFields", "numericFields", "gameMode", "spellSchools").
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMetadata(type: String, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.metadataByType(type), namespace: namespace)
    }
}
