//
//  File.swift
//  
//
//  Created by Christopher Jennewein on 2/13/21.
//

import Foundation


public struct WS_WorldOfWarcraftClassic: WebService {
    public enum API: APICall {
        // Game Data APIs
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
        case itemSetIndex
        case itemSet(Int)
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
        
        
        var path: String {
            switch self {
            // Game Data APIs
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
            case .itemSetIndex:
                return "/item-set/index"
            case .itemSet(let id):
                return "/item-set/\(id)"
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
            }
        }
        
        
        var apiType: APIType? {
            switch self {
            case .connectedRealmIndex, .connectedRealm, .connectedRealmSearch,
                 .creatureFamilyIndex, .creatureFamily, .creatureTypeIndex, .creatureType, .creature, .creatureSearch, .creatureDisplayMedia, .creatureFamilyMedia,
                 .guildCrestIndex, .guildCrestBorderMedia, .guildCrestEmblemMedia,
                 .itemClassIndex, .itemClass, .itemSetIndex, .itemSet, .itemSubclass, .item, .itemMedia, .itemSearch,
                 .mediaSearch,
                 .playableClassIndex, .playableClass, .playableClassMedia,
                 .playableRaceIndex, .playableRace,
                 .powerTypeIndex, .powerType,
                 .realmIndex, .realm, .realmSearch,
                 .regionIndex, .region,
                 .tokenIndex:
                return .gameData
            }
        }
        
        
        var basePath: String? {
            switch apiType {
            case .gameData: return "/data/wow"
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
    
    // MARK: Connected Realm API
    
    /**
     Returns an index of connected realms.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getConnectedRealmIndex(namespace: APINamespace? = .dynamicClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.connectedRealmIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a connected realm by ID.
     
     - parameter id: The ID of the connected realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getConnectedRealm(id: Int, namespace: APINamespace? = .dynamicClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.connectedRealm(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Performs a search of connected realms.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func searchConnectedRealms(queries: [String: String], namespace: APINamespace? = .dynamicClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.connectedRealmSearch(queries), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Creature API
    
    /**
     Returns an index of creature families.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCreatureFamilyIndex(namespace: APINamespace? = .staticClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.creatureFamilyIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a creature family by ID.
     
     - parameter id: The ID of the creature family.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCreatureFamily(id: Int, namespace: APINamespace? = .staticClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.creatureFamily(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an index of creature types.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCreatureTypeIndex(namespace: APINamespace? = .staticClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.creatureTypeIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a creature type by ID.
     
     - parameter id: The ID of the creature type.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCreatureType(id: Int, namespace: APINamespace? = .staticClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.creatureType(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a creature by ID.
     
     - parameter id: The ID of the creature.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCreature(id: Int, namespace: APINamespace? = .staticClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.creature(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Performs a search of creatures.
     
     - parameter queries: The query parameters to add to the search.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func searchCreature(queries: [String: String], namespace: APINamespace? = .staticClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.creatureSearch(queries), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns media for a creature display by ID.
     
     - parameter id: The ID of the creature display.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCreatureDisplayMedia(id: Int, namespace: APINamespace? = .staticClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.creatureDisplayMedia(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns media for a creature family by ID.
     
     - parameter id: The ID of the creature family.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCreatureFamilyMedia(id: Int, namespace: APINamespace? = .staticClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.creatureFamilyMedia(id), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Guild Crest API
    
    /**
     Returns an index of guild crest media.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getGuildCrestIndex(namespace: APINamespace? = .staticClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.guildCrestIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns media for a guild crest border by ID.
     
     - parameter id: The ID of the guild crest border.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getGuildCrestBorderMedia(id: Int, namespace: APINamespace? = .staticClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.guildCrestBorderMedia(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns media for a guild crest emblem by ID.
     
     - parameter id: The ID of the guild crest emblem.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getGuildCrestEmblemMedia(id: Int, namespace: APINamespace? = .staticClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.guildCrestEmblemMedia(id), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Item API
    
    /**
     Returns an index of item classes.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getItemClassIndex(namespace: APINamespace? = .staticClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.itemClassIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an item class by ID.
     
     - parameter id: The ID of the item class.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getItemClass(id: Int, namespace: APINamespace? = .staticClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.itemClass(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an index of item sets.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getItemSetIndex(namespace: APINamespace? = .staticClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.itemSetIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an item set by ID.
     
     - parameter id: The ID of the item set.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getItemSet(id: Int, namespace: APINamespace? = .staticClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.itemSet(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an item subclass by ID.
     
     - parameter itemClassID: The ID of the item class.
     - parameter itemSubclassID: The ID of the item subclass.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getItemSubclass(itemClassID: Int, itemSubclassID: Int, namespace: APINamespace? = .staticClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.itemSubclass(itemClassID: itemClassID, itemSubclassID: itemSubclassID), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an item by ID.
     
     - parameter id: The ID of the item.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getItem(id: Int, namespace: APINamespace? = .staticClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.item(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns media for an item by ID.
     
     - parameter id: The ID of the item.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getItemMedia(id: Int, namespace: APINamespace? = .staticClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.itemMedia(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Performs a search of items.
     
     - parameter queries: The query parameters to add to the search.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func searchItem(queries: [String: String], namespace: APINamespace? = .staticClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.itemSearch(queries), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Media Search API
    
    /**
     Performs a search of all types of media documents.
     
     - parameter queries: The query parameters to add to the search.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func searchMedia(queries: [String: String], namespace: APINamespace? = .staticClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.mediaSearch(queries), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Playable Class API
    
    /**
     Returns an index of playable classes.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPlayableClassIndex(namespace: APINamespace? = .staticClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.playableClassIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a playable class by ID.
     
     - parameter id: The ID of the playable class.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPlayableClass(id: Int, namespace: APINamespace? = .staticClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.playableClass(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns media for a playable class by ID.
     
     - parameter id: The ID of the playable class.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPlayableClassMedia(id: Int, namespace: APINamespace? = .staticClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.playableClassMedia(id), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Playable Race API
    
    /**
     Returns an index of playable races.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPlayableRaceIndex(namespace: APINamespace? = .staticClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.playableRaceIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a playable race by ID.
     
     - parameter id: The ID of the playable race.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPlayableRace(id: Int, namespace: APINamespace? = .staticClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.playableRace(id), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Power Type API
    
    /**
     Returns an index of power types.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPowerTypeIndex(namespace: APINamespace? = .staticClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.powerTypeIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a power type by ID.
     
     - parameter id: The ID of the power type.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPowerType(id: Int, namespace: APINamespace? = .staticClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.powerType(id), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Realm API
    
    /**
     Returns an index of realms.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getRealmIndex(namespace: APINamespace? = .dynamicClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.realmIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a single realm by slug or ID.
     
     - parameter slug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getRealm(_ slug: String, namespace: APINamespace? = .dynamicClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.realm(slug), namespace: namespace, completion: completion)
    }
    
    
    /**
     Performs a search of realms.
     
     - parameter queries: The query parameters to add to the search.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func searchRealm(queries: [String: String], namespace: APINamespace? = .dynamicClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.realmSearch(queries), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Region API
    
    /**
     Returns an index of regions.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getRegionIndex(namespace: APINamespace? = .dynamicClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.regionIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a region by ID.
     
     - parameter id: The ID of the region.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getRegion(id: Int, namespace: APINamespace? = .dynamicClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.region(id), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Token API
    
    /**
     Returns the WoW Token index.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getTokenIndex(namespace: APINamespace? = .dynamicClassic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.tokenIndex, namespace: namespace) { result in
            completion(result)
        }
    }
}
