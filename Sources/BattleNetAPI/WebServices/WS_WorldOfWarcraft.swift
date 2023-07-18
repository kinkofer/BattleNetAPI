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
    @available(*, renamed: "getAchievementCategoryIndex(namespace:)")
    public func getAchievementCategoryIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getAchievementCategoryIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getAchievementCategory(id:namespace:)")
    public func getAchievementCategory(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getAchievementCategory(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getAchievementIndex(namespace:)")
    public func getAchievementIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getAchievementIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getAchievement(id:namespace:)")
    public func getAchievement(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getAchievement(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getAchievementMedia(id:namespace:)")
    public func getAchievementMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getAchievementMedia(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getAuctions(connectedRealmID:namespace:)")
    public func getAuctions(connectedRealmID: Int, namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getAuctions(connectedRealmID: connectedRealmID, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getAzeriteEssenceIndex(namespace:)")
    public func getAzeriteEssenceIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getAzeriteEssenceIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getAzeriteEssence(id:namespace:)")
    public func getAzeriteEssence(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getAzeriteEssence(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "searchAzeriteEssence(queries:namespace:)")
    public func searchAzeriteEssence(queries: [String: String], namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await searchAzeriteEssence(queries: queries, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getAzeriteEssenceMedia(id:namespace:)")
    public func getAzeriteEssenceMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getAzeriteEssenceMedia(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getConnectedRealmIndex(namespace:)")
    public func getConnectedRealmIndex(namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getConnectedRealmIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getConnectedRealm(id:namespace:)")
    public func getConnectedRealm(id: Int, namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getConnectedRealm(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "searchConnectedRealms(queries:namespace:)")
    public func searchConnectedRealms(queries: [String: String], namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await searchConnectedRealms(queries: queries, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getCovenantIndex(namespace:)")
    public func getCovenantIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCovenantIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getCovenant(id:namespace:)")
    public func getCovenant(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCovenant(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getCovenantMedia(id:namespace:)")
    public func getCovenantMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCovenantMedia(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getSoulbindIndex(namespace:)")
    public func getSoulbindIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getSoulbindIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getSoulbind(id:namespace:)")
    public func getSoulbind(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getSoulbind(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getConduitIndex(namespace:)")
    public func getConduitIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getConduitIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getConduit(id:namespace:)")
    public func getConduit(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getConduit(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getCreatureFamilyIndex(namespace:)")
    public func getCreatureFamilyIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCreatureFamilyIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getCreatureFamily(id:namespace:)")
    public func getCreatureFamily(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCreatureFamily(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getCreatureTypeIndex(namespace:)")
    public func getCreatureTypeIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCreatureTypeIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getCreatureType(id:namespace:)")
    public func getCreatureType(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCreatureType(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getCreature(id:namespace:)")
    public func getCreature(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCreature(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "searchCreature(queries:namespace:)")
    public func searchCreature(queries: [String: String], namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await searchCreature(queries: queries, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Performs a search of creatures.
     
     - parameter queries: The fields and values to search.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func searchCreature(queries: [String: String], namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.creatureSearch(queries), namespace: namespace)
    }
    
    
    /**
     Returns media for a creature display by ID.
     
     - parameter id: The ID of the creature display.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getCreatureDisplayMedia(id:namespace:)")
    public func getCreatureDisplayMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCreatureDisplayMedia(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getCreatureFamilyMedia(id:namespace:)")
    public func getCreatureFamilyMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCreatureFamilyMedia(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getGuildCrestIndex(namespace:)")
    public func getGuildCrestIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getGuildCrestIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getGuildCrestBorderMedia(id:namespace:)")
    public func getGuildCrestBorderMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getGuildCrestBorderMedia(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getGuildCrestEmblemMedia(id:namespace:)")
    public func getGuildCrestEmblemMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getGuildCrestEmblemMedia(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
    
    /**
     Returns an index of item classes.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getItemClassIndex(namespace:)")
    public func getItemClassIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getItemClassIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of item classes.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getItemClassIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.itemClassIndex, namespace: namespace)
    }
    
    
    /**
     Returns an item class by ID.
     
     - parameter id: The ID of the item class.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getItemClass(id:namespace:)")
    public func getItemClass(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getItemClass(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an item class by ID.
     
     - parameter id: The ID of the item class.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getItemClass(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.itemClass(id), namespace: namespace)
    }
    
    
    /**
     Returns an index of item sets.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getItemSetIndex(namespace:)")
    public func getItemSetIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getItemSetIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of item sets.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getItemSetIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.itemSetIndex, namespace: namespace)
    }
    
    
    /**
     Returns an item set by ID.
     
     - parameter id: The ID of the item set.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getItemSet(id:namespace:)")
    public func getItemSet(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getItemSet(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an item set by ID.
     
     - parameter id: The ID of the item set.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getItemSet(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.itemSet(id), namespace: namespace)
    }
    
    
    /**
     Returns an item subclass by ID.
     
     - parameter itemClassID: The ID of the item class.
     - parameter itemSubclassID: The ID of the item subclass.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getItemSubclass(itemClassID:itemSubclassID:namespace:)")
    public func getItemSubclass(itemClassID: Int, itemSubclassID: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getItemSubclass(itemClassID: itemClassID, itemSubclassID: itemSubclassID, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an item subclass by ID.
     
     - parameter itemClassID: The ID of the item class.
     - parameter itemSubclassID: The ID of the item subclass.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getItemSubclass(itemClassID: Int, itemSubclassID: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.itemSubclass(itemClassID: itemClassID, itemSubclassID: itemSubclassID), namespace: namespace)
    }
    
    
    /**
     Returns an item by ID.
     
     - parameter id: The ID of the item.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getItem(id:namespace:)")
    public func getItem(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getItem(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an item by ID.
     
     - parameter id: The ID of the item.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getItem(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.item(id), namespace: namespace)
    }
    
    
    /**
     Returns media for an item by ID.
     
     - parameter id: The ID of the item.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getItemMedia(id:namespace:)")
    public func getItemMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getItemMedia(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns media for an item by ID.
     
     - parameter id: The ID of the item.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getItemMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.itemMedia(id), namespace: namespace)
    }
    
    
    /**
     Performs a search of items.
     
     - parameter queries: The fields and values to search.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "searchItem(queries:namespace:)")
    public func searchItem(queries: [String: String], namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await searchItem(queries: queries, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Performs a search of items.
     
     - parameter queries: The fields and values to search.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func searchItem(queries: [String: String], namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.itemSearch(queries), namespace: namespace)
    }
    
    
    
    // MARK: Journal API
    
    /**
     Returns an index of journal expansions.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getJournalExpansionIndex(namespace:)")
    public func getJournalExpansionIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getJournalExpansionIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of journal expansions.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getJournalExpansionIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.journalExpansionIndex, namespace: namespace)
    }
    
    
    /**
     Returns a journal expansion by ID.
     
     - parameter id: The ID of the journal expansion.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getJournalExpansion(id:namespace:)")
    public func getJournalExpansion(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getJournalExpansion(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a journal expansion by ID.
     
     - parameter id: The ID of the journal expansion.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getJournalExpansion(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.journalExpansion(id), namespace: namespace)
    }
    
    
    /**
     Returns an index of journal encounters.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getJournalEncounterIndex(namespace:)")
    public func getJournalEncounterIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getJournalEncounterIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of journal encounters.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getJournalEncounterIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.journalEncounterIndex, namespace: namespace)
    }
    
    
    /**
     Returns a journal encounter by ID.
     
     - parameter id: The ID of the journal encounter.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getJournalEncounter(id:namespace:)")
    public func getJournalEncounter(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getJournalEncounter(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a journal encounter by ID.
     
     - parameter id: The ID of the journal encounter.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getJournalEncounter(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.journalEncounter(id), namespace: namespace)
    }
    
    
    /**
     Performs a search of journal encounters.
     
     - parameter queries: The fields and values to search.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "searchJournalEncounter(queries:namespace:)")
    public func searchJournalEncounter(queries: [String: String], namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await searchJournalEncounter(queries: queries, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Performs a search of journal encounters.
     
     - parameter queries: The fields and values to search.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func searchJournalEncounter(queries: [String: String], namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.journalEncounterSearch(queries), namespace: namespace)
    }
    
    
    /**
     Returns an index of journal instances.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getJournalInstanceIndex(namespace:)")
    public func getJournalInstanceIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getJournalInstanceIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of journal instances.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getJournalInstanceIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.journalInstanceIndex, namespace: namespace)
    }
    
    
    /**
     Returns a journal instance.
     
     - parameter id: The ID of the journal instance.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getJournalInstance(id:namespace:)")
    public func getJournalInstance(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getJournalInstance(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a journal instance.
     
     - parameter id: The ID of the journal instance.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getJournalInstance(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.journalInstance(id), namespace: namespace)
    }
    
    
    /**
     Returns media for a journal instance by ID.
     
     - parameter id: The ID of the journal instance.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getJournalInstanceMedia(id:namespace:)")
    public func getJournalInstanceMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getJournalInstanceMedia(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns media for a journal instance by ID.
     
     - parameter id: The ID of the journal instance.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getJournalInstanceMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.journalInstanceMedia(id), namespace: namespace)
    }
    
    
    
    // MARK: Media Search API
    
    /**
     Performs a search of all types of media documents.
     
     - parameter queries: The fields and values to search.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "searchMedia(queries:namespace:)")
    public func searchMedia(queries: [String: String], namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await searchMedia(queries: queries, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Performs a search of all types of media documents.
     
     - parameter queries: The fields and values to search.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func searchMedia(queries: [String: String], namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.mediaSearch(queries), namespace: namespace)
    }
    
    
    
    // MARK: Modified Crafting API
    
    /**
     Returns the parent index for Modified Crafting.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getModifiedCraftingIndex(namespace:)")
    public func getModifiedCraftingIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getModifiedCraftingIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns the parent index for Modified Crafting.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getModifiedCraftingIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.modifiedCraftingIndex, namespace: namespace)
    }
    
    
    /**
     Returns the index of Modified Crafting categories.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getModifiedCraftingCategoryIndex(namespace:)")
    public func getModifiedCraftingCategoryIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getModifiedCraftingCategoryIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns the index of Modified Crafting categories.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getModifiedCraftingCategoryIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.modifiedCraftingCategoryIndex, namespace: namespace)
    }
    
    
    /**
     Returns a Modified Crafting category by ID.
     
     - parameter id: The ID of the Modified Crafting category.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getModifiedCraftingCategory(id:namespace:)")
    public func getModifiedCraftingCategory(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getModifiedCraftingCategory(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a Modified Crafting category by ID.
     
     - parameter id: The ID of the Modified Crafting category.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getModifiedCraftingCategory(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.modifiedCraftingCategory(id), namespace: namespace)
    }
    
    
    /**
     Returns the index of Modified Crafting reagent slot types.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getModifiedCraftingReagentSlotTypeIndex(namespace:)")
    public func getModifiedCraftingReagentSlotTypeIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getModifiedCraftingReagentSlotTypeIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns the index of Modified Crafting reagent slot types.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getModifiedCraftingReagentSlotTypeIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.modifiedCraftingReagentSlotTypeIndex, namespace: namespace)
    }
    
    
    /**
     Returns a Modified Crafting reagent slot type by ID.
     
     - parameter id: The ID of the Modified Crafting reagent slot type.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getModifiedCraftingReagentSlotType(id:namespace:)")
    public func getModifiedCraftingReagentSlotType(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getModifiedCraftingReagentSlotType(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a Modified Crafting reagent slot type by ID.
     
     - parameter id: The ID of the Modified Crafting reagent slot type.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getModifiedCraftingReagentSlotType(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.modifiedCraftingReagentSlotType(id), namespace: namespace)
    }
    
    
    
    // MARK: Mount API
    
    /**
     Returns an index of mounts.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getMountIndex(namespace:)")
    public func getMountIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getMountIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of mounts.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMountIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.mountIndex, namespace: namespace)
    }
    
    
    /**
     Returns a mount by ID.
     
     - parameter id: The ID of the mount.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getMount(id:namespace:)")
    public func getMount(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getMount(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a mount by ID.
     
     - parameter id: The ID of the mount.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMount(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.mount(id), namespace: namespace)
    }
    
    
    /**
     Performs a search of mounts.
     
     - parameter queries: The fields and values to search.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "searchMount(queries:namespace:)")
    public func searchMount(queries: [String: String], namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await searchMount(queries: queries, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Performs a search of mounts.
     
     - parameter queries: The fields and values to search.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func searchMount(queries: [String: String], namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.mountSearch(queries), namespace: namespace)
    }
    
    
    
    // MARK: Mythic Keystone Affix API
    
    /**
     Returns an index of mythic keystone affixes.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getMythicKeystoneAffixIndex(namespace:)")
    public func getMythicKeystoneAffixIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getMythicKeystoneAffixIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of mythic keystone affixes.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMythicKeystoneAffixIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.mythicKeystoneAffixIndex, namespace: namespace)
    }
    
    
    /**
     Returns a mythic keystone affix by ID.
     
     - parameter id: The ID of the mythic keystone affix.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getMythicKeystoneAffix(id:namespace:)")
    public func getMythicKeystoneAffix(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getMythicKeystoneAffix(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a mythic keystone affix by ID.
     
     - parameter id: The ID of the mythic keystone affix.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMythicKeystoneAffix(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.mythicKeystoneAffix(id), namespace: namespace)
    }
    
    
    /**
     Returns media for a mythic keystone affix by ID.
     
     - parameter id: The ID of the mythic keystone affix.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getMythicKeystoneAffixMedia(id:namespace:)")
    public func getMythicKeystoneAffixMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getMythicKeystoneAffixMedia(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns media for a mythic keystone affix by ID.
     
     - parameter id: The ID of the mythic keystone affix.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMythicKeystoneAffixMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.mythicKeystoneAffixMedia(id), namespace: namespace)
    }
    
    
    
    // MARK: Mythic Keystone Dungeon API
    
    /**
     Returns an index of Mythic Keystone dungeons.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getMythicKeystoneDungeonIndex(namespace:)")
    public func getMythicKeystoneDungeonIndex(namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getMythicKeystoneDungeonIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of Mythic Keystone dungeons.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMythicKeystoneDungeonIndex(namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.mythicKeystoneDungeonIndex, namespace: namespace)
    }
    
    
    /**
     Returns a Mythic Keystone dungeon by ID.
     
     - parameter id: The ID of the dungeon.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getMythicKeystoneDungeon(id:namespace:)")
    public func getMythicKeystoneDungeon(id: Int, namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getMythicKeystoneDungeon(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a Mythic Keystone dungeon by ID.
     
     - parameter id: The ID of the dungeon.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMythicKeystoneDungeon(id: Int, namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.mythicKeystoneDungeon(id), namespace: namespace)
    }
    
    
    /**
     Returns an index of links to other documents related to Mythic Keystone dungeons.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getMythicKeystoneIndex(namespace:)")
    public func getMythicKeystoneIndex(namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getMythicKeystoneIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of links to other documents related to Mythic Keystone dungeons.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMythicKeystoneIndex(namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.mythicKeystoneIndex, namespace: namespace)
    }
    
    
    /**
     Returns an index of Mythic Keystone periods.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getMythicKeystonePeriodIndex(namespace:)")
    public func getMythicKeystonePeriodIndex(namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getMythicKeystonePeriodIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of Mythic Keystone periods.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMythicKeystonePeriodIndex(namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.mythicKeystonePeriodIndex, namespace: namespace)
    }
    
    
    /**
     Returns a Mythic Keystone period by ID.
     
     - parameter id: The ID of the Mythic Keystone season period.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getMythicKeystonePeriod(id:namespace:)")
    public func getMythicKeystonePeriod(id: Int, namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getMythicKeystonePeriod(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a Mythic Keystone period by ID.
     
     - parameter id: The ID of the Mythic Keystone season period.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMythicKeystonePeriod(id: Int, namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.mythicKeystonePeriod(id), namespace: namespace)
    }
    
    
    /**
     Returns an index of Mythic Keystone seasons.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getMythicKeystoneSeasonIndex(namespace:)")
    public func getMythicKeystoneSeasonIndex(namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getMythicKeystoneSeasonIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of Mythic Keystone seasons.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMythicKeystoneSeasonIndex(namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.mythicKeystoneSeasonIndex, namespace: namespace)
    }
    
    
    /**
     Returns a Mythic Keystone season by ID.
     
     - parameter id: The ID of the Mythic Keystone season.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getMythicKeystoneSeason(id:namespace:)")
    public func getMythicKeystoneSeason(id: Int, namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getMythicKeystoneSeason(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a Mythic Keystone season by ID.
     
     - parameter id: The ID of the Mythic Keystone season.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMythicKeystoneSeason(id: Int, namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.mythicKeystoneSeasonIndex, namespace: namespace)
    }
    
    
    
    // MARK: Mythic Keystone Leaderboard API
    
    /**
     Returns an index of Mythic Keystone Leaderboard dungeon instances for a connected realm.
     
     - parameter connectedRealmID: The ID of the connected realm
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getMythicLeaderboardIndex(connectedRealmID:namespace:)")
    public func getMythicLeaderboardIndex(connectedRealmID: Int, namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getMythicLeaderboardIndex(connectedRealmID: connectedRealmID, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of Mythic Keystone Leaderboard dungeon instances for a connected realm.
     
     - parameter connectedRealmID: The ID of the connected realm
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMythicLeaderboardIndex(connectedRealmID: Int, namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.mythicKeystoneLeaderboardIndex(connectedRealmID: connectedRealmID), namespace: namespace)
    }
    
    
    /**
     Returns a weekly Mythic Keystone Leaderboard by period.
     
     - parameter connectedRealmID: The id of the connected realm
     - parameter dungeonID: The id of the dungeon
     - parameter period: The unique identifier for the leaderboard period
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getMythicLeaderboard(connectedRealmID:dungeonID:period:namespace:)")
    public func getMythicLeaderboard(connectedRealmID: Int, dungeonID: Int, period: Int, namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getMythicLeaderboard(connectedRealmID: connectedRealmID, dungeonID: dungeonID, period: period, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a weekly Mythic Keystone Leaderboard by period.
     
     - parameter connectedRealmID: The id of the connected realm
     - parameter dungeonID: The id of the dungeon
     - parameter period: The unique identifier for the leaderboard period
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMythicLeaderboard(connectedRealmID: Int, dungeonID: Int, period: Int, namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.mythicKeystoneLeaderboard(connectedRealmID: connectedRealmID, dungeonID: dungeonID, period: period), namespace: namespace)
    }
    
    
    
    // MARK: Mythic Raid Leaderboard API
    
    /**
     Returns the leaderboard for a given raid and faction.
     
     - parameter raid: The raid for a leaderboard
     - parameter faction: Player faction ('alliance' or 'horde')
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getMythicRaidLeaderboard(raid:faction:namespace:)")
    public func getMythicRaidLeaderboard(raid: String, faction: FactionType, namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getMythicRaidLeaderboard(raid: raid, faction: faction, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns the leaderboard for a given raid and faction.
     
     - parameter raid: The raid for a leaderboard
     - parameter faction: Player faction ('alliance' or 'horde')
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMythicRaidLeaderboard(raid: String, faction: FactionType, namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.mythicRaidLeaderboard(raid: raid, faction: faction), namespace: namespace)
    }
    
    
    
    // MARK: Pet API
    
    /**
     Returns an index of battle pets.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPetIndex(namespace:)")
    public func getPetIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getPetIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of battle pets.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPetIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.petIndex, namespace: namespace)
    }
    
    
    /**
     Returns a battle pets by ID.
     
     - parameter id: The ID of the pet.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPet(id:namespace:)")
    public func getPet(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getPet(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a battle pets by ID.
     
     - parameter id: The ID of the pet.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPet(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.pet(id), namespace: namespace)
    }
    
    
    /**
     Returns media for a battle pet by ID.
     
     - parameter id: The ID of the pet.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPetMedia(id:namespace:)")
    public func getPetMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getPetMedia(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns media for a battle pet by ID.
     
     - parameter id: The ID of the pet.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPetMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.petMedia(id), namespace: namespace)
    }
    
    
    /**
     Returns an index of pet abilities.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPetAbilityIndex(namespace:)")
    public func getPetAbilityIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getPetAbilityIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of pet abilities.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPetAbilityIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.petAbilityIndex, namespace: namespace)
    }
    
    
    /**
     Returns a pet ability by ID.
     
     - parameter id: The ID of the pet ability.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPetAbility(id:namespace:)")
    public func getPetAbility(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getPetAbility(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a pet ability by ID.
     
     - parameter id: The ID of the pet ability.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPetAbility(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.petAbility(id), namespace: namespace)
    }
    
    
    /**
     Returns media for a pet ability by ID.
     
     - parameter id: The ID of the pet ability.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPetAbilityMedia(id:namespace:)")
    public func getPetAbilityMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getPetAbilityMedia(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns media for a pet ability by ID.
     
     - parameter id: The ID of the pet ability.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPetAbilityMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.petAbilityMedia(id), namespace: namespace)
    }
    
    
    
    // MARK: Playable Class API
    
    /**
     Returns an index of playable classes.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPlayableClassIndex(namespace:)")
    public func getPlayableClassIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getPlayableClassIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of playable classes.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPlayableClassIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.playableClassIndex, namespace: namespace)
    }
    
    
    /**
     Returns a playable class by ID.
     
     - parameter id: The ID of the playable class.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPlayableClass(id:namespace:)")
    public func getPlayableClass(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getPlayableClass(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a playable class by ID.
     
     - parameter id: The ID of the playable class.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPlayableClass(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.playableClass(id), namespace: namespace)
    }
    
    
    /**
     Returns media for a playable class by ID.
     
     - parameter id: The ID of the playable class.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPlayableClassMedia(id:namespace:)")
    public func getPlayableClassMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getPlayableClassMedia(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns media for a playable class by ID.
     
     - parameter id: The ID of the playable class.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPlayableClassMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.playableClassMedia(id), namespace: namespace)
    }
    
    
    /**
     Returns the PvP talent slots for a playable class by ID.
     
     - parameter classID: The ID of the playable class.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPlayableClassPvPTalentSlots(classID:namespace:)")
    public func getPlayableClassPvPTalentSlots(classID: Int, namespace: APINamespace? = .static,completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getPlayableClassPvPTalentSlots(classID: classID, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns the PvP talent slots for a playable class by ID.
     
     - parameter classID: The ID of the playable class.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPlayableClassPvPTalentSlots(classID: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.pvpTalentSlots(classID: classID), namespace: namespace)
    }
    
    
    
    // MARK: Playable Race API
    
    /**
     Returns an index of playable races.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPlayableRaceIndex(namespace:)")
    public func getPlayableRaceIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getPlayableRaceIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of playable races.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPlayableRaceIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.playableRaceIndex, namespace: namespace)
    }
    
    
    /**
     Returns a playable race by ID.
     
     - parameter id: The ID of the playable race.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPlayableRace(id:namespace:)")
    public func getPlayableRace(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getPlayableRace(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a playable race by ID.
     
     - parameter id: The ID of the playable race.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPlayableRace(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.playableRace(id), namespace: namespace)
    }
    
    
    
    // MARK: Playable Specialization API
    
    /**
     Returns an index of playable specializations.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPlayableSpecializationIndex(namespace:)")
    public func getPlayableSpecializationIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getPlayableSpecializationIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of playable specializations.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPlayableSpecializationIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.playableSpecializationIndex, namespace: namespace)
    }
    
    
    /**
     Returns a playable specialization by ID.
     
     - parameter id: The ID of the playable specialization.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPlayableSpecialization(id:namespace:)")
    public func getPlayableSpecialization(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getPlayableSpecialization(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a playable specialization by ID.
     
     - parameter id: The ID of the playable specialization.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPlayableSpecialization(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.playableSpecialization(id), namespace: namespace)
    }
    
    
    /**
     Returns media for a playable specialization by ID.
     
     - parameter id: The ID of the playable specialization.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPlayableSpecializationMedia(id:namespace:)")
    public func getPlayableSpecializationMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getPlayableSpecializationMedia(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns media for a playable specialization by ID.
     
     - parameter id: The ID of the playable specialization.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPlayableSpecializationMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.playableSpecializationMedia(id), namespace: namespace)
    }
    
    
    
    // MARK: Power Type API
    
    /**
     Returns an index of power types.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPowerTypeIndex(namespace:)")
    public func getPowerTypeIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getPowerTypeIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of power types.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPowerTypeIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.powerTypeIndex, namespace: namespace)
    }
    
    
    /**
     Returns a power type by ID.
     
     - parameter id: The ID of the power type.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPowerType(id:namespace:)")
    public func getPowerType(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getPowerType(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a power type by ID.
     
     - parameter id: The ID of the power type.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPowerType(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.powerType(id), namespace: namespace)
    }
    
    
    
    // MARK: Profession API
    
    /**
     Returns an index of professions.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getProfessionIndex(namespace:)")
    public func getProfessionIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getProfessionIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of professions.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getProfessionIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.professionIndex, namespace: namespace)
    }
    
    
    /**
     Returns a profession by ID.
     
     - parameter id: The ID of the profession.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getProfession(id:namespace:)")
    public func getProfession(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getProfession(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a profession by ID.
     
     - parameter id: The ID of the profession.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getProfession(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.profession(id), namespace: namespace)
    }
    
    
    /**
     Returns media for a profession by ID.
     
     - parameter id: The ID of the profession.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getProfessionMedia(id:namespace:)")
    public func getProfessionMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getProfessionMedia(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns media for a profession by ID.
     
     - parameter id: The ID of the profession.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getProfessionMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.professionMedia(id), namespace: namespace)
    }
    
    
    /**
     Returns a skill tier for a profession by ID.
     
     - parameter professionID: The ID of the profession.
     - parameter skillTierID: The ID of the skill tier.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getProfessionSkillTier(professionID:skillTierID:namespace:)")
    public func getProfessionSkillTier(professionID: Int, skillTierID: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getProfessionSkillTier(professionID: professionID, skillTierID: skillTierID, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a skill tier for a profession by ID.
     
     - parameter professionID: The ID of the profession.
     - parameter skillTierID: The ID of the skill tier.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getProfessionSkillTier(professionID: Int, skillTierID: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.professionSkillTier(professionID: professionID, skillTierID: skillTierID), namespace: namespace)
    }
    
    
    /**
     Returns a recipe by ID.
     
     - parameter id: The ID of the recipe.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getRecipe(id:namespace:)")
    public func getRecipe(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getRecipe(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a recipe by ID.
     
     - parameter id: The ID of the recipe.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getRecipe(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.recipe(id), namespace: namespace)
    }
    
    
    /**
     Returns media for a recipe by ID.
     
     - parameter id: The ID of the recipe.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getRecipeMedia(id:namespace:)")
    public func getRecipeMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getRecipeMedia(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns media for a recipe by ID.
     
     - parameter id: The ID of the recipe.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getRecipeMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.recipeMedia(id), namespace: namespace)
    }
    
    
    
    // MARK: PvP Season API
    
    /**
     Returns an index of PvP seasons.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPvPSeasonIndex(namespace:)")
    public func getPvPSeasonIndex(namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getPvPSeasonIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of PvP seasons.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPvPSeasonIndex(namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.pvpSeasonIndex, namespace: namespace)
    }
    
    
    /**
     Returns a PvP season by ID.
     
     - parameter id: The ID of the PvP season.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPvPSeason(id:namespace:)")
    public func getPvPSeason(id: Int, namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getPvPSeason(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a PvP season by ID.
     
     - parameter id: The ID of the PvP season.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPvPSeason(id: Int, namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.pvpSeason(id), namespace: namespace)
    }
    
    
    /**
     Returns an index of PvP leaderboards for a PvP season.
     
     - parameter pvpSeasonID: The ID of the PvP season.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPvPLeaderboardIndex(pvpSeasonID:namespace:)")
    public func getPvPLeaderboardIndex(pvpSeasonID: Int, namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getPvPLeaderboardIndex(pvpSeasonID: pvpSeasonID, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of PvP leaderboards for a PvP season.
     
     - parameter pvpSeasonID: The ID of the PvP season.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPvPLeaderboardIndex(pvpSeasonID: Int, namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.pvpLeaderboardIndex(season: pvpSeasonID), namespace: namespace)
    }
    
    
    /**
     Returns the PvP leaderboard of a specific PvP bracket for a PvP season.
     
     - parameter pvpSeasonID: The ID of the PvP season.
     - parameter pvpBracket: The PvP bracket type.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPvPLeaderboard(pvpSeasonID:pvpBracket:namespace:)")
    public func getPvPLeaderboard(pvpSeasonID: Int, pvpBracket: WOWLeaderboardBracket, namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getPvPLeaderboard(pvpSeasonID: pvpSeasonID, pvpBracket: pvpBracket, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns the PvP leaderboard of a specific PvP bracket for a PvP season.
     
     - parameter pvpSeasonID: The ID of the PvP season.
     - parameter pvpBracket: The PvP bracket type.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPvPLeaderboard(pvpSeasonID: Int, pvpBracket: WOWLeaderboardBracket, namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.pvpLeaderboard(season: pvpSeasonID, pvpBracket: pvpBracket), namespace: namespace)
    }
    
    
    /**
     Returns an index of PvP rewards for a PvP season.
     
     - parameter pvpSeasonID: The ID of the PvP season.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPvPRewardIndex(pvpSeasonID:namespace:)")
    public func getPvPRewardIndex(pvpSeasonID: Int, namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getPvPRewardIndex(pvpSeasonID: pvpSeasonID, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of PvP rewards for a PvP season.
     
     - parameter pvpSeasonID: The ID of the PvP season.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPvPRewardIndex(pvpSeasonID: Int, namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.pvpRewardIndex(season: pvpSeasonID), namespace: namespace)
    }
    
    
    
    // MARK: PvP Tier API
    
    /**
     Returns media for a PvP tier by ID.
     
     - parameter id: The ID of the PvP tier.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPvPTierMedia(id:namespace:)")
    public func getPvPTierMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getPvPTierMedia(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns media for a PvP tier by ID.
     
     - parameter id: The ID of the PvP tier.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPvPTierMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.pvpTierMedia(id), namespace: namespace)
    }
    
    
    /**
     Returns an index of PvP tiers.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPvPTierIndex(namespace:)")
    public func getPvPTierIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getPvPTierIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of PvP tiers.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPvPTierIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.pvpTierIndex, namespace: namespace)
    }
    
    
    /**
     Returns a PvP tier by ID.
     
     - parameter id: The ID of the PvP tier.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPvPTier(id:namespace:)")
    public func getPvPTier(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getPvPTier(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a PvP tier by ID.
     
     - parameter id: The ID of the PvP tier.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPvPTier(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.pvpTier(id), namespace: namespace)
    }
    
    
    
    // MARK: Quest API
    
    /**
     Returns an index of quests.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getQuestIndex(namespace:)")
    public func getQuestIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getQuestIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of quests.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getQuestIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.questIndex, namespace: namespace)
    }
    
    
    /**
     Returns a quest by ID.
     
     - parameter id: The ID of the quest.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getQuest(id:namespace:)")
    public func getQuest(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getQuest(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a quest by ID.
     
     - parameter id: The ID of the quest.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getQuest(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.quest(id), namespace: namespace)
    }
    
    
    /**
     Returns an index of quest categories (such as quests for a specific class, profession, or storyline).
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getQuestCategoryIndex(namespace:)")
    public func getQuestCategoryIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getQuestCategoryIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of quest categories (such as quests for a specific class, profession, or storyline).
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getQuestCategoryIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.questCategoryIndex, namespace: namespace)
    }
    
    
    /**
     Returns a quest category by ID.
     
     - parameter id: The ID of the quest category.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getQuestCategory(id:namespace:)")
    public func getQuestCategory(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getQuestCategory(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a quest category by ID.
     
     - parameter id: The ID of the quest category.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getQuestCategory(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.questCategory(id), namespace: namespace)
    }
    
    
    /**
     Returns an index of quest areas.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getQuestAreaIndex(namespace:)")
    public func getQuestAreaIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getQuestAreaIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of quest areas.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getQuestAreaIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.questAreaIndex, namespace: namespace)
    }
    
    
    /**
     Returns a quest area by ID.
     
     - parameter id: The ID of the quest area.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getQuestArea(id:namespace:)")
    public func getQuestArea(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getQuestArea(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a quest area by ID.
     
     - parameter id: The ID of the quest area.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getQuestArea(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.questArea(id), namespace: namespace)
    }
    
    
    /**
     Returns an index of quest types (such as PvP quests, raid quests, or account quests).
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getQuestTypeIndex(namespace:)")
    public func getQuestTypeIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getQuestTypeIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of quest types (such as PvP quests, raid quests, or account quests).
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getQuestTypeIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.questTypeIndex, namespace: namespace)
    }
    
    
    /**
     Returns a quest type by ID.
     
     - parameter id: The ID of the quest type.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getQuestType(id:namespace:)")
    public func getQuestType(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getQuestType(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a quest type by ID.
     
     - parameter id: The ID of the quest type.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getQuestType(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await self.call(endpoint: API.questType(id), namespace: namespace)
    }
    
    
    
    // MARK: Realm API
    
    /**
     Returns an index of realms.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getRealmIndex(namespace:)")
    public func getRealmIndex(namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getRealmIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of realms.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getRealmIndex(namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.realmIndex, namespace: namespace)
    }
    
    
    /**
     Returns a single realm by slug or ID.
     
     - parameter slug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getRealm(_:namespace:)")
    public func getRealm(_ slug: String, namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getRealm(slug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a single realm by slug or ID.
     
     - parameter slug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getRealm(_ slug: String, namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await self.call(endpoint: API.realm(slug), namespace: namespace)
    }
    
    
    /**
     Performs a search of realms.
     
     - parameter queries: The fields and values to search.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "searchRealm(queries:namespace:)")
    public func searchRealm(queries: [String: String], namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await searchRealm(queries: queries, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Performs a search of realms.
     
     - parameter queries: The fields and values to search.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func searchRealm(queries: [String: String], namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await call(endpoint: API.realmSearch(queries), namespace: namespace)
    }
    
    
    
    // MARK: Region API
    
    /**
     Returns an index of regions.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getRegionIndex(namespace:)")
    public func getRegionIndex(namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getRegionIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of regions.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getRegionIndex(namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await call(endpoint: API.regionIndex, namespace: namespace)
    }
    
    
    /**
     Returns a region by ID.
     
     - parameter id: The ID of the region.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getRegion(id:namespace:)")
    public func getRegion(id: Int, namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getRegion(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a region by ID.
     
     - parameter id: The ID of the region.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getRegion(id: Int, namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await call(endpoint: API.region(id), namespace: namespace)
    }
    
    
    
    // MARK: Reputations API
    
    /**
     Returns an index of reputation factions.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getReputationFactionIndex(namespace:)")
    public func getReputationFactionIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getReputationFactionIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of reputation factions.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getReputationFactionIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.reputationFactionIndex, namespace: namespace)
    }
    
    
    /**
     Returns a single reputation faction by ID.
     
     - parameter id: The ID of the reputation faction.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getReputationFaction(id:namespace:)")
    public func getReputationFaction(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getReputationFaction(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a single reputation faction by ID.
     
     - parameter id: The ID of the reputation faction.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getReputationFaction(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.reputationFaction(id), namespace: namespace)
    }
    
    
    /**
     Returns an index of reputation tiers.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getReputationTierIndex(namespace:)")
    public func getReputationTierIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getReputationTierIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of reputation tiers.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getReputationTierIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.reputationTierIndex, namespace: namespace)
    }
    
    
    /**
     Returns a single set of reputation tiers by ID.
     
     - parameter id: The ID of the set of reputation tiers.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getReputationTier(id:namespace:)")
    public func getReputationTier(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getReputationTier(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a single set of reputation tiers by ID.
     
     - parameter id: The ID of the set of reputation tiers.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getReputationTier(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.reputationTier(id), namespace: namespace)
    }
    
    
    
    // MARK: Spell API
    
    /**
     Returns a spell by ID.
     
     - parameter id: The ID of the spell.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getSpell(id:namespace:)")
    public func getSpell(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getSpell(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a spell by ID.
     
     - parameter id: The ID of the spell.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getSpell(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.spell(id), namespace: namespace)
    }
    
    
    /**
     Returns media for a spell by ID.
     
     - parameter id: The ID of the spell.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getSpellMedia(id:namespace:)")
    public func getSpellMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getSpellMedia(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns media for a spell by ID.
     
     - parameter id: The ID of the spell.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getSpellMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.spellMedia(id), namespace: namespace)
    }
    
    
    /**
     Performs a search of spells.
     
     - parameter queries: The fields and values to search.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "searchSpell(queries:namespace:)")
    public func searchSpell(queries: [String: String], namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await searchSpell(queries: queries, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Performs a search of spells.
     
     - parameter queries: The fields and values to search.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func searchSpell(queries: [String: String], namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.spellSearch(queries), namespace: namespace)
    }
    
    
    
    // MARK: Talent API
    
    /**
     Returns an index of talents.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getTalentIndex(namespace:)")
    public func getTalentIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getTalentIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of talents.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getTalentIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.talentIndex, namespace: namespace)
    }
    
    
    /**
     Returns a talent by ID.
     
     - parameter id: The ID of the talent.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getTalent(id:namespace:)")
    public func getTalent(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getTalent(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a talent by ID.
     
     - parameter id: The ID of the talent.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getTalent(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.talent(id), namespace: namespace)
    }
    
    
    /**
     Returns an index of PvP talents.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPvPTalentIndex(namespace:)")
    public func getPvPTalentIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getPvPTalentIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of PvP talents.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPvPTalentIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.pvpTalentIndex, namespace: namespace)
    }
    
    
    /**
     Returns a PvP talent by ID.
     
     - parameter id: The ID of the PvP talent.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPvPTalent(id:namespace:)")
    public func getPvPTalent(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getPvPTalent(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a PvP talent by ID.
     
     - parameter id: The ID of the PvP talent.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPvPTalent(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.pvpTalent(id), namespace: namespace)
    }
    
    
    
    // MARK: Tech Talent API
    
    /**
     Returns an index of tech talent trees.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getTechTalentTreeIndex(namespace:)")
    public func getTechTalentTreeIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getTechTalentTreeIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of tech talent trees.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getTechTalentTreeIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.techTalentTreeIndex, namespace: namespace)
    }
    
    
    /**
     Returns a tech talent tree by ID.
     
     - parameter id: The ID of the tech talent tree.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getTechTalentTree(id:namespace:)")
    public func getTechTalentTree(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getTechTalentTree(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a tech talent tree by ID.
     
     - parameter id: The ID of the tech talent tree.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getTechTalentTree(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.techTalentTree(id), namespace: namespace)
    }
    
    
    /**
     Returns an index of tech talents.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getTechTalentIndex(namespace:)")
    public func getTechTalentIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getTechTalentIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of tech talents.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getTechTalentIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.techTalentIndex, namespace: namespace)
    }
    
    
    /**
     Returns a tech talent by ID.
     
     - parameter id: The ID of the tech talent.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getTechTalent(id:namespace:)")
    public func getTechTalent(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getTechTalent(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a tech talent by ID.
     
     - parameter id: The ID of the tech talent.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getTechTalent(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.techTalent(id), namespace: namespace)
    }
    
    
    /**
     Returns media for a tech talent by ID.
     
     - parameter id: The ID of the tech talent.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getTechTalentMedia(id:namespace:)")
    public func getTechTalentMedia(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getTechTalentMedia(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns media for a tech talent by ID.
     
     - parameter id: The ID of the tech talent.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getTechTalentMedia(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.techTalentMedia(id), namespace: namespace)
    }
    
    
    
    // MARK: Title API
    
    /**
     Returns an index of titles.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getTitleIndex(namespace:)")
    public func getTitleIndex(namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getTitleIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of titles.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getTitleIndex(namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.titleIndex, namespace: namespace)
    }
    
    
    /**
     Returns a title by ID.
     
     - parameter id: The ID of the title.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getTitle(id:namespace:)")
    public func getTitle(id: Int, namespace: APINamespace? = .static, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getTitle(id: id, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a title by ID.
     
     - parameter id: The ID of the title.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getTitle(id: Int, namespace: APINamespace? = .static) async throws -> Data {
        return try await call(endpoint: API.title(id), namespace: namespace)
    }
    
    
    
    // MARK: Token API
    
    /**
     Returns the WoW Token index.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getTokenIndex(namespace:)")
    public func getTokenIndex(namespace: APINamespace? = .dynamic, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getTokenIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns the WoW Token index.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getTokenIndex(namespace: APINamespace? = .dynamic) async throws -> Data {
        return try await call(endpoint: API.tokenIndex, namespace: namespace)
    }
    
    
    
    // MARK: - Profile API
    
    // MARK: Account Profile API
    
    /**
     Returns a profile summary for an account.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getAccountProfile(namespace:)")
    public func getAccountProfile(namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getAccountProfile(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a profile summary for an account.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getAccountProfile(namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.accountProfileSummary, namespace: namespace)
    }
    
    
    /**
     Returns a protected profile summary for a character.
     
     - parameter id: The ID of the character.
     - parameter realmID: The ID of the character's realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getProtectedCharacterProfile(id:realmID:namespace:)")
    public func getProtectedCharacterProfile(id: Int, realmID: Int, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getProtectedCharacterProfile(id: id, realmID: realmID, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a protected profile summary for a character.
     
     - parameter id: The ID of the character.
     - parameter realmID: The ID of the character's realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getProtectedCharacterProfile(id: Int, realmID: Int, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.protectedCharacterProfileSummary(realmID: realmID, characterID: id), namespace: namespace)
    }
    
    
    /**
     Returns an index of collection types for an account.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getAccountCollectionsIndex(namespace:)")
    public func getAccountCollectionsIndex(namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getAccountCollectionsIndex(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of collection types for an account.
     
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getAccountCollectionsIndex(namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.accountCollectionsIndex, namespace: namespace)
    }
    
    
    /**
     Returns a summary of the mounts an account has obtained.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getMountsCollectionSummary(namespace:)")
    public func getMountsCollectionSummary(namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getMountsCollectionSummary(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a summary of the mounts an account has obtained.
     
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getMountsCollectionSummary(namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.accountMountsCollectionSummary, namespace: namespace)
    }
    
    
    /**
     Returns a summary of the battle pets an account has obtained.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getPetsCollectionSummary(namespace:)")
    public func getPetsCollectionSummary(namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getPetsCollectionSummary(namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a summary of the battle pets an account has obtained.
     
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getPetsCollectionSummary(namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.accountPetsCollectionSummary, namespace: namespace)
    }
    
    
    
    // MARK: Character Achievements API
    
    /**
     Returns a summary of the achievements a character has completed.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getCharacterAchievementsSummary(characterName:realmSlug:namespace:)")
    public func getCharacterAchievementsSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterAchievementsSummary(characterName: characterName, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a summary of the achievements a character has completed.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getCharacterAchievementsSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterAchievementsSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    /**
     Returns a character's statistics as they pertain to achievements.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getCharacterAchievementStatistics(characterName:realmSlug:namespace:)")
    public func getCharacterAchievementStatistics(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterAchievementStatistics(characterName: characterName, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a character's statistics as they pertain to achievements.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getCharacterAchievementStatistics(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterAchievementStatistics(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Character Appearance API
    
    /**
     Returns a summary of a character's appearance settings.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getCharacterAppearanceSummary(characterName:realmSlug:namespace:)")
    public func getCharacterAppearanceSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterAppearanceSummary(characterName: characterName, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a summary of a character's appearance settings.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getCharacterAppearanceSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterAppearanceSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Character Collections API
    
    /**
     Returns an index of collection types for a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getCharacterCollectionsIndex(characterName:realmSlug:namespace:)")
    public func getCharacterCollectionsIndex(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterCollectionsIndex(characterName: characterName, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of collection types for a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getCharacterCollectionsIndex(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterCollectionsIndex(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    /**
     Returns a summary of the mounts a character has obtained.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getCharacterMountsCollectionSummary(characterName:realmSlug:namespace:)")
    public func getCharacterMountsCollectionSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterMountsCollectionSummary(characterName: characterName, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a summary of the mounts a character has obtained.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getCharacterMountsCollectionSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterMountsCollectionSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    /**
     Returns a summary of the battle pets a character has obtained.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getCharacterPetsCollectionSummary(characterName:realmSlug:namespace:)")
    public func getCharacterPetsCollectionSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterPetsCollectionSummary(characterName: characterName, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a summary of the battle pets a character has obtained.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getCharacterPetsCollectionSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterPetsCollectionSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Character Encounters API
    
    /**
     Returns a summary of a character's encounters.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getCharacterEncountersSummary(characterName:realmSlug:namespace:)")
    public func getCharacterEncountersSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterEncountersSummary(characterName: characterName, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a summary of a character's encounters.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getCharacterEncountersSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterEncountersSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    /**
     Returns a summary of a character's completed dungeons.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getCharacterDungeons(characterName:realmSlug:namespace:)")
    public func getCharacterDungeons(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterDungeons(characterName: characterName, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a summary of a character's completed dungeons.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getCharacterDungeons(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterDungeons(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    /**
     Returns a summary of a character's completed raids.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getCharacterRaids(characterName:realmSlug:namespace:)")
    public func getCharacterRaids(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterRaids(characterName: characterName, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a summary of a character's completed raids.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getCharacterRaids(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterRaids(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Character Equipment API
    
    /**
     Returns a summary of the items equipped by a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getCharacterEquipmentSummary(characterName:realmSlug:namespace:)")
    public func getCharacterEquipmentSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterEquipmentSummary(characterName: characterName, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a summary of the items equipped by a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getCharacterEquipmentSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterEquipmentSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    // MARK: Character Hunter Pets API
    
    /**
     If the character is a hunter, returns a summary of the character's hunter pets. Otherwise, returns an HTTP 404 Not Found error.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getCharacterHunterPetsSummary(characterName:realmSlug:namespace:)")
    public func getCharacterHunterPetsSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterHunterPetsSummary(characterName: characterName, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     If the character is a hunter, returns a summary of the character's hunter pets. Otherwise, returns an HTTP 404 Not Found error.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getCharacterHunterPetsSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterHunterPetsSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Character Media API
    
    /**
     Returns a summary of the media assets available for a character (such as an avatar render).
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getCharacterMediaSummary(characterName:realmSlug:namespace:)")
    public func getCharacterMediaSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterMediaSummary(characterName: characterName, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a summary of the media assets available for a character (such as an avatar render).
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getCharacterMediaSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterMediaSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    
    // MARK: Character Mythic Keystone Profile API
    
    /**
     Returns a Mythic Keystone Profile index for a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getCharacterMythicKeystoneProfileIndex(characterName:realmSlug:namespace:)")
    public func getCharacterMythicKeystoneProfileIndex(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterMythicKeystoneProfileIndex(characterName: characterName, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a Mythic Keystone Profile index for a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterMythicKeystoneProfileIndex(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterMythicKeystoneProfileIndex(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
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
    @available(*, renamed: "getCharacterMythicKeystoneProfileSeason(seasonID:characterName:realmSlug:namespace:)")
    public func getCharacterMythicKeystoneProfileSeason(seasonID: Int, characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterMythicKeystoneProfileSeason(seasonID: seasonID, characterName: characterName, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns the Mythic Keystone season details for a character.

     - note: Returns a 404 Not Found for characters that have not yet completed a Mythic Keystone dungeon for the specified season.
     
     - parameter seasonID: The ID of the Mythic Keystone season.
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterMythicKeystoneProfileSeason(seasonID: Int, characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterMythicKeystoneSeasonDetails(realmSlug: realmSlug, characterName: characterName, season: seasonID), namespace: namespace)
    }
    
    
    
    // MARK: Character Professions API
    
    /**
     Returns a summary of professions for a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getCharacterProfessionsSummary(characterName:realmSlug:namespace:)")
    public func getCharacterProfessionsSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterProfessionsSummary(characterName: characterName, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a summary of professions for a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterProfessionsSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterProfessionsSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Character Profile API
    
    /**
     Returns a profile summary for a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getCharacterProfileSummary(characterName:realmSlug:namespace:)")
    public func getCharacterProfileSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterProfileSummary(characterName: characterName, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a profile summary for a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterProfileSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterProfileSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
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
    @available(*, renamed: "getCharacterProfileStatus(characterName:realmSlug:namespace:)")
    public func getCharacterProfileStatus(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterProfileStatus(characterName: characterName, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
    */
    public func getCharacterProfileStatus(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterProfileStatus(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
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
    @available(*, renamed: "getCharacterPvPBracketStatistics(characterName:realmSlug:pvpBracket:namespace:)")
    public func getCharacterPvPBracketStatistics(characterName: String, realmSlug: String, pvpBracket: WOWLeaderboardBracket, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterPvPBracketStatistics(characterName: characterName, realmSlug: realmSlug, pvpBracket: pvpBracket, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns the PvP bracket statistics for a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter pvpBracket: The PvP bracket type.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterPvPBracketStatistics(characterName: String, realmSlug: String, pvpBracket: WOWLeaderboardBracket, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterPvPBracketStatistics(realmSlug: realmSlug, characterName: characterName, pvpBracket: pvpBracket), namespace: namespace)
    }
    
    
    /**
     Returns a PvP summary for a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getCharacterPvPSummary(characterName:realmSlug:namespace:)")
    public func getCharacterPvPSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterPvPSummary(characterName: characterName, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a PvP summary for a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterPvPSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterPvPSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Character Quests API
    
    /**
     Returns a character's active quests as well as a link to the character's completed quests.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getCharacterQuests(characterName:realmSlug:namespace:)")
    public func getCharacterQuests(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterQuests(characterName: characterName, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a character's active quests as well as a link to the character's completed quests.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterQuests(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterQuests(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    /**
     Returns a list of quests that a character has completed.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getCharacterCompletedQuests(characterName:realmSlug:namespace:)")
    public func getCharacterCompletedQuests(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterCompletedQuests(characterName: characterName, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a list of quests that a character has completed.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterCompletedQuests(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterCompletedQuests(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Character Reputations API
    
    /**
     Returns a summary of a character's reputations.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getCharacterReputationsSummary(characterName:realmSlug:namespace:)")
    public func getCharacterReputationsSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterReputationsSummary(characterName: characterName, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a summary of a character's reputations.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterReputationsSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterReputationsSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Character Soulbinds API
    
    /**
     Returns a character's soulbinds.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getCharacterSoulbinds(characterName:realmSlug:namespace:)")
    public func getCharacterSoulbinds(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterSoulbinds(characterName: characterName, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a character's soulbinds.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterSoulbinds(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterSoulbinds(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Character Specializations API
    
    /**
     Returns a summary of a character's specializations.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getCharacterSpecializationsSummary(characterName:realmSlug:namespace:)")
    public func getCharacterSpecializationsSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterSpecializationsSummary(characterName: characterName, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a summary of a character's specializations.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterSpecializationsSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterSpecializationsSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Character Statistics API
    
    /**
     Returns a statistics summary for a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getCharacterStatisticsSummary(characterName:realmSlug:namespace:)")
    public func getCharacterStatisticsSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterStatisticsSummary(characterName: characterName, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a statistics summary for a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterStatisticsSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterStatisticsSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Character Titles API
    
    /**
     Returns a summary of titles a character has obtained.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getCharacterTitlesSummary(characterName:realmSlug:namespace:)")
    public func getCharacterTitlesSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterTitlesSummary(characterName: characterName, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a summary of titles a character has obtained.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterTitlesSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterTitlesSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Guild Profile API
    
    /**
     Returns a single guild by its name and realm.
     
     - parameter slug: The slug of the guild.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getGuild(slug:realmSlug:namespace:)")
    public func getGuild(slug: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getGuild(slug: slug, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a single guild by its name and realm.
     
     - parameter slug: The slug of the guild.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getGuild(slug: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.guild(realmSlug: realmSlug, guildSlug: slug), namespace: namespace)
    }
    
    
    /**
     Returns a single guild's activity by name and realm.
     
     - parameter slug: The slug of the guild.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getGuildActivity(slug:realmSlug:namespace:)")
    public func getGuildActivity(slug: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getGuildActivity(slug: slug, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a single guild's activity by name and realm.
     
     - parameter slug: The slug of the guild.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getGuildActivity(slug: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.guildActivity(realmSlug: realmSlug, guildSlug: slug), namespace: namespace)
    }
    
    
    /**
     Returns a single guild's achievements by name and realm.
     
     - parameter slug: The slug of the guild.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getGuildAchievements(slug:realmSlug:namespace:)")
    public func getGuildAchievements(slug: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getGuildAchievements(slug: slug, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a single guild's achievements by name and realm.
     
     - parameter slug: The slug of the guild.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getGuildAchievements(slug: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.guildAchievements(realmSlug: realmSlug, guildSlug: slug), namespace: namespace)
    }
    
    
    /**
     Returns a single guild's roster by its name and realm.
     
     - parameter slug: The slug of the guild.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getGuildRoster(slug:realmSlug:namespace:)")
    public func getGuildRoster(slug: String, realmSlug: String, namespace: APINamespace? = .profile, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getGuildRoster(slug: slug, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a single guild's roster by its name and realm.
     
     - parameter slug: The slug of the guild.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getGuildRoster(slug: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.guildRoster(realmSlug: realmSlug, guildSlug: slug), namespace: namespace)
    }
}

