//
//  WS_WorldOfWarcraftClassic.swift
//
//
//  Created by Christopher Jennewein on 2/13/21.
//

import Foundation


public struct WS_WorldOfWarcraftClassic: WebService {
    public enum API: APICall {
        // Game Data APIs
        case auctionHouseIndex(connectedRealmID: Int)
        case auctionHouse(connectedRealmID: Int, auctionHouseID: Int)
        
        case connectedRealmIndex
        case connectedRealm(Int)
        case connectedRealmSearch([String: String]?)
        
        case creatureFamilyIndex
        case creatureFamily(Int)
        case creatureTypeIndex
        case creatureType(Int)
        case creature(Int)
        case creatureSearch([String: String]?)
        case creatureDisplayMedia(Int)
        case creatureFamilyMedia(Int)
        
        case guildCrestIndex
        case guildCrestBorderMedia(Int)
        case guildCrestEmblemMedia(Int)
        
        case itemClassIndex
        case itemClass(Int)
        case itemSubclass(itemClassID: Int, itemSubclassID: Int)
        case item(Int)
        case itemMedia(Int)
        case itemSearch([String: String]?)
        
        case mediaSearch([String: String]?)
        
        case playableClassIndex
        case playableClass(Int)
        case playableClassMedia(Int)
        
        case playableRaceIndex
        case playableRace(Int)
        
        case powerTypeIndex
        case powerType(Int)
        
        case realmIndex
        case realm(String)
        case realmSearch([String: String]?)
        
        case regionIndex
        case region(Int)
        
        case tokenIndex

        case pvpSeasonIndex
        case pvpSeason(Int)

        case pvpRegionIndex
        case pvpRegionSeasonIndex(pvpRegionID: Int)
        case pvpRegionSeason(pvpRegionID: Int, pvpSeasonID: Int)
        case pvpRegionSeasonLeaderboardIndex(pvpRegionID: Int, pvpSeasonID: Int)
        case pvpRegionSeasonLeaderboard(pvpRegionID: Int, pvpSeasonID: Int, pvpBracket: WOWLeaderboardBracket)
        case pvpRegionSeasonRewardIndex(pvpRegionID: Int, pvpSeasonID: Int)

        // Profile APIs
        case accountProfileSummary
        case protectedCharacterProfileSummary(realmID: Int, characterID: Int)

        case characterAchievementsSummary(realmSlug: String, characterName: String)
        case characterAchievementStatistics(realmSlug: String, characterName: String)

        case characterAppearanceSummary(realmSlug: String, characterName: String)

        case characterEquipmentSummary(realmSlug: String, characterName: String)

        case characterHunterPetsSummary(realmSlug: String, characterName: String)

        case characterMediaSummary(realmSlug: String, characterName: String)

        case characterProfileSummary(realmSlug: String, characterName: String)
        case characterProfileStatus(realmSlug: String, characterName: String)

        case characterPvPBracketStatistics(realmSlug: String, characterName: String, pvpBracket: WOWLeaderboardBracket)
        case characterPvPSummary(realmSlug: String, characterName: String)

        case characterSpecializationsSummary(realmSlug: String, characterName: String)

        case characterStatisticsSummary(realmSlug: String, characterName: String)

        case guild(realmSlug: String, guildSlug: String)
        case guildActivity(realmSlug: String, guildSlug: String)
        case guildAchievements(realmSlug: String, guildSlug: String)
        case guildRoster(realmSlug: String, guildSlug: String)


        var path: String {
            switch self {
            // Game Data APIs
            case .auctionHouseIndex(connectedRealmID: let connectedRealmID):
                return "/connected-realm/\(connectedRealmID)/auctions/index"
            case .auctionHouse(connectedRealmID: let connectedRealmID, auctionHouseID: let auctionHouseID):
                return "/connected-realm/\(connectedRealmID)/auctions/\(auctionHouseID)"
                
            case .connectedRealmIndex:
                return "/connected-realm/index"
            case .connectedRealm(let id):
                return "/connected-realm/\(id)"
            case .connectedRealmSearch:
                return "/search/connected-realm"
                
            case .creatureFamilyIndex:
                return "/creature-family/index"
            case .creatureFamily(let id):
                return "/creature-family/\(id)"
            case .creatureTypeIndex:
                return "/creature-type/index"
            case .creatureType(let id):
                return "/creature-type/\(id)"
            case .creature(let id):
                return "/creature/\(id)"
            case .creatureSearch:
                return "/search/creature"
            case .creatureDisplayMedia(let id):
                return "/media/creature-display/\(id)"
            case .creatureFamilyMedia(let id):
                return "/media/creature-family/\(id)"
                
            case .guildCrestIndex:
                return "/guild-crest/index"
            case .guildCrestBorderMedia(let id):
                return "/media/guild-crest/border/\(id)"
            case .guildCrestEmblemMedia(let id):
                return "/media/guild-crest/emblem/\(id)"
                
            case .itemClassIndex:
                return "/item-class/index"
            case .itemClass(let id):
                return "/item-class/\(id)"
            case .itemSubclass(itemClassID: let itemClassID, itemSubclassID: let itemSubclassID):
                return "/item-class/\(itemClassID)/item-subclass/\(itemSubclassID)"
            case .item(let id):
                return "/item/\(id)"
            case .itemMedia(let id):
                return "/media/item/\(id)"
            case .itemSearch:
                return "/search/item"
                
            case .mediaSearch:
                return "/search/media"
                
            case .playableClassIndex:
                return "/playable-class/index"
            case .playableClass(let id):
                return "/playable-class/\(id)"
            case .playableClassMedia(let id):
                return "/media/playable-class/\(id)"
                
            case .playableRaceIndex:
                return "/playable-race/index"
            case .playableRace(let id):
                return "/playable-race/\(id)"
                
            case .powerTypeIndex:
                return "/power-type/index"
            case .powerType(let id):
                return "/power-type/\(id)"
                
            case .realmIndex:
                return "/realm/index"
            case .realm(let slug):
                return "/realm/\(slug)"
            case .realmSearch:
                return "/search/realm"
                
            case .regionIndex:
                return "/region/index"
            case .region(let id):
                return "/region/\(id)"
                
            case .tokenIndex:
                return "/token/index"

            case .pvpSeasonIndex:
                return "/pvp-season/index"
            case .pvpSeason(let id):
                return "/pvp-season/\(id)"
                
            case .pvpRegionIndex:
                return "/pvp-region/index"
            case .pvpRegionSeasonIndex(pvpRegionID: let pvpRegionID):
                return "/pvp-region/\(pvpRegionID)/pvp-season/index"
            case .pvpRegionSeason(pvpRegionID: let pvpRegionID, pvpSeasonID: let pvpSeasonID):
                return "/pvp-region/\(pvpRegionID)/pvp-season/\(pvpSeasonID)"
            case .pvpRegionSeasonLeaderboardIndex(pvpRegionID: let pvpRegionID, pvpSeasonID: let pvpSeasonID):
                return "/pvp-region/\(pvpRegionID)/pvp-season/\(pvpSeasonID)/pvp-leaderboard/index"
            case .pvpRegionSeasonLeaderboard(pvpRegionID: let pvpRegionID, pvpSeasonID: let pvpSeasonID, pvpBracket: let pvpBracket):
                return "/pvp-region/\(pvpRegionID)/pvp-season/\(pvpSeasonID)/pvp-leaderboard/\(pvpBracket.rawValue)"
            case .pvpRegionSeasonRewardIndex(pvpRegionID: let pvpRegionID, pvpSeasonID: let pvpSeasonID):
                return "/pvp-region/\(pvpRegionID)/pvp-season/\(pvpSeasonID)/pvp-reward/index"

            // Profile APIs
            case .accountProfileSummary:
                return ""
            case .protectedCharacterProfileSummary(realmID: let realmID, characterID: let characterID):
                return "/protected-character/\(realmID)-\(characterID)"

            case .characterAchievementsSummary(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/achievements"
            case .characterAchievementStatistics(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/achievements/statistics"

            case .characterAppearanceSummary(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/appearance"

            case .characterEquipmentSummary(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/equipment"

            case .characterHunterPetsSummary(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/hunter-pets"

            case .characterMediaSummary(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/character-media"

            case .characterProfileSummary(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)"
            case .characterProfileStatus(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/status"

            case .characterPvPBracketStatistics(realmSlug: let realmSlug, characterName: let characterName, pvpBracket: let pvpBracket):
                return "/character/\(realmSlug)/\(characterName)/pvp-bracket/\(pvpBracket.rawValue)"
            case .characterPvPSummary(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/pvp-summary"

            case .characterSpecializationsSummary(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/specializations"

            case .characterStatisticsSummary(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/statistics"

            case .guild(realmSlug: let realmSlug, guildSlug: let guildSlug):
                return "/guild/\(realmSlug)/\(guildSlug)"
            case .guildActivity(realmSlug: let realmSlug, guildSlug: let guildSlug):
                return "/guild/\(realmSlug)/\(guildSlug)/activity"
            case .guildAchievements(realmSlug: let realmSlug, guildSlug: let guildSlug):
                return "/guild/\(realmSlug)/\(guildSlug)/achievements"
            case .guildRoster(realmSlug: let realmSlug, guildSlug: let guildSlug):
                return "/guild/\(realmSlug)/\(guildSlug)/roster"
            }
        }
        
        
        var apiType: APIType? {
            switch self {
            case .auctionHouseIndex, .auctionHouse,
                    .connectedRealmIndex, .connectedRealm, .connectedRealmSearch,
                    .creatureFamilyIndex, .creatureFamily, .creatureTypeIndex, .creatureType, .creature, .creatureSearch, .creatureDisplayMedia, .creatureFamilyMedia,
                    .guildCrestIndex, .guildCrestBorderMedia, .guildCrestEmblemMedia,
                    .itemClassIndex, .itemClass, .itemSubclass, .item, .itemMedia, .itemSearch,
                    .mediaSearch,
                    .playableClassIndex, .playableClass, .playableClassMedia,
                    .playableRaceIndex, .playableRace,
                    .powerTypeIndex, .powerType,
                    .realmIndex, .realm, .realmSearch,
                    .regionIndex, .region,
                    .tokenIndex,
                    .pvpSeasonIndex, .pvpSeason,
                    .pvpRegionIndex, .pvpRegionSeasonIndex, .pvpRegionSeason,
                    .pvpRegionSeasonLeaderboardIndex, .pvpRegionSeasonLeaderboard, .pvpRegionSeasonRewardIndex:
                return .gameData
            case .accountProfileSummary, .protectedCharacterProfileSummary,
                    .characterAchievementsSummary, .characterAchievementStatistics,
                    .characterAppearanceSummary,
                    .characterEquipmentSummary,
                    .characterHunterPetsSummary,
                    .characterMediaSummary,
                    .characterProfileSummary, .characterProfileStatus,
                    .characterPvPBracketStatistics, .characterPvPSummary,
                    .characterSpecializationsSummary,
                    .characterStatisticsSummary,
                    .guild, .guildActivity, .guildAchievements, .guildRoster:
                return .profile
            }
        }
        
        
        var basePath: String? {
            switch apiType {
            case .gameData: return "/data/wow"
            case .profile:
                switch self {
                case .accountProfileSummary, .protectedCharacterProfileSummary:
                    return "/profile/user/wow"
                case .guild, .guildActivity, .guildAchievements, .guildRoster:
                    return "/data/wow"
                default:
                    return "/profile/wow"
                }
            default: return nil
            }
        }
        
        
        var queries: [String: String]? {
            switch self {
            case .connectedRealmSearch(let queries), .creatureSearch(let queries), .itemSearch(let queries),
                    .mediaSearch(let queries), .realmSearch(let queries):
                return queries
            default: return nil
            }
        }
    }
    
    
    var region: APIRegion
    var locale: APILocale?
    
    var session: URLSession
    
    var baseURL: URL? { return URL(string: region.apiURI) }
    
    var authenticationService: AuthenticationWebService?
    
    
    
    // MARK: - Game Data API
    
    // MARK: Auction House API
    
    /**
     Returns an index of auction houses for a connected realm.
     
     - parameter connectedRealmID: The ID of the connected realm.
     - parameter namespace: The namespace to use to locate this document.
     - important: Throwing 404 since March 2026
     */
    public func getAuctionHouseIndex(connectedRealmID: Int, namespace: APINamespace? = .dynamicClassic) async throws -> Data {
        return try await call(endpoint: API.auctionHouseIndex(connectedRealmID: connectedRealmID), namespace: namespace)
    }
    
    
    /**
     Returns a single auction house by auction house ID.
     
     - parameter connectedRealmID: The ID of the connected realm.
     - parameter auctionHouseID: The ID of the auction house.
     - parameter namespace: The namespace to use to locate this document.
     - important: Throwing 404 since March 2026
     */
    public func getAuctionHouse(connectedRealmID: Int, auctionHouseID: Int, namespace: APINamespace? = .dynamicClassic) async throws -> Data {
        return try await call(endpoint: API.auctionHouse(connectedRealmID: connectedRealmID, auctionHouseID: auctionHouseID), namespace: namespace)
    }
    
    
    
    // MARK: Connected Realm API
    
    /**
     Returns an index of connected realms.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getConnectedRealmIndex(namespace: APINamespace? = .dynamicClassic) async throws -> Data {
        return try await call(endpoint: API.connectedRealmIndex, namespace: namespace)
    }
    
    
    /**
     Returns a connected realm by ID.
     
     - parameter id: The ID of the connected realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getConnectedRealm(id: Int, namespace: APINamespace? = .dynamicClassic) async throws -> Data {
        return try await call(endpoint: API.connectedRealm(id), namespace: namespace)
    }
    
    
    /**
     Performs a search of connected realms.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func searchConnectedRealms(queries: [String: String], namespace: APINamespace? = .dynamicClassic) async throws -> Data {
        return try await call(endpoint: API.connectedRealmSearch(queries), namespace: namespace)
    }
    
    
    
    // MARK: Creature API
    
    /**
     Returns an index of creature families.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCreatureFamilyIndex(namespace: APINamespace? = .staticClassic) async throws -> Data {
        return try await call(endpoint: API.creatureFamilyIndex, namespace: namespace)
    }
    
    
    /**
     Returns a creature family by ID.
     
     - parameter id: The ID of the creature family.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCreatureFamily(id: Int, namespace: APINamespace? = .staticClassic) async throws -> Data {
        return try await call(endpoint: API.creatureFamily(id), namespace: namespace)
    }
    
    
    /**
     Returns an index of creature types.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCreatureTypeIndex(namespace: APINamespace? = .staticClassic) async throws -> Data {
        return try await call(endpoint: API.creatureTypeIndex, namespace: namespace)
    }
    
    
    /**
     Returns a creature type by ID.
     
     - parameter id: The ID of the creature type.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCreatureType(id: Int, namespace: APINamespace? = .staticClassic) async throws -> Data {
        return try await call(endpoint: API.creatureType(id), namespace: namespace)
    }
    
    
    /**
     Returns a creature by ID.
     
     - parameter id: The ID of the creature.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCreature(id: Int, namespace: APINamespace? = .staticClassic) async throws -> Data {
        return try await call(endpoint: API.creature(id), namespace: namespace)
    }
    
    
    /**
     Performs a search of creatures.
     
     - parameter queries: The query parameters to add to the search.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func searchCreature(queries: [String: String], namespace: APINamespace? = .staticClassic) async throws -> Data {
        return try await call(endpoint: API.creatureSearch(queries), namespace: namespace)
    }
    
    
    /**
     Returns media for a creature display by ID.
     
     - parameter id: The ID of the creature display.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCreatureDisplayMedia(id: Int, namespace: APINamespace? = .staticClassic) async throws -> Data {
        return try await call(endpoint: API.creatureDisplayMedia(id), namespace: namespace)
    }
    
    
    /**
     Returns media for a creature family by ID.
     
     - parameter id: The ID of the creature family.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCreatureFamilyMedia(id: Int, namespace: APINamespace? = .staticClassic) async throws -> Data {
        return try await call(endpoint: API.creatureFamilyMedia(id), namespace: namespace)
    }
    
    
    
    // MARK: Guild Crest API
    
    /**
     Returns an index of guild crest media.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getGuildCrestIndex(namespace: APINamespace? = .staticClassic) async throws -> Data {
        return try await call(endpoint: API.guildCrestIndex, namespace: namespace)
    }
    
    
    /**
     Returns media for a guild crest border by ID.
     
     - parameter id: The ID of the guild crest border.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getGuildCrestBorderMedia(id: Int, namespace: APINamespace? = .staticClassic) async throws -> Data {
        return try await call(endpoint: API.guildCrestBorderMedia(id), namespace: namespace)
    }
    
    
    /**
     Returns media for a guild crest emblem by ID.
     
     - parameter id: The ID of the guild crest emblem.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getGuildCrestEmblemMedia(id: Int, namespace: APINamespace? = .staticClassic) async throws -> Data {
        return try await call(endpoint: API.guildCrestEmblemMedia(id), namespace: namespace)
    }
    
    
    
    // MARK: Item API
    
    /**
     Returns an index of item classes.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getItemClassIndex(namespace: APINamespace? = .staticClassic) async throws -> Data {
        return try await call(endpoint: API.itemClassIndex, namespace: namespace)
    }
    
    
    /**
     Returns an item class by ID.
     
     - parameter id: The ID of the item class.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getItemClass(id: Int, namespace: APINamespace? = .staticClassic) async throws -> Data {
        return try await call(endpoint: API.itemClass(id), namespace: namespace)
    }


    /**
     Returns an item subclass by ID.
     
     - parameter itemClassID: The ID of the item class.
     - parameter itemSubclassID: The ID of the item subclass.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getItemSubclass(itemClassID: Int, itemSubclassID: Int, namespace: APINamespace? = .staticClassic) async throws -> Data {
        return try await call(endpoint: API.itemSubclass(itemClassID: itemClassID, itemSubclassID: itemSubclassID), namespace: namespace)
    }
    
    
    /**
     Returns an item by ID.
     
     - parameter id: The ID of the item.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getItem(id: Int, namespace: APINamespace? = .staticClassic) async throws -> Data {
        return try await call(endpoint: API.item(id), namespace: namespace)
    }
    
    
    /**
     Returns media for an item by ID.
     
     - parameter id: The ID of the item.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getItemMedia(id: Int, namespace: APINamespace? = .staticClassic) async throws -> Data {
        return try await call(endpoint: API.itemMedia(id), namespace: namespace)
    }
    
    
    /**
     Performs a search of items.
     
     - parameter queries: The query parameters to add to the search.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func searchItem(queries: [String: String], namespace: APINamespace? = .staticClassic) async throws -> Data {
        return try await call(endpoint: API.itemSearch(queries), namespace: namespace)
    }
    
    
    
    // MARK: Media Search API
    
    /**
     Performs a search of all types of media documents.
     
     - parameter queries: The query parameters to add to the search.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func searchMedia(queries: [String: String], namespace: APINamespace? = .staticClassic) async throws -> Data {
        return try await call(endpoint: API.mediaSearch(queries), namespace: namespace)
    }
    
    
    
    // MARK: Playable Class API
    
    /**
     Returns an index of playable classes.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPlayableClassIndex(namespace: APINamespace? = .staticClassic) async throws -> Data {
        return try await call(endpoint: API.playableClassIndex, namespace: namespace)
    }
    
    
    /**
     Returns a playable class by ID.
     
     - parameter id: The ID of the playable class.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPlayableClass(id: Int, namespace: APINamespace? = .staticClassic) async throws -> Data {
        return try await call(endpoint: API.playableClass(id), namespace: namespace)
    }
    
    
    /**
     Returns media for a playable class by ID.
     
     - parameter id: The ID of the playable class.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPlayableClassMedia(id: Int, namespace: APINamespace? = .staticClassic) async throws -> Data {
        return try await call(endpoint: API.playableClassMedia(id), namespace: namespace)
    }
    
    
    
    // MARK: Playable Race API
    
    /**
     Returns an index of playable races.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPlayableRaceIndex(namespace: APINamespace? = .staticClassic) async throws -> Data {
        return try await call(endpoint: API.playableRaceIndex, namespace: namespace)
    }
    
    
    /**
     Returns a playable race by ID.
     
     - parameter id: The ID of the playable race.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPlayableRace(id: Int, namespace: APINamespace? = .staticClassic) async throws -> Data {
        return try await call(endpoint: API.playableRace(id), namespace: namespace)
    }
    
    
    
    // MARK: Power Type API
    
    /**
     Returns an index of power types.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPowerTypeIndex(namespace: APINamespace? = .staticClassic) async throws -> Data {
        return try await call(endpoint: API.powerTypeIndex, namespace: namespace)
    }
    
    
    /**
     Returns a power type by ID.
     
     - parameter id: The ID of the power type.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPowerType(id: Int, namespace: APINamespace? = .staticClassic) async throws -> Data {
        return try await call(endpoint: API.powerType(id), namespace: namespace)
    }
    
    
    
    // MARK: Realm API
    
    /**
     Returns an index of realms.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getRealmIndex(namespace: APINamespace? = .dynamicClassic) async throws -> Data {
        return try await call(endpoint: API.realmIndex, namespace: namespace)
    }
    
    
    /**
     Returns a single realm by slug or ID.
     
     - parameter slug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getRealm(_ slug: String, namespace: APINamespace? = .dynamicClassic) async throws -> Data {
        return try await call(endpoint: API.realm(slug), namespace: namespace)
    }
    
    
    /**
     Performs a search of realms.
     
     - parameter queries: The query parameters to add to the search.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func searchRealm(queries: [String: String], namespace: APINamespace? = .dynamicClassic) async throws -> Data {
        return try await call(endpoint: API.realmSearch(queries), namespace: namespace)
    }
    
    
    
    // MARK: Region API
    
    /**
     Returns an index of regions.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getRegionIndex(namespace: APINamespace? = .dynamicClassic) async throws -> Data {
        return try await call(endpoint: API.regionIndex, namespace: namespace)
    }
    
    
    /**
     Returns a region by ID.
     
     - parameter id: The ID of the region.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getRegion(id: Int, namespace: APINamespace? = .dynamicClassic) async throws -> Data {
        return try await call(endpoint: API.region(id), namespace: namespace)
    }
    
    
    
    // MARK: Token API
    
    /**
     Returns the WoW Token index.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getTokenIndex(namespace: APINamespace? = .dynamicClassic) async throws -> Data {
        return try await call(endpoint: API.tokenIndex, namespace: namespace)
    }
    
    
    
    // MARK: PvP Season API

    /**
     Returns an index of PvP seasons.

     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPvPSeasonIndex(namespace: APINamespace? = .dynamicClassic) async throws -> Data {
        return try await call(endpoint: API.pvpSeasonIndex, namespace: namespace)
    }


    /**
     Returns a PvP season by ID.

     - parameter id: The ID of the PvP season.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPvPSeason(id: Int, namespace: APINamespace? = .dynamicClassic) async throws -> Data {
        return try await call(endpoint: API.pvpSeason(id), namespace: namespace)
    }


    /**
     Returns an index of PvP regions.
     
     - parameter namespace: The namespace to use to locate this document.
     - important: Throwing 404 since March 2026
     */
    public func getPvPRegionIndex(namespace: APINamespace? = .dynamicClassic) async throws -> Data {
        return try await call(endpoint: API.pvpRegionIndex, namespace: namespace)
    }
    
    
    /**
     Returns an index of PvP seasons for a given PvP region.
     
     - parameter pvpRegionID: The ID of the PvP region.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPvPRegionSeasonIndex(pvpRegionID: Int, namespace: APINamespace? = .dynamicClassic) async throws -> Data {
        return try await call(endpoint: API.pvpRegionSeasonIndex(pvpRegionID: pvpRegionID), namespace: namespace)
    }
    
    
    /**
     Returns a PvP season by region and season ID.
     
     - parameter pvpRegionID: The ID of the PvP region.
     - parameter pvpSeasonID: The ID of the PvP season.
     - parameter namespace: The namespace to use to locate this document.
     - important: Throwing 404 since March 2026
     */
    public func getPvPRegionSeason(pvpRegionID: Int, pvpSeasonID: Int, namespace: APINamespace? = .dynamicClassic) async throws -> Data {
        return try await call(endpoint: API.pvpRegionSeason(pvpRegionID: pvpRegionID, pvpSeasonID: pvpSeasonID), namespace: namespace)
    }
    
    
    /**
     Returns an index of PvP leaderboards for a region and season.
     
     - parameter pvpRegionID: The ID of the PvP region.
     - parameter pvpSeasonID: The ID of the PvP season.
     - parameter namespace: The namespace to use to locate this document.
     - important: Throwing 404 since March 2026
     */
    public func getPvPRegionSeasonLeaderboardIndex(pvpRegionID: Int, pvpSeasonID: Int, namespace: APINamespace? = .dynamicClassic) async throws -> Data {
        return try await call(endpoint: API.pvpRegionSeasonLeaderboardIndex(pvpRegionID: pvpRegionID, pvpSeasonID: pvpSeasonID), namespace: namespace)
    }
    
    
    /**
     Returns the PvP leaderboard for a given bracket in a region and season.
     
     - parameter pvpRegionID: The ID of the PvP region.
     - parameter pvpSeasonID: The ID of the PvP season.
     - parameter pvpBracket: The PvP bracket.
     - parameter namespace: The namespace to use to locate this document.
     - important: Throwing 404 since March 2026
     */
    public func getPvPRegionSeasonLeaderboard(pvpRegionID: Int, pvpSeasonID: Int, pvpBracket: WOWLeaderboardBracket, namespace: APINamespace? = .dynamicClassic) async throws -> Data {
        return try await call(endpoint: API.pvpRegionSeasonLeaderboard(pvpRegionID: pvpRegionID, pvpSeasonID: pvpSeasonID, pvpBracket: pvpBracket), namespace: namespace)
    }
    
    
    /**
     Returns an index of PvP rewards for a region and season.
     
     - parameter pvpRegionID: The ID of the PvP region.
     - parameter pvpSeasonID: The ID of the PvP season.
     - parameter namespace: The namespace to use to locate this document.
     - important: Throwing 404 since March 2026
     */
    public func getPvPRegionSeasonRewardIndex(pvpRegionID: Int, pvpSeasonID: Int, namespace: APINamespace? = .dynamicClassic) async throws -> Data {
        return try await call(endpoint: API.pvpRegionSeasonRewardIndex(pvpRegionID: pvpRegionID, pvpSeasonID: pvpSeasonID), namespace: namespace)
    }
}
