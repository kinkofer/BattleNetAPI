//
//  WS_WorldOfWarcraft.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct WS_WorldOfWarcraft: WebService {
    public enum API: APICall {
        // Game Data APIs
        case achievementIndex
        case achievement(Int)
        case achievementMedia(Int)
        case achievementCategoryIndex
        case achievementCategory(Int)

        case auctions(connectedRealmID: Int)
        case auctionCommodities

        case azeriteEssenceIndex
        case azeriteEssence(Int)
        case azeriteEssenceSearch([String: String]?)
        case azeriteEssenceMedia(Int)

        case connectedRealmIndex
        case connectedRealm(Int)
        case connectedRealmSearch([String: String]?)

        case covenantIndex
        case covenant(Int)
        case covenantMedia(Int)
        case soulbindIndex
        case soulbind(Int)
        case conduitIndex
        case conduit(Int)

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

        case heirloomIndex
        case heirloom(Int)

        case itemClassIndex
        case itemClass(Int)
        case itemSetIndex
        case itemSet(Int)
        case itemSubclass(itemClassID: Int, itemSubclassID: Int)
        case item(Int)
        case itemMedia(Int)
        case itemSearch([String: String]?)

        case itemAppearanceIndex
        case itemAppearance(Int)
        case itemAppearanceSetIndex
        case itemAppearanceSet(Int)
        case itemAppearanceSlotIndex
        case itemAppearanceBySlot(String)
        case itemAppearanceSearch([String: String]?)

        case journalExpansionIndex
        case journalExpansion(Int)
        case journalEncounterIndex
        case journalEncounter(Int)
        case journalEncounterSearch([String: String]?)
        case journalInstanceIndex
        case journalInstance(Int)
        case journalInstanceMedia(Int)

        case mediaSearch([String: String]?)

        case modifiedCraftingIndex
        case modifiedCraftingCategoryIndex
        case modifiedCraftingCategory(Int)
        case modifiedCraftingReagentSlotTypeIndex
        case modifiedCraftingReagentSlotType(Int)

        case mountIndex
        case mount(Int)
        case mountSearch([String: String]?)

        case mythicKeystoneAffixIndex
        case mythicKeystoneAffix(Int)
        case mythicKeystoneAffixMedia(Int)

        case mythicKeystoneDungeonIndex
        case mythicKeystoneDungeon(Int)
        case mythicKeystoneIndex
        case mythicKeystonePeriodIndex
        case mythicKeystonePeriod(Int)
        case mythicKeystoneSeasonIndex
        case mythicKeystoneSeason(Int)

        case mythicKeystoneLeaderboardIndex(connectedRealmID: Int)
        case mythicKeystoneLeaderboard(connectedRealmID: Int, dungeonID: Int, period: Int)

        case mythicRaidLeaderboard(raid: String, faction: FactionType)

        case petIndex
        case pet(Int)
        case petMedia(Int)
        case petAbilityIndex
        case petAbility(Int)
        case petAbilityMedia(Int)

        case playableClassIndex
        case playableClass(Int)
        case playableClassMedia(Int)
        case pvpTalentSlots(classID: Int)

        case playableRaceIndex
        case playableRace(Int)

        case playableSpecializationIndex
        case playableSpecialization(Int)
        case playableSpecializationMedia(Int)

        case decorIndex
        case decor(Int)
        case decorSearch([String: String]?)
        case fixtureIndex
        case fixture(Int)
        case fixtureSearch([String: String]?)
        case fixtureHookIndex
        case fixtureHook(Int)
        case fixtureHookSearch([String: String]?)
        case neighborhoodMapIndex
        case neighborhoodMap(Int)
        case neighborhood(mapID: Int, id: Int)
        case roomIndex
        case room(Int)
        case roomSearch([String: String]?)

        case powerTypeIndex
        case powerType(Int)

        case professionIndex
        case profession(Int)
        case professionMedia(Int)
        case professionSkillTier(professionID: Int, skillTierID: Int)
        case recipe(Int)
        case recipeMedia(Int)

        case pvpSeasonIndex
        case pvpSeason(Int)
        case pvpLeaderboardIndex(season: Int)
        case pvpLeaderboard(season: Int, pvpBracket: WOWLeaderboardBracket)
        case pvpRewardIndex(season: Int)

        case pvpTierMedia(Int)
        case pvpTierIndex
        case pvpTier(Int)

        case questIndex
        case quest(Int)
        case questCategoryIndex
        case questCategory(Int)
        case questAreaIndex
        case questArea(Int)
        case questTypeIndex
        case questType(Int)

        case realmIndex
        case realm(String)
        case realmSearch([String: String]?)

        case regionIndex
        case region(Int)

        case reputationFactionIndex
        case reputationFaction(Int)
        case reputationTierIndex
        case reputationTier(Int)

        case spell(Int)
        case spellMedia(Int)
        case spellSearch([String: String]?)

        case talentIndex
        case talent(Int)
        case pvpTalentIndex
        case pvpTalent(Int)

        case talentTreeIndex
        case talentTree(Int)
        case talentTreeNodesForSpecialization(treeID: Int, specID: Int)

        case techTalentTreeIndex
        case techTalentTree(Int)
        case techTalentIndex
        case techTalent(Int)
        case techTalentMedia(Int)

        case titleIndex
        case title(Int)

        case tokenIndex

        case toyIndex
        case toy(Int)


        // Profile APIs
        case accountProfileSummary
        case protectedCharacterProfileSummary(realmID: Int, characterID: Int)
        case accountCollectionsIndex
        case accountMountsCollectionSummary
        case accountPetsCollectionSummary

        case characterAchievementsSummary(realmSlug: String, characterName: String)
        case characterAchievementStatistics(realmSlug: String, characterName: String)

        case characterAppearanceSummary(realmSlug: String, characterName: String)

        case characterCollectionsIndex(realmSlug: String, characterName: String)
        case characterMountsCollectionSummary(realmSlug: String, characterName: String)
        case characterPetsCollectionSummary(realmSlug: String, characterName: String)
        case characterHeirloomsCollection(realmSlug: String, characterName: String)
        case characterToysCollection(realmSlug: String, characterName: String)
        case characterTransmogsCollection(realmSlug: String, characterName: String)
        case characterDecorCollection(realmSlug: String, characterName: String)

        case characterEncountersSummary(realmSlug: String, characterName: String)
        case characterDungeons(realmSlug: String, characterName: String)
        case characterRaids(realmSlug: String, characterName: String)

        case characterEquipmentSummary(realmSlug: String, characterName: String)

        case characterHouse(realmSlug: String, characterName: String)

        case characterHunterPetsSummary(realmSlug: String, characterName: String)

        case characterMediaSummary(realmSlug: String, characterName: String)

        case characterMythicKeystoneProfileIndex(realmSlug: String, characterName: String)
        case characterMythicKeystoneSeasonDetails(realmSlug: String, characterName: String, season: Int)

        case characterProfessionsSummary(realmSlug: String, characterName: String)

        case characterProfileSummary(realmSlug: String, characterName: String)
        case characterProfileStatus(realmSlug: String, characterName: String)

        case characterPvPBracketStatistics(realmSlug: String, characterName: String, pvpBracket: WOWLeaderboardBracket)
        case characterPvPSummary(realmSlug: String, characterName: String)

        case characterQuests(realmSlug: String, characterName: String)
        case characterCompletedQuests(realmSlug: String, characterName: String)

        case characterReputationsSummary(realmSlug: String, characterName: String)

        case characterSoulbinds(realmSlug: String, characterName: String)

        case characterSpecializationsSummary(realmSlug: String, characterName: String)

        case characterStatisticsSummary(realmSlug: String, characterName: String)

        case characterTitlesSummary(realmSlug: String, characterName: String)

        case guild(realmSlug: String, guildSlug: String)
        case guildActivity(realmSlug: String, guildSlug: String)
        case guildAchievements(realmSlug: String, guildSlug: String)
        case guildRoster(realmSlug: String, guildSlug: String)


        var path: String {
            switch self {
            // Game Data APIs
            case .achievementCategoryIndex:
                return "/achievement-category/index"
            case .achievementCategory(let id):
                return "/achievement-category/\(id)"
            case .achievementIndex:
                return "/achievement/index"
            case .achievement(let id):
                return "/achievement/\(id)"
            case .achievementMedia(let id):
                return "/media/achievement/\(id)"

            case .auctions(connectedRealmID: let connectedRealmID):
                return "/connected-realm/\(connectedRealmID)/auctions"
            case .auctionCommodities:
                return "/auctions/commodities"

            case .azeriteEssenceIndex:
                return "/azerite-essence/index"
            case .azeriteEssence(let id):
                return "/azerite-essence/\(id)"
            case .azeriteEssenceSearch:
                return "/search/azerite-essence"
            case .azeriteEssenceMedia(let id):
                return "/media/azerite-essence/\(id)"

            case .connectedRealmIndex:
                return "/connected-realm/index"
            case .connectedRealm(let id):
                return "/connected-realm/\(id)"
            case .connectedRealmSearch:
                return "/search/connected-realm"

            case .covenantIndex:
                return "/covenant/index"
            case .covenant(let id):
                return "/covenant/\(id)"
            case .covenantMedia(let id):
                return "/media/covenant/\(id)"
            case .soulbindIndex:
                return "/covenant/soulbind/index"
            case .soulbind(let id):
                return "/covenant/soulbind/\(id)"
            case .conduitIndex:
                return "/covenant/conduit/index"
            case .conduit(let id):
                return "/covenant/conduit/\(id)"

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

            case .heirloomIndex:
                return "/heirloom/index"
            case .heirloom(let id):
                return "/heirloom/\(id)"

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

            case .itemAppearanceIndex:
                return "/item-appearance/index"
            case .itemAppearance(let id):
                return "/item-appearance/\(id)"
            case .itemAppearanceSetIndex:
                return "/item-appearance/set/index"
            case .itemAppearanceSet(let id):
                return "/item-appearance/set/\(id)"
            case .itemAppearanceSlotIndex:
                return "/item-appearance/slot/index"
            case .itemAppearanceBySlot(let slotType):
                return "/item-appearance/slot/\(slotType)"
            case .itemAppearanceSearch:
                return "/search/item-appearance"

            case .journalExpansionIndex:
                return "/journal-expansion/index"
            case .journalExpansion(let id):
                return "/journal-expansion/\(id)"
            case .journalEncounterIndex:
                return "/journal-encounter/index"
            case .journalEncounter(let id):
                return "/journal-encounter/\(id)"
            case .journalEncounterSearch:
                return "/search/journal-encounter"
            case .journalInstanceIndex:
                return "/journal-instance/index"
            case .journalInstance(let id):
                return "/journal-instance/\(id)"
            case .journalInstanceMedia(let id):
                return "/media/journal-instance/\(id)"

            case .mediaSearch:
                return "/search/media"

            case .decorIndex:
                return "/decor/index"
            case .decor(let id):
                return "/decor/\(id)"
            case .decorSearch:
                return "/search/decor"
            case .fixtureIndex:
                return "/fixture/index"
            case .fixture(let id):
                return "/fixture/\(id)"
            case .fixtureSearch:
                return "/search/fixture"
            case .fixtureHookIndex:
                return "/fixture-hook/index"
            case .fixtureHook(let id):
                return "/fixture-hook/\(id)"
            case .fixtureHookSearch:
                return "/search/fixture-hook"
            case .neighborhoodMapIndex:
                return "/neighborhood-map/index"
            case .neighborhoodMap(let id):
                return "/neighborhood-map/\(id)"
            case .neighborhood(mapID: let mapID, id: let id):
                return "/neighborhood-map/\(mapID)/neighborhood/\(id)"
            case .roomIndex:
                return "/room/index"
            case .room(let id):
                return "/room/\(id)"
            case .roomSearch:
                return "/search/room"

            case .modifiedCraftingIndex:
                return "/modified-crafting/index"
            case .modifiedCraftingCategoryIndex:
                return "/modified-crafting/category/index"
            case .modifiedCraftingCategory(let id):
                return "/modified-crafting/category/\(id)"
            case .modifiedCraftingReagentSlotTypeIndex:
                return "/modified-crafting/reagent-slot-type/index"
            case .modifiedCraftingReagentSlotType(let id):
                return "/modified-crafting/reagent-slot-type/\(id)"

            case .mountIndex:
                return "/mount/index"
            case .mount(let id):
                return "/mount/\(id)"
            case .mountSearch:
                return "/search/mount"

            case .mythicKeystoneAffixIndex:
                return "/keystone-affix/index"
            case .mythicKeystoneAffix(let id):
                return "/keystone-affix/\(id)"
            case .mythicKeystoneAffixMedia(let id):
                return "/media/keystone-affix/\(id)"

            case .mythicKeystoneDungeonIndex:
                return "/mythic-keystone/dungeon/index"
            case .mythicKeystoneDungeon(let id):
                return "/mythic-keystone/dungeon/\(id)"
            case .mythicKeystoneIndex:
                return "/mythic-keystone/index"
            case .mythicKeystonePeriodIndex:
                return "/mythic-keystone/period/index"
            case .mythicKeystonePeriod(let id):
                return "/mythic-keystone/period/\(id)"
            case .mythicKeystoneSeasonIndex:
                return "/mythic-keystone/season/index"
            case .mythicKeystoneSeason(let id):
                return "/mythic-keystone/season/\(id)"

            case .mythicKeystoneLeaderboardIndex(connectedRealmID: let connectedRealmID):
                return "/connected-realm/\(connectedRealmID)/mythic-leaderboard/index"
            case .mythicKeystoneLeaderboard(connectedRealmID: let connectedRealmID, dungeonID: let dungeonID, period: let period):
                return "/connected-realm/\(connectedRealmID)/mythic-leaderboard/\(dungeonID)/period/\(period)"

            case .mythicRaidLeaderboard(raid: let raid, faction: let faction):
                return "/leaderboard/hall-of-fame/\(raid)/\(faction.rawValue.lowercased())"

            case .petIndex:
                return "/pet/index"
            case .pet(let id):
                return "/pet/\(id)"
            case .petMedia(let id):
                return "/media/pet/\(id)"
            case .petAbilityIndex:
                return "/pet-ability/index"
            case .petAbility(let id):
                return "/pet-ability/\(id)"
            case .petAbilityMedia(let id):
                return "/media/pet-ability/\(id)"

            case .playableClassIndex:
                return "/playable-class/index"
            case .playableClass(let id):
                return "/playable-class/\(id)"
            case .playableClassMedia(let id):
                return "/media/playable-class/\(id)"
            case .pvpTalentSlots(classID: let classID):
                return "/playable-class/\(classID)/pvp-talent-slots"

            case .playableRaceIndex:
                return "/playable-race/index"
            case .playableRace(let id):
                return "/playable-race/\(id)"

            case .playableSpecializationIndex:
                return "/playable-specialization/index"
            case .playableSpecialization(let id):
                return "/playable-specialization/\(id)"
            case .playableSpecializationMedia(let id):
                return "/media/playable-specialization/\(id)"

            case .powerTypeIndex:
                return "/power-type/index"
            case .powerType(let id):
                return "/power-type/\(id)"

            case .professionIndex:
                return "/profession/index"
            case .profession(let id):
                return "/profession/\(id)"
            case .professionMedia(let id):
                return "/media/profession/\(id)"
            case .professionSkillTier(professionID: let professionID, skillTierID: let skillTierID):
                return "/profession/\(professionID)/skill-tier/\(skillTierID)"
            case .recipe(let id):
                return "/recipe/\(id)"
            case .recipeMedia(let id):
                return "/media/recipe/\(id)"

            case .pvpSeasonIndex:
                return "/pvp-season/index"
            case .pvpSeason(let season):
                return "/pvp-season/\(season)"
            case .pvpLeaderboardIndex(season: let season):
                return "/pvp-season/\(season)/pvp-leaderboard/index"
            case .pvpLeaderboard(season: let season, pvpBracket: let bracket):
                return "/pvp-season/\(season)/pvp-leaderboard/\(bracket.rawValue)"
            case .pvpRewardIndex(season: let season):
                return "/pvp-season/\(season)/pvp-reward/index"

            case .pvpTierMedia(let id):
                return "/media/pvp-tier/\(id)"
            case .pvpTierIndex:
                return "/pvp-tier/index"
            case .pvpTier(let id):
                return "/pvp-tier/\(id)"

            case .questIndex:
                return "/quest/index"
            case .quest(let id):
                return "/quest/\(id)"
            case .questCategoryIndex:
                return "/quest/category/index"
            case .questCategory(let id):
                return "/quest/category/\(id)"
            case .questAreaIndex:
                return "/quest/area/index"
            case .questArea(let id):
                return "/quest/area/\(id)"
            case .questTypeIndex:
                return "/quest/type/index"
            case .questType(let id):
                return "/quest/type/\(id)"

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

            case .reputationFactionIndex:
                return "/reputation-faction/index"
            case .reputationFaction(let id):
                return "/reputation-faction/\(id)"
            case .reputationTierIndex:
                return "/reputation-tiers/index"
            case .reputationTier(let id):
                return "/reputation-tiers/\(id)"

            case .spell(let id):
                return "/spell/\(id)"
            case .spellMedia(let id):
                return "/media/spell/\(id)"
            case .spellSearch:
                return "/search/spell"

            case .talentIndex:
                return "/talent/index"
            case .talent(let id):
                return "/talent/\(id)"
            case .pvpTalentIndex:
                return "/pvp-talent/index"
            case .pvpTalent(let id):
                return "/pvp-talent/\(id)"

            case .talentTreeIndex:
                return "/talent-tree/index"
            case .talentTree(let id):
                return "/talent-tree/\(id)"
            case .talentTreeNodesForSpecialization(treeID: let treeID, specID: let specID):
                return "/talent-tree/\(treeID)/playable-specialization/\(specID)"

            case .techTalentTreeIndex:
                return "/tech-talent-tree/index"
            case .techTalentTree(let id):
                return "/tech-talent-tree/\(id)"
            case .techTalentIndex:
                return "/tech-talent/index"
            case .techTalent(let id):
                return "/tech-talent/\(id)"
            case .techTalentMedia(let id):
                return "/media/tech-talent/\(id)"

            case .titleIndex:
                return "/title/index"
            case .title(let id):
                return "/title/\(id)"

            case .tokenIndex:
                return "/token/index"

            case .toyIndex:
                return "/toy/index"
            case .toy(let id):
                return "/toy/\(id)"

            // Profile APIs
            case .accountProfileSummary:
                return ""
            case .protectedCharacterProfileSummary(realmID: let realmID, characterID: let characterID):
                return "/protected-character/\(realmID)-\(characterID)"
            case .accountCollectionsIndex:
                return "/collections"
            case .accountMountsCollectionSummary:
                return "/collections/mounts"
            case .accountPetsCollectionSummary:
                return "/collections/pets"

            case .characterAchievementsSummary(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/achievements"
            case .characterAchievementStatistics(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/achievements/statistics"

            case .characterAppearanceSummary(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/appearance"

            case .characterCollectionsIndex(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/collections"
            case .characterMountsCollectionSummary(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/collections/mounts"
            case .characterPetsCollectionSummary(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/collections/pets"
            case .characterHeirloomsCollection(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/collections/heirlooms"
            case .characterToysCollection(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/collections/toys"
            case .characterTransmogsCollection(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/collections/transmogs"
            case .characterDecorCollection(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/collections/decor"

            case .characterEncountersSummary(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/encounters"
            case .characterDungeons(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/encounters/dungeons"
            case .characterRaids(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/encounters/raids"

            case .characterEquipmentSummary(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/equipment"

            case .characterHouse(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/house"

            case .characterHunterPetsSummary(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/hunter-pets"

            case .characterMediaSummary(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/character-media"

            case .characterMythicKeystoneProfileIndex(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/mythic-keystone-profile"
            case .characterMythicKeystoneSeasonDetails(realmSlug: let realmSlug, characterName: let characterName, season: let season):
                return "/character/\(realmSlug)/\(characterName)/mythic-keystone-profile/season/\(season)"

            case .characterProfessionsSummary(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/professions"

            case .characterProfileSummary(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)"
            case .characterProfileStatus(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/status"

            case .characterPvPBracketStatistics(realmSlug: let realmSlug, characterName: let characterName, pvpBracket: let pvpBracket):
                return "/character/\(realmSlug)/\(characterName)/pvp-bracket/\(pvpBracket.rawValue)"
            case .characterPvPSummary(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/pvp-summary"

            case .characterQuests(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/quests"
            case .characterCompletedQuests(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/quests/completed"

            case .characterReputationsSummary(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/reputations"

            case .characterSoulbinds(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/soulbinds"

            case .characterSpecializationsSummary(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/specializations"

            case .characterStatisticsSummary(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/statistics"

            case .characterTitlesSummary(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/titles"

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
            case .achievementCategoryIndex, .achievementCategory, .achievementIndex, .achievement, .achievementMedia,
                 .auctions, .auctionCommodities,
                 .azeriteEssenceIndex, .azeriteEssence, .azeriteEssenceSearch, .azeriteEssenceMedia,
                 .connectedRealmIndex, .connectedRealm, .connectedRealmSearch,
                 .covenantIndex, .covenant, .covenantMedia, .soulbindIndex, .soulbind, .conduitIndex, .conduit,
                 .creatureFamilyIndex, .creatureFamily, .creatureTypeIndex, .creatureType, .creature, .creatureSearch, .creatureDisplayMedia, .creatureFamilyMedia,
                 .guildCrestIndex, .guildCrestBorderMedia, .guildCrestEmblemMedia,
                 .heirloomIndex, .heirloom,
                 .itemClassIndex, .itemClass, .itemSetIndex, .itemSet, .itemSubclass, .item, .itemMedia, .itemSearch,
                 .itemAppearanceIndex, .itemAppearance, .itemAppearanceSetIndex, .itemAppearanceSet, .itemAppearanceSlotIndex, .itemAppearanceBySlot, .itemAppearanceSearch,
                 .journalExpansionIndex, .journalExpansion, .journalEncounterIndex, .journalEncounter, .journalEncounterSearch, .journalInstanceIndex, .journalInstance, .journalInstanceMedia,
                 .mediaSearch,
                 .decorIndex, .decor, .decorSearch, .fixtureIndex, .fixture, .fixtureSearch, .fixtureHookIndex, .fixtureHook, .fixtureHookSearch,
                 .neighborhoodMapIndex, .neighborhoodMap, .neighborhood, .roomIndex, .room, .roomSearch,
                 .modifiedCraftingIndex, .modifiedCraftingCategoryIndex, .modifiedCraftingCategory, .modifiedCraftingReagentSlotTypeIndex, .modifiedCraftingReagentSlotType,
                 .mountIndex, .mount, .mountSearch,
                 .mythicKeystoneAffixIndex, .mythicKeystoneAffix, .mythicKeystoneAffixMedia,
                 .mythicKeystoneDungeonIndex, .mythicKeystoneDungeon, .mythicKeystoneIndex, .mythicKeystonePeriodIndex, .mythicKeystonePeriod, .mythicKeystoneSeasonIndex, .mythicKeystoneSeason,
                 .mythicKeystoneLeaderboardIndex, .mythicKeystoneLeaderboard,
                 .mythicRaidLeaderboard,
                 .petIndex, .pet, .petMedia, .petAbilityIndex, .petAbility, .petAbilityMedia,
                 .playableClassIndex, .playableClass, .playableClassMedia, .pvpTalentSlots,
                 .playableRaceIndex, .playableRace,
                 .playableSpecializationIndex, .playableSpecialization, .playableSpecializationMedia,
                 .powerTypeIndex, .powerType,
                 .professionIndex, .profession, .professionMedia, .professionSkillTier, .recipe, .recipeMedia,
                 .pvpSeasonIndex, .pvpSeason, .pvpLeaderboardIndex, .pvpLeaderboard, .pvpRewardIndex,
                 .pvpTierMedia, .pvpTierIndex, .pvpTier,
                 .questIndex, .quest, .questCategoryIndex, .questCategory, .questAreaIndex, .questArea, .questTypeIndex, .questType,
                 .realmIndex, .realm, .realmSearch,
                 .regionIndex, .region,
                 .reputationFactionIndex, .reputationFaction, .reputationTierIndex, .reputationTier,
                 .spell, .spellMedia, .spellSearch,
                 .talentIndex, .talent, .pvpTalentIndex, .pvpTalent,
                 .talentTreeIndex, .talentTree, .talentTreeNodesForSpecialization,
                 .techTalentTreeIndex, .techTalentTree, .techTalentIndex, .techTalent, .techTalentMedia,
                 .titleIndex, .title,
                 .tokenIndex,
                 .toyIndex, .toy:
                return .gameData
            case .accountProfileSummary, .protectedCharacterProfileSummary, .accountCollectionsIndex, .accountMountsCollectionSummary, .accountPetsCollectionSummary,
                 .characterAchievementsSummary, .characterAchievementStatistics,
                 .characterAppearanceSummary,
                 .characterCollectionsIndex, .characterMountsCollectionSummary, .characterPetsCollectionSummary,
                 .characterHeirloomsCollection, .characterToysCollection, .characterTransmogsCollection, .characterDecorCollection,
                 .characterEncountersSummary, .characterDungeons, .characterRaids,
                 .characterEquipmentSummary,
                 .characterHouse,
                 .characterHunterPetsSummary,
                 .characterMediaSummary,
                 .characterMythicKeystoneProfileIndex, .characterMythicKeystoneSeasonDetails,
                 .characterProfessionsSummary,
                 .characterProfileSummary, .characterProfileStatus,
                 .characterPvPBracketStatistics, .characterPvPSummary,
                 .characterQuests, .characterCompletedQuests,
                 .characterReputationsSummary,
                 .characterSoulbinds,
                 .characterSpecializationsSummary,
                 .characterStatisticsSummary,
                 .characterTitlesSummary,
                 .guild, .guildActivity, .guildAchievements, .guildRoster:
                return .profile
            }
        }


        var basePath: String? {
            switch apiType {
            case .gameData: return "/data/wow"
            case .profile:
                switch self {
                case .accountProfileSummary, .protectedCharacterProfileSummary, .accountCollectionsIndex, .accountMountsCollectionSummary, .accountPetsCollectionSummary:
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
            case .azeriteEssenceSearch(let queries), .connectedRealmSearch(let queries), .creatureSearch(let queries),
                 .itemSearch(let queries), .itemAppearanceSearch(let queries),
                 .journalEncounterSearch(let queries), .mediaSearch(let queries),
                 .decorSearch(let queries), .fixtureSearch(let queries), .fixtureHookSearch(let queries), .roomSearch(let queries),
                 .mountSearch(let queries), .realmSearch(let queries), .spellSearch(let queries):
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
}
