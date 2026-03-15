//
//  WS_WorldOfWarcraft+GameData.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


extension WS_WorldOfWarcraft {
    // MARK: - Game Data API
    
    // MARK: Achievement API
    
    /**
     Returns an index of achievement categories.
     
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getAchievementCategoryIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.achievementCategoryIndex, namespace: namespace)
    }
    
    
    /**
     Returns an achievement category by ID.
     
     - parameter id: The ID of the achievement category.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getAchievementCategory(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.achievementCategory(id), namespace: namespace)
    }
    
    
    /**
     Returns an index of achievements.
     
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getAchievementIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.achievementIndex, namespace: namespace)
    }
    
    
    /**
     Returns an achievement by ID.
     
     - parameter id: The ID of the achievement.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getAchievement(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.achievement(id), namespace: namespace)
    }
    
    
    /**
     Returns media for an achievement by ID.
     
     - parameter id: The ID of the achievement.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getAchievementMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.achievementMedia(id), namespace: namespace)
    }
    
    
    
    // MARK: Auction House API
    
    /**
     Returns all active auctions for a connected realm.
     
     Auction house data updates at a set interval. The value was initially set at 1 hour; however, it might change over time without notice.
     
     Depending on the number of active auctions on the specified connected realm, the response from this endpoint may be rather large, sometimes exceeding 10 MB.
     
     - SeeAlso: See the Connected Realm API for information about retrieving a list of connected realm IDs.
     
     - parameter connectedRealmID: The ID of the connected realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getAuctions(connectedRealmID: Int, namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await call(endpoint: API.auctions(connectedRealmID: connectedRealmID), namespace: namespace)
    }
    
    
    
    // MARK: Azerite Essence API
    
    /**
     Returns an index of azerite essences.
     
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getAzeriteEssenceIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.azeriteEssenceIndex, namespace: namespace)
    }
    
    
    /**
     Returns an azerite essence by ID.
     
     - parameter id: The ID of the azerite essence.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getAzeriteEssence(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.azeriteEssence(id), namespace: namespace)
    }
    
    
    /**
     Performs a search of azerite essences.
     
     - parameter queries: The fields and values to search.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func searchAzeriteEssence(queries: [String: String], namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.azeriteEssenceSearch(queries), namespace: namespace)
    }
    
    
    /**
     Returns media for an azerite essence by ID.
     
     - parameter id: The ID of the azerite essence.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getAzeriteEssenceMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.azeriteEssenceMedia(id), namespace: namespace)
    }
    
    
    
    // MARK: Connected Realm API
    
    /**
     Returns an index of connected realms.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getConnectedRealmIndex(namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await call(endpoint: API.connectedRealmIndex, namespace: namespace)
    }
    
    
    /**
     Returns a connected realm by ID.
     
     - parameter id: The ID of the connected realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getConnectedRealm(id: Int, namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await call(endpoint: API.connectedRealm(id), namespace: namespace)
    }
    
    
    /**
     Performs a search of connected realms.
     
     - parameter queries: The fields and values to search.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func searchConnectedRealms(queries: [String: String], namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await call(endpoint: API.connectedRealmSearch(queries), namespace: namespace)
    }
    
    
    
    // MARK: Covenant API
    
    /**
     Returns an index of covenants.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCovenantIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.covenantIndex, namespace: namespace)
    }
    
    
    /**
     Returns a covenant by ID.
     
     - parameter id: The ID of the covenant.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCovenant(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.covenant(id), namespace: namespace)
    }
    
    
    /**
     Returns media for a covenant by ID.
     
     - parameter id: The ID of the covenant.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCovenantMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.covenantMedia(id), namespace: namespace)
    }
    
    
    /**
     Returns an index of soulbinds.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getSoulbindIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.soulbindIndex, namespace: namespace)
    }
    
    
    /**
     Returns a soulbind by ID.
     
     - parameter id: The ID of the soulbind.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getSoulbind(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.soulbind(id), namespace: namespace)
    }
    
    
    /**
     Returns an index of conduits.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getConduitIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.conduitIndex, namespace: namespace)
    }
    
    
    /**
     Returns a conduit by ID.
     
     - parameter id: The ID of the conduit.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getConduit(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.conduit(id), namespace: namespace)
    }
    
    
    
    // MARK: Creature API
    
    /**
     Returns an index of creature families.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCreatureFamilyIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.creatureFamilyIndex, namespace: namespace)
    }
    
    
    /**
     Returns a creature family by ID.
     
     - parameter id: The ID of the creature family.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCreatureFamily(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.creatureFamily(id), namespace: namespace)
    }
    
    
    /**
     Returns an index of creature types.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCreatureTypeIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.creatureTypeIndex, namespace: namespace)
    }
    
    
    /**
     Returns a creature type by ID.
     
     - parameter id: The ID of the creature type.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCreatureType(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.creatureType(id), namespace: namespace)
    }
    
    
    /**
     Returns a creature by ID.
     
     - parameter id: The ID of the creature.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCreature(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.creature(id), namespace: namespace)
    }
    
    
    /**
     Performs a search of creatures.
     
     - parameter queries: The fields and values to search.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func searchCreature(queries: [String: String], namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.creatureSearch(queries), namespace: namespace)
    }
    
    
    /**
     Returns media for a creature display by ID.
     
     - parameter id: The ID of the creature display.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCreatureDisplayMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.creatureDisplayMedia(id), namespace: namespace)
    }
    
    
    /**
     Returns media for a creature family by ID.
     
     - parameter id: The ID of the creature family.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCreatureFamilyMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.creatureFamilyMedia(id), namespace: namespace)
    }
    
    
    
    // MARK: Guild Crest API
    
    /**
     Returns an index of guild crest media.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getGuildCrestIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.guildCrestIndex, namespace: namespace)
    }
    
    
    /**
     Returns media for a guild crest border by ID.
     
     - parameter id: The ID of the guild crest border.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getGuildCrestBorderMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.guildCrestBorderMedia(id), namespace: namespace)
    }
    
    
    /**
     Returns media for a guild crest emblem by ID.
     
     - parameter id: The ID of the guild crest emblem.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getGuildCrestEmblemMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.guildCrestEmblemMedia(id), namespace: namespace)
    }
    
    
    
    // MARK: Item API
    
    public func getItemClassIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.itemClassIndex, namespace: namespace)
    }
    
    public func getItemClass(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.itemClass(id), namespace: namespace)
    }
    
    public func getItemSetIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.itemSetIndex, namespace: namespace)
    }
    
    public func getItemSet(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.itemSet(id), namespace: namespace)
    }
    
    public func getItemSubclass(itemClassID: Int, itemSubclassID: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.itemSubclass(itemClassID: itemClassID, itemSubclassID: itemSubclassID), namespace: namespace)
    }
    
    public func getItem(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.item(id), namespace: namespace)
    }
    
    public func getItemMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.itemMedia(id), namespace: namespace)
    }
    
    public func searchItem(queries: [String: String], namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.itemSearch(queries), namespace: namespace)
    }
    
    
    
    // MARK: Journal API
    
    public func getJournalExpansionIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.journalExpansionIndex, namespace: namespace)
    }
    
    public func getJournalExpansion(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.journalExpansion(id), namespace: namespace)
    }
    
    public func getJournalEncounterIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.journalEncounterIndex, namespace: namespace)
    }
    
    public func getJournalEncounter(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.journalEncounter(id), namespace: namespace)
    }
    
    public func searchJournalEncounter(queries: [String: String], namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.journalEncounterSearch(queries), namespace: namespace)
    }
    
    public func getJournalInstanceIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.journalInstanceIndex, namespace: namespace)
    }
    
    public func getJournalInstance(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.journalInstance(id), namespace: namespace)
    }
    
    public func getJournalInstanceMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.journalInstanceMedia(id), namespace: namespace)
    }
    
    
    
    // MARK: Media Search API
    
    public func searchMedia(queries: [String: String], namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.mediaSearch(queries), namespace: namespace)
    }
    
    
    
    // MARK: Modified Crafting API
    
    public func getModifiedCraftingIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.modifiedCraftingIndex, namespace: namespace)
    }
    
    public func getModifiedCraftingCategoryIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.modifiedCraftingCategoryIndex, namespace: namespace)
    }
    
    public func getModifiedCraftingCategory(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.modifiedCraftingCategory(id), namespace: namespace)
    }
    
    public func getModifiedCraftingReagentSlotTypeIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.modifiedCraftingReagentSlotTypeIndex, namespace: namespace)
    }
    
    public func getModifiedCraftingReagentSlotType(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.modifiedCraftingReagentSlotType(id), namespace: namespace)
    }
    
    
    
    // MARK: Mount API
    
    public func getMountIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.mountIndex, namespace: namespace)
    }
    
    public func getMount(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.mount(id), namespace: namespace)
    }
    
    public func searchMount(queries: [String: String], namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.mountSearch(queries), namespace: namespace)
    }
    
    
    
    // MARK: Mythic Keystone Affix API
    
    public func getMythicKeystoneAffixIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.mythicKeystoneAffixIndex, namespace: namespace)
    }
    
    public func getMythicKeystoneAffix(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.mythicKeystoneAffix(id), namespace: namespace)
    }
    
    public func getMythicKeystoneAffixMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.mythicKeystoneAffixMedia(id), namespace: namespace)
    }
    
    
    
    // MARK: Mythic Keystone Dungeon API
    
    public func getMythicKeystoneDungeonIndex(namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.mythicKeystoneDungeonIndex, namespace: namespace)
    }
    
    public func getMythicKeystoneDungeon(id: Int, namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.mythicKeystoneDungeon(id), namespace: namespace)
    }
    
    public func getMythicKeystoneIndex(namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.mythicKeystoneIndex, namespace: namespace)
    }
    
    public func getMythicKeystonePeriodIndex(namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.mythicKeystonePeriodIndex, namespace: namespace)
    }
    
    public func getMythicKeystonePeriod(id: Int, namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.mythicKeystonePeriod(id), namespace: namespace)
    }
    
    public func getMythicKeystoneSeasonIndex(namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.mythicKeystoneSeasonIndex, namespace: namespace)
    }
    
    public func getMythicKeystoneSeason(id: Int, namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.mythicKeystoneSeason(id), namespace: namespace)
    }
    
    
    
    // MARK: Mythic Keystone Leaderboard API
    
    public func getMythicLeaderboardIndex(connectedRealmID: Int, namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.mythicKeystoneLeaderboardIndex(connectedRealmID: connectedRealmID), namespace: namespace)
    }
    
    public func getMythicLeaderboard(connectedRealmID: Int, dungeonID: Int, period: Int, namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.mythicKeystoneLeaderboard(connectedRealmID: connectedRealmID, dungeonID: dungeonID, period: period), namespace: namespace)
    }
    
    
    
    // MARK: Mythic Raid Leaderboard API
    
    public func getMythicRaidLeaderboard(raid: String, faction: FactionType, namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.mythicRaidLeaderboard(raid: raid, faction: faction), namespace: namespace)
    }
    
    
    
    // MARK: Pet API
    
    public func getPetIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.petIndex, namespace: namespace)
    }
    
    public func getPet(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.pet(id), namespace: namespace)
    }
    
    public func getPetMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.petMedia(id), namespace: namespace)
    }
    
    public func getPetAbilityIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.petAbilityIndex, namespace: namespace)
    }
    
    public func getPetAbility(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.petAbility(id), namespace: namespace)
    }
    
    public func getPetAbilityMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.petAbilityMedia(id), namespace: namespace)
    }
    
    
    
    // MARK: Playable Class API
    
    public func getPlayableClassIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.playableClassIndex, namespace: namespace)
    }
    
    public func getPlayableClass(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.playableClass(id), namespace: namespace)
    }
    
    public func getPlayableClassMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.playableClassMedia(id), namespace: namespace)
    }
    
    public func getPlayableClassPvPTalentSlots(classID: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.pvpTalentSlots(classID: classID), namespace: namespace)
    }
    
    
    
    // MARK: Playable Race API
    
    public func getPlayableRaceIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.playableRaceIndex, namespace: namespace)
    }
    
    public func getPlayableRace(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.playableRace(id), namespace: namespace)
    }
    
    
    
    // MARK: Playable Specialization API
    
    public func getPlayableSpecializationIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.playableSpecializationIndex, namespace: namespace)
    }
    
    public func getPlayableSpecialization(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.playableSpecialization(id), namespace: namespace)
    }
    
    public func getPlayableSpecializationMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.playableSpecializationMedia(id), namespace: namespace)
    }
    
    
    
    // MARK: Power Type API
    
    public func getPowerTypeIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.powerTypeIndex, namespace: namespace)
    }
    
    public func getPowerType(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.powerType(id), namespace: namespace)
    }
    
    
    
    // MARK: Profession API
    
    public func getProfessionIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.professionIndex, namespace: namespace)
    }
    
    public func getProfession(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.profession(id), namespace: namespace)
    }
    
    public func getProfessionMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.professionMedia(id), namespace: namespace)
    }
    
    public func getProfessionSkillTier(professionID: Int, skillTierID: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.professionSkillTier(professionID: professionID, skillTierID: skillTierID), namespace: namespace)
    }
    
    public func getRecipe(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.recipe(id), namespace: namespace)
    }
    
    public func getRecipeMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.recipeMedia(id), namespace: namespace)
    }
    
    
    
    // MARK: PvP Season API
    
    public func getPvPSeasonIndex(namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.pvpSeasonIndex, namespace: namespace)
    }
    
    public func getPvPSeason(id: Int, namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.pvpSeason(id), namespace: namespace)
    }
    
    public func getPvPLeaderboardIndex(pvpSeasonID: Int, namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.pvpLeaderboardIndex(season: pvpSeasonID), namespace: namespace)
    }
    
    public func getPvPLeaderboard(pvpSeasonID: Int, pvpBracket: WOWLeaderboardBracket, namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.pvpLeaderboard(season: pvpSeasonID, pvpBracket: pvpBracket), namespace: namespace)
    }
    
    public func getPvPRewardIndex(pvpSeasonID: Int, namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.pvpRewardIndex(season: pvpSeasonID), namespace: namespace)
    }
    
    
    
    // MARK: PvP Tier API
    
    public func getPvPTierMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.pvpTierMedia(id), namespace: namespace)
    }
    
    public func getPvPTierIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.pvpTierIndex, namespace: namespace)
    }
    
    public func getPvPTier(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.pvpTier(id), namespace: namespace)
    }
    
    
    
    // MARK: Quest API
    
    public func getQuestIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.questIndex, namespace: namespace)
    }
    
    public func getQuest(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.quest(id), namespace: namespace)
    }
    
    public func getQuestCategoryIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.questCategoryIndex, namespace: namespace)
    }
    
    public func getQuestCategory(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.questCategory(id), namespace: namespace)
    }
    
    public func getQuestAreaIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.questAreaIndex, namespace: namespace)
    }
    
    public func getQuestArea(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.questArea(id), namespace: namespace)
    }
    
    public func getQuestTypeIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.questTypeIndex, namespace: namespace)
    }
    
    public func getQuestType(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.questType(id), namespace: namespace)
    }
    
    
    
    // MARK: Realm API
    
    public func getRealmIndex(namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.realmIndex, namespace: namespace)
    }
    
    public func getRealm(_ slug: String, namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.realm(slug), namespace: namespace)
    }
    
    public func searchRealm(queries: [String: String], namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await call(endpoint: API.realmSearch(queries), namespace: namespace)
    }
    
    
    
    // MARK: Region API
    
    public func getRegionIndex(namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await call(endpoint: API.regionIndex, namespace: namespace)
    }
    
    public func getRegion(id: Int, namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await call(endpoint: API.region(id), namespace: namespace)
    }
    
    
    
    // MARK: Reputations API
    
    public func getReputationFactionIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.reputationFactionIndex, namespace: namespace)
    }
    
    public func getReputationFaction(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.reputationFaction(id), namespace: namespace)
    }
    
    public func getReputationTierIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.reputationTierIndex, namespace: namespace)
    }
    
    public func getReputationTier(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.reputationTier(id), namespace: namespace)
    }
    
    
    
    // MARK: Spell API
    
    public func getSpell(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.spell(id), namespace: namespace)
    }
    
    public func getSpellMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.spellMedia(id), namespace: namespace)
    }
    
    public func searchSpell(queries: [String: String], namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.spellSearch(queries), namespace: namespace)
    }
    
    
    
    // MARK: Talent API
    
    public func getTalentIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.talentIndex, namespace: namespace)
    }
    
    public func getTalent(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.talent(id), namespace: namespace)
    }
    
    public func getPvPTalentIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.pvpTalentIndex, namespace: namespace)
    }
    
    public func getPvPTalent(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.pvpTalent(id), namespace: namespace)
    }
    
    
    
    // MARK: Tech Talent API
    
    public func getTechTalentTreeIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.techTalentTreeIndex, namespace: namespace)
    }
    
    public func getTechTalentTree(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.techTalentTree(id), namespace: namespace)
    }
    
    public func getTechTalentIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.techTalentIndex, namespace: namespace)
    }
    
    public func getTechTalent(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.techTalent(id), namespace: namespace)
    }
    
    public func getTechTalentMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.techTalentMedia(id), namespace: namespace)
    }
    
    
    
    // MARK: Title API
    
    public func getTitleIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.titleIndex, namespace: namespace)
    }
    
    public func getTitle(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.title(id), namespace: namespace)
    }
    
    
    
    // MARK: Token API
    
    public func getTokenIndex(namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await call(endpoint: API.tokenIndex, namespace: namespace)
    }
}
