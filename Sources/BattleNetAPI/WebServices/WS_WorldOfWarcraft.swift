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
        case achievementCategoryIndex
        case achievementCategory(Int)
        case achievementIndex
        case achievement(Int)
        case achievementMedia(Int)
        
        case auctions(connectedRealmID: Int)
        
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
        
        case itemClassIndex
        case itemClass(Int)
        case itemSetIndex
        case itemSet(Int)
        case itemSubclass(itemClassID: Int, itemSubclassID: Int)
        case item(Int)
        case itemMedia(Int)
        case itemSearch([String: String]?)
        
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
        
        case techTalentTreeIndex
        case techTalentTree(Int)
        case techTalentIndex
        case techTalent(Int)
        case techTalentMedia(Int)
        
        case titleIndex
        case title(Int)
        
        case tokenIndex
        
        
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
        
        case characterEncountersSummary(realmSlug: String, characterName: String)
        case characterDungeons(realmSlug: String, characterName: String)
        case characterRaids(realmSlug: String, characterName: String)
        
        case characterEquipmentSummary(realmSlug: String, characterName: String)
        
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
            
            case .characterEncountersSummary(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/encounters"
            case .characterDungeons(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/encounters/dungeons"
            case .characterRaids(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/encounters/raids"
            
            case .characterEquipmentSummary(realmSlug: let realmSlug, characterName: let characterName):
                return "/character/\(realmSlug)/\(characterName)/equipment"
            
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
                 .auctions,
                 .azeriteEssenceIndex, .azeriteEssence, .azeriteEssenceSearch, .azeriteEssenceMedia,
                 .connectedRealmIndex, .connectedRealm, .connectedRealmSearch,
                 .covenantIndex, .covenant, .covenantMedia, .soulbindIndex, .soulbind, .conduitIndex, .conduit,
                 .creatureFamilyIndex, .creatureFamily, .creatureTypeIndex, .creatureType, .creature, .creatureSearch, .creatureDisplayMedia, .creatureFamilyMedia,
                 .guildCrestIndex, .guildCrestBorderMedia, .guildCrestEmblemMedia,
                 .itemClassIndex, .itemClass, .itemSetIndex, .itemSet, .itemSubclass, .item, .itemMedia, .itemSearch,
                 .journalExpansionIndex, .journalExpansion, .journalEncounterIndex, .journalEncounter, .journalEncounterSearch, .journalInstanceIndex, .journalInstance, .journalInstanceMedia,
                 .mediaSearch,
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
                 .techTalentTreeIndex, .techTalentTree, .techTalentIndex, .techTalent, .techTalentMedia,
                 .titleIndex, .title,
                 .tokenIndex:
                return .gameData
            case .accountProfileSummary, .protectedCharacterProfileSummary, .accountCollectionsIndex, .accountMountsCollectionSummary, .accountPetsCollectionSummary,
                 .characterAchievementsSummary, .characterAchievementStatistics,
                 .characterAppearanceSummary,
                 .characterCollectionsIndex, .characterMountsCollectionSummary, .characterPetsCollectionSummary,
                 .characterEncountersSummary, .characterDungeons, .characterRaids,
                 .characterEquipmentSummary,
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
                 .itemSearch(let queries), .journalEncounterSearch(let queries), .mediaSearch(let queries),
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
    
    
    
    // MARK: - Game Data API
    
    // MARK: Achievement API
    
    /**
     Returns an index of achievement categories.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getAchievementCategoryIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.achievementCategoryIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an achievement category by ID.
     
     - parameter id: The ID of the achievement category.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getAchievementCategory(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.achievementCategory(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an index of achievements.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getAchievementIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.achievementIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an achievement by ID.
     
     - parameter id: The ID of the achievement.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getAchievement(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.achievement(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns media for an achievement by ID.
     
     - parameter id: The ID of the achievement.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getAchievementMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.achievementMedia(id), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Auction House API
    
    /**
     Returns all active auctions for a connected realm.
     
     Auction house data updates at a set interval. The value was initially set at 1 hour; however, it might change over time without notice.
     
     Depending on the number of active auctions on the specified connected realm, the response from this endpoint may be rather large, sometimes exceeding 10 MB.
     
     - SeeAlso: See the Connected Realm API for information about retrieving a list of connected realm IDs.
     
     - parameter connectedRealmID: The ID of the connected realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getAuctions(connectedRealmID: Int, namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.auctions(connectedRealmID: connectedRealmID), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Azerite Essence API
    
    /**
     Returns an index of azerite essences.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getAzeriteEssenceIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.azeriteEssenceIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an azerite essence by ID.
     
     - parameter id: The ID of the azerite essence.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getAzeriteEssence(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.azeriteEssence(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Performs a search of azerite essences.
     
     - parameter queries: The query parameters to add to the search.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func searchAzeriteEssence(queries: [String: String], namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.azeriteEssenceSearch(queries), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns media for an azerite essence by ID.
     
     - parameter id: The ID of the azerite essence.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getAzeriteEssenceMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.azeriteEssenceMedia(id), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Connected Realm API
    
    /**
     Returns an index of connected realms.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getConnectedRealmIndex(namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.connectedRealmIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a connected realm by ID.
     
     - parameter id: The ID of the connected realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getConnectedRealm(id: Int, namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.connectedRealm(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Performs a search of connected realms.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func searchConnectedRealms(queries: [String: String], namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.connectedRealmSearch(queries), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Covenant API
    
    /**
     Returns an index of covenants.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCovenantIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.covenantIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a covenant by ID.
     
     - parameter id: The ID of the covenant.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCovenant(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.covenant(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns media for a covenant by ID.
     
     - parameter id: The ID of the covenant.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCovenantMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.covenantMedia(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an index of soulbinds.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getSoulbindIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.soulbindIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a soulbind by ID.
     
     - parameter id: The ID of the soulbind.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getSoulbind(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.soulbind(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an index of conduits.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCondiutIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.conduitIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a conduit by ID.
     
     - parameter id: The ID of the conduit.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getConduit(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.conduit(id), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Creature API
    
    /**
     Returns an index of creature families.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCreatureFamilyIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.creatureFamilyIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a creature family by ID.
     
     - parameter id: The ID of the creature family.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCreatureFamily(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.creatureFamily(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an index of creature types.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCreatureTypeIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.creatureTypeIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a creature type by ID.
     
     - parameter id: The ID of the creature type.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCreatureType(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.creatureType(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a creature by ID.
     
     - parameter id: The ID of the creature.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCreature(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.creature(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Performs a search of creatures.
     
     - parameter queries: The query parameters to add to the search.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func searchCreature(queries: [String: String], namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.creatureSearch(queries), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns media for a creature display by ID.
     
     - parameter id: The ID of the creature display.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCreatureDisplayMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.creatureDisplayMedia(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns media for a creature family by ID.
     
     - parameter id: The ID of the creature family.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCreatureFamilyMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.creatureFamilyMedia(id), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Guild Crest API
    
    /**
     Returns an index of guild crest media.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getGuildCrestIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.guildCrestIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns media for a guild crest border by ID.
     
     - parameter id: The ID of the guild crest border.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getGuildCrestBorderMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.guildCrestBorderMedia(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns media for a guild crest emblem by ID.
     
     - parameter id: The ID of the guild crest emblem.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getGuildCrestEmblemMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.guildCrestEmblemMedia(id), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Item API
    
    /**
     Returns an index of item classes.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getItemClassIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.itemClassIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an item class by ID.
     
     - parameter id: The ID of the item class.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getItemClass(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.itemClass(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an index of item sets.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getItemSetIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.itemSetIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an item set by ID.
     
     - parameter id: The ID of the item set.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getItemSet(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.itemSet(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an item subclass by ID.
     
     - parameter itemClassID: The ID of the item class.
     - parameter itemSubclassID: The ID of the item subclass.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getItemSubclass(itemClassID: Int, itemSubclassID: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.itemSubclass(itemClassID: itemClassID, itemSubclassID: itemSubclassID), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an item by ID.
     
     - parameter id: The ID of the item.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getItem(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.item(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns media for an item by ID.
     
     - parameter id: The ID of the item.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getItemMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.itemMedia(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Performs a search of items.
     
     - parameter queries: The query parameters to add to the search.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func searchItem(queries: [String: String], namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.itemSearch(queries), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Journal API
    
    /**
     Returns an index of journal expansions.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getJournalExpansionIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.journalExpansionIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a journal expansion by ID.
     
     - parameter id: The ID of the journal expansion.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getJournalExpansion(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.journalExpansion(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an index of journal encounters.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getJournalEncounterIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.journalEncounterIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a journal encounter by ID.
     
     - parameter id: The ID of the journal encounter.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getJournalEncounter(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.journalEncounter(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Performs a search of journal encounters.
     
     - parameter queries: The query parameters to add to the search.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func searchJournalEncounter(queries: [String: String], namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.journalEncounterSearch(queries), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an index of journal instances.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getJournalInstanceIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.journalInstanceIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a journal instance.
     
     - parameter id: The ID of the journal instance.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getJournalInstance(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.journalInstance(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns media for a journal instance by ID.
     
     - parameter id: The ID of the journal instance.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getJournalInstanceMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.journalInstanceMedia(id), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Media Search API
    
    /**
     Performs a search of all types of media documents.
     
     - parameter queries: The query parameters to add to the search.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func searchMedia(queries: [String: String], namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.mediaSearch(queries), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Modified Crafting API
    
    /**
     Returns the parent index for Modified Crafting.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getModifiedCraftingIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.modifiedCraftingIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns the index of Modified Crafting categories.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getModifiedCraftingCategoryIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.modifiedCraftingCategoryIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a Modified Crafting category by ID.
     
     - parameter id: The ID of the Modified Crafting category.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getModifiedCraftingCategory(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.modifiedCraftingCategory(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns the index of Modified Crafting reagent slot types.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getModifiedCraftingReagentSlotTypeIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.modifiedCraftingReagentSlotTypeIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a Modified Crafting reagent slot type by ID.
     
     - parameter id: The ID of the Modified Crafting reagent slot type.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getModifiedCraftingReagentSlotType(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.modifiedCraftingReagentSlotType(id), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Mount API
    
    /**
     Returns an index of mounts.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getMountIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.mountIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a mount by ID.
     
     - parameter id: The ID of the mount.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getMount(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.mount(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Performs a search of mounts.
     
     - parameter queries: The query parameters to add to the search.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func searchMount(queries: [String: String], namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.mountSearch(queries), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Mythic Keystone Affix API
    
    /**
     Returns an index of mythic keystone affixes.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getMythicKeystoneAffixIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.mythicKeystoneAffixIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a mythic keystone affix by ID.
     
     - parameter id: The ID of the mythic keystone affix.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getMythicKeystoneAffix(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.mythicKeystoneAffix(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns media for a mythic keystone affix by ID.
     
     - parameter id: The ID of the mythic keystone affix.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getMythicKeystoneAffixMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.mythicKeystoneAffixMedia(id), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Mythic Keystone Dungeon API
    
    /**
     Returns an index of Mythic Keystone dungeons.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getMythicKeystoneDungeonIndex(namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.mythicKeystoneDungeonIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a Mythic Keystone dungeon by ID.
     
     - parameter id: The ID of the dungeon.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getMythicKeystoneDungeon(id: Int, namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.mythicKeystoneDungeon(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an index of links to other documents related to Mythic Keystone dungeons.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getMythicKeystoneIndex(namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.mythicKeystoneIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an index of Mythic Keystone periods.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getMythicKeystonePeriodIndex(namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.mythicKeystonePeriodIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a Mythic Keystone period by ID.
     
     - parameter id: The ID of the Mythic Keystone season period.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getMythicKeystonePeriod(id: Int, namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.mythicKeystonePeriod(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an index of Mythic Keystone seasons.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getMythicKeystoneSeasonIndex(namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.mythicKeystoneSeasonIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a Mythic Keystone season by ID.
     
     - parameter id: The ID of the Mythic Keystone season.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getMythicKeystoneSeason(id: Int, namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.mythicKeystoneSeasonIndex, namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Mythic Keystone Leaderboard API
    
    /**
     Returns an index of Mythic Keystone Leaderboard dungeon instances for a connected realm.
     
     - parameter connectedRealmID: The ID of the connected realm
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getMythicLeaderboardIndex(connectedRealmID: Int, namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.mythicKeystoneLeaderboardIndex(connectedRealmID: connectedRealmID), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a weekly Mythic Keystone Leaderboard by period.
     
     - parameter connectedRealmID: The id of the connected realm
     - parameter dungeonID: The id of the dungeon
     - parameter period: The unique identifier for the leaderboard period
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getMythicLeaderboard(connectedRealmID: Int, dungeonID: Int, period: Int, namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.mythicKeystoneLeaderboard(connectedRealmID: connectedRealmID, dungeonID: dungeonID, period: period), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Mythic Raid Leaderboard API
    
    /**
     Returns the leaderboard for a given raid and faction.
     
     - parameter raid: The raid for a leaderboard
     - parameter faction: Player faction ('alliance' or 'horde')
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getMythicRaidLeaderboard(raid: String, faction: FactionType, namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.mythicRaidLeaderboard(raid: raid, faction: faction), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Pet API
    
    /**
     Returns an index of battle pets.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPetIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.petIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a battle pets by ID.
     
     - parameter id: The ID of the pet.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPet(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.pet(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns media for a battle pet by ID.
     
     - parameter id: The ID of the pet.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPetMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.petMedia(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an index of pet abilities.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPetAbilityIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.petAbilityIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a pet ability by ID.
     
     - parameter id: The ID of the pet ability.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPetAbility(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.petAbility(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns media for a pet ability by ID.
     
     - parameter id: The ID of the pet ability.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPetAbilityMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.petAbilityMedia(id), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Playable Class API
    
    /**
     Returns an index of playable classes.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPlayableClassIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.playableClassIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a playable class by ID.
     
     - parameter id: The ID of the playable class.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPlayableClass(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.playableClass(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns media for a playable class by ID.
     
     - parameter id: The ID of the playable class.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPlayableClassMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.playableClassMedia(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns the PvP talent slots for a playable class by ID.
     
     - parameter classID: The ID of the playable class.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPlayableClassPvPTalentSlots(classID: Int, namespace: APINamespace? = .static,completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.pvpTalentSlots(classID: classID), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Playable Race API
    
    /**
     Returns an index of playable races.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPlayableRaceIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.playableRaceIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a playable race by ID.
     
     - parameter id: The ID of the playable race.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPlayableRace(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.playableRace(id), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Playable Specialization API
    
    /**
     Returns an index of playable specializations.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPlayableSpecializationIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.playableSpecializationIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a playable specialization by ID.
     
     - parameter id: The ID of the playable specialization.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPlayableSpecialization(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.playableSpecialization(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns media for a playable specialization by ID.
     
     - parameter id: The ID of the playable specialization.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPlayableSpecializationMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.playableSpecializationMedia(id), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Power Type API
    
    /**
     Returns an index of power types.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPowerTypeIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.powerTypeIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a power type by ID.
     
     - parameter id: The ID of the power type.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPowerType(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.powerType(id), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Profession API
    
    /**
     Returns an index of professions.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getProfessionIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.professionIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a profession by ID.
     
     - parameter id: The ID of the profession.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getProfession(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.profession(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns media for a profession by ID.
     
     - parameter id: The ID of the profession.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getProfessionMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.professionMedia(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a skill tier for a profession by ID.
     
     - parameter professionID: The ID of the profession.
     - parameter skillTierID: The ID of the skill tier.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getProfessionSkillTier(professionID: Int, skillTierID: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.professionSkillTier(professionID: professionID, skillTierID: skillTierID), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a recipe by ID.
     
     - parameter id: The ID of the recipe.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getRecipe(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.recipe(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns media for a recipe by ID.
     
     - parameter id: The ID of the recipe.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getRecipeMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.recipeMedia(id), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: PvP Season API
    
    /**
     Returns an index of PvP seasons.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPvPSeasonIndex(namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.pvpSeasonIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a PvP season by ID.
     
     - parameter id: The ID of the PvP season.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPvPSeason(id: Int, namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.pvpSeason(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an index of PvP leaderboards for a PvP season.
     
     - parameter pvpSeasonID: The ID of the PvP season.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPvPLeaderboardIndex(pvpSeasonID: Int, namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.pvpLeaderboardIndex(season: pvpSeasonID), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns the PvP leaderboard of a specific PvP bracket for a PvP season.
     
     - parameter pvpSeasonID: The ID of the PvP season.
     - parameter pvpBracket: The PvP bracket type.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPvPLeaderboard(pvpSeasonID: Int, pvpBracket: WOWLeaderboardBracket, namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.pvpLeaderboard(season: pvpSeasonID, pvpBracket: pvpBracket), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an index of PvP rewards for a PvP season.
     
     - parameter pvpSeasonID: The ID of the PvP season.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPvPRewardIndex(pvpSeasonID: Int, namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.pvpRewardIndex(season: pvpSeasonID), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: PvP Tier API
    
    /**
     Returns media for a PvP tier by ID.
     
     - parameter id: The ID of the PvP tier.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPvPTierMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.pvpTierMedia(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an index of PvP tiers.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPvPTierIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.pvpTierIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a PvP tier by ID.
     
     - parameter id: The ID of the PvP tier.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPvPTier(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.pvpTier(id), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Quest API
    
    /**
     Returns an index of quests.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getQuestIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.questIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a quest by ID.
     
     - parameter id: The ID of the quest.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getQuest(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.quest(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an index of quest categories (such as quests for a specific class, profession, or storyline).
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getQuestCategoryIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.questCategoryIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a quest category by ID.
     
     - parameter id: The ID of the quest category.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getQuestCategory(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.questCategory(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an index of quest areas.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getQuestAreaIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.questAreaIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a quest area by ID.
     
     - parameter id: The ID of the quest area.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getQuestArea(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.questArea(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an index of quest types (such as PvP quests, raid quests, or account quests).
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getQuestTypeIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.questTypeIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a quest type by ID.
     
     - parameter id: The ID of the quest type.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getQuestType(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.questType(id), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Realm API
    
    /**
     Returns an index of realms.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getRealmIndex(namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.realmIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a single realm by slug or ID.
     
     - parameter slug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getRealm(_ slug: String, namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.call(endpoint: API.realm(slug), namespace: namespace, completion: completion)
    }
    
    
    /**
     Performs a search of realms.
     
     - parameter queries: The query parameters to add to the search.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func searchRealm(queries: [String: String], namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.realmSearch(queries), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Region API
    
    /**
     Returns an index of regions.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getRegionIndex(namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.regionIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a region by ID.
     
     - parameter id: The ID of the region.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getRegion(id: Int, namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.region(id), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Reputations API
    
    /**
     Returns an index of reputation factions.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getReputationFactionIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.reputationFactionIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a single reputation faction by ID.
     
     - parameter id: The ID of the reputation faction.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getReputationFaction(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.reputationFaction(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an index of reputation tiers.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getReputationTierIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.reputationTierIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a single set of reputation tiers by ID.
     
     - parameter id: The ID of the set of reputation tiers.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getReputationTier(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.reputationTier(id), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Spell API
    
    /**
     Returns a spell by ID.
     
     - parameter id: The ID of the spell.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getSpell(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.spell(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns media for a spell by ID.
     
     - parameter id: The ID of the spell.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getSpellMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.spellMedia(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Performs a search of spells.
     
     - parameter queries: The query parameters to add to the search.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func searchSpell(queries: [String: String], namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.spellSearch(queries), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Talent API
    
    /**
     Returns an index of talents.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getTalentIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.talentIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a talent by ID.
     
     - parameter id: The ID of the talent.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getTalent(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.talent(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an index of PvP talents.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPvPTalentIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.pvpTalentIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a PvP talent by ID.
     
     - parameter id: The ID of the PvP talent.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPvPTalent(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.pvpTalent(id), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Tech Talent API
    
    /**
     Returns an index of tech talent trees.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getTechTalentTreeIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.techTalentTreeIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a tech talent tree by ID.
     
     - parameter id: The ID of the tech talent tree.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getTechTalentTree(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.techTalentTree(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an index of tech talents.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getTechTalentIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.techTalentIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a tech talent by ID.
     
     - parameter id: The ID of the tech talent.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getTechTalent(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.techTalent(id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns media for a tech talent by ID.
     
     - parameter id: The ID of the tech talent.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getTechTalentMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.techTalentMedia(id), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Title API
    
    /**
     Returns an index of titles.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getTitleIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.titleIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a title by ID.
     
     - parameter id: The ID of the title.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getTitle(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.title(id), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Token API
    
    /**
     Returns the WoW Token index.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getTokenIndex(namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.tokenIndex, namespace: namespace) { result in
            completion(result)
        }
    }
    
    
    
    // MARK: - Profile API
    
    // MARK: Account Profile API
    
    /**
     Returns a profile summary for an account.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getAccountProfile(namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.accountProfileSummary, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a protected profile summary for a character.
     
     - parameter id: The ID of the character.
     - parameter realmID: The ID of the character's realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getProtectedCharacterProfile(id: Int, realmID: Int, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.protectedCharacterProfileSummary(realmID: realmID, characterID: id), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an index of collection types for an account.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getAccountCollectionsIndex(namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.accountCollectionsIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a summary of the mounts an account has obtained.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getMountsCollectionSummary(namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.accountMountsCollectionSummary, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a summary of the battle pets an account has obtained.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getPetsCollectionSummary(namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.accountPetsCollectionSummary, namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Character Achievements API
    
    /**
     Returns a summary of the achievements a character has completed.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getCharacterAchievementsSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.characterAchievementsSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a character's statistics as they pertain to achievements.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getCharacterAchievementStatistics(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.characterAchievementStatistics(realmSlug: realmSlug, characterName: characterName), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Character Appearance API
    
    /**
     Returns a summary of a character's appearance settings.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getCharacterAppearanceSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.characterAppearanceSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Character Collections API
    
    /**
     Returns an index of collection types for a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getCharacterCollectionsIndex(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.characterCollectionsIndex(realmSlug: realmSlug, characterName: characterName), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a summary of the mounts a character has obtained.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getCharacterMountsCollectionSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.characterMountsCollectionSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a summary of the battle pets a character has obtained.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getCharacterPetsCollectionSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.characterPetsCollectionSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Character Encounters API
    
    /**
     Returns a summary of a character's encounters.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getCharacterEncountersSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.characterEncountersSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a summary of a character's completed dungeons.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getCharacterDungeons(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.characterDungeons(realmSlug: realmSlug, characterName: characterName), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a summary of a character's completed raids.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getCharacterRaids(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.characterRaids(realmSlug: realmSlug, characterName: characterName), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Character Equipment API
    
    /**
     Returns a summary of the items equipped by a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getCharacterEquipmentSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.characterEquipmentSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace, completion: completion)
    }
    
    
    // MARK: Character Hunter Pets API
    
    /**
     If the character is a hunter, returns a summary of the character's hunter pets. Otherwise, returns an HTTP 404 Not Found error.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getCharacterHunterPetsSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.characterHunterPetsSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Character Media API
    
    /**
     Returns a summary of the media assets available for a character (such as an avatar render).
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getCharacterMediaSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.characterMediaSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace, completion: completion)
    }
    
    
    
    
    // MARK: Character Mythic Keystone Profile API
    
    /**
     Returns a Mythic Keystone Profile index for a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCharacterMythicKeystoneProfileIndex(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.characterMythicKeystoneProfileIndex(realmSlug: realmSlug, characterName: characterName), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns the Mythic Keystone season details for a character.

     - note: Returns a 404 Not Found for characters that have not yet completed a Mythic Keystone dungeon for the specified season.
     
     - parameter seasonID: The ID of the Mythic Keystone season.
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCharacterMythicKeystoneProfileSeason(seasonID: Int, characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.characterMythicKeystoneSeasonDetails(realmSlug: realmSlug, characterName: characterName, season: seasonID), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Character Professions API
    
    /**
     Returns a summary of professions for a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCharacterProfessionsSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.characterProfessionsSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Character Profile API
    
    /**
     Returns a profile summary for a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCharacterProfileSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.characterProfileSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace, completion: completion)
    }
    
    
    /**
    Returns the status and a unique ID for a character.
     
     A client should delete information about a character from their application if any of the following conditions occur:
    - an HTTP 404 Not Found error is returned
    - the is_valid value is false
    - the returned character ID doesn't match the previously recorded value for the character
    
     The following example illustrates how to use this endpoint:
     1. A client requests and stores information about a character, including its unique character ID and the timestamp of the request.
     2. After 30 days, the client makes a request to the status endpoint to verify if the character information is still valid.
     3. If character cannot be found, is not valid, or the characters IDs do not match, the client removes the information from their application.
     4. If the character is valid and the character IDs match, the client retains the data for another 30 days.
     
    - parameter characterName: The lowercase name of the character.
    - parameter realmSlug: The slug of the realm.
    - parameter namespace: The namespace to use to locate this document.
    - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getCharacterProfileStatus(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.characterProfileStatus(realmSlug: realmSlug, characterName: characterName), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Character PvP API
    
    /**
     Returns the PvP bracket statistics for a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter pvpBracket: The PvP bracket type.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCharacterPvPBracketStatistics(characterName: String, realmSlug: String, pvpBracket: WOWLeaderboardBracket, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.characterPvPBracketStatistics(realmSlug: realmSlug, characterName: characterName, pvpBracket: pvpBracket), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a PvP summary for a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCharacterPvPSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.characterPvPSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Character Quests API
    
    /**
     Returns a character's active quests as well as a link to the character's completed quests.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCharacterQuests(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.characterQuests(realmSlug: realmSlug, characterName: characterName), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a list of quests that a character has completed.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCharacterCompletedQuests(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.characterCompletedQuests(realmSlug: realmSlug, characterName: characterName), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Character Reputations API
    
    /**
     Returns a summary of a character's reputations.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCharacterReputationsSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.characterReputationsSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Character Soulbinds API
    
    /**
     Returns a character's soulbinds.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCharacterSoulbinds(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.characterSoulbinds(realmSlug: realmSlug, characterName: characterName), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Character Specializations API
    
    /**
     Returns a summary of a character's specializations.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCharacterSpecializationsSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.characterSpecializationsSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Character Statistics API
    
    /**
     Returns a statistics summary for a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCharacterStatisticsSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.characterStatisticsSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Character Titles API
    
    /**
     Returns a summary of titles a character has obtained.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCharacterTitlesSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.characterTitlesSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: Guild Profile API
    
    /**
     Returns a single guild by its name and realm.
     
     - parameter slug: The slug of the guild.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getGuild(slug: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.guild(realmSlug: realmSlug, guildSlug: slug), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a single guild's activity by name and realm.
     
     - parameter slug: The slug of the guild.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getGuildActivity(slug: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.guildActivity(realmSlug: realmSlug, guildSlug: slug), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a single guild's achievements by name and realm.
     
     - parameter slug: The slug of the guild.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getGuildAchievements(slug: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.guildAchievements(realmSlug: realmSlug, guildSlug: slug), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a single guild's roster by its name and realm.
     
     - parameter slug: The slug of the guild.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getGuildRoster(slug: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.guildRoster(realmSlug: realmSlug, guildSlug: slug), namespace: namespace, completion: completion)
    }
}

