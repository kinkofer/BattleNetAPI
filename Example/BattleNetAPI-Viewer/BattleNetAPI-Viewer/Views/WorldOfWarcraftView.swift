//
//  WorldOfWarcraftView.swift
//  BattleNetAPI-Example
//
//  Created by Christopher Jennewein on 2/9/21.
//

import BattleNetAPI
import SwiftUI


struct WorldOfWarcraftView: View {
    @EnvironmentObject var battleNetAPI: BattleNetAPI
    @State var alertType: AlertType?
    
    @State var apiSelection: API?
    @State var webServiceData: Data = Data()
    
    let apiType: APIType
    
    let title = "World of Warcraft API"
    
    
    
    // MARK: - Views
    
    var body: some View {
        apiList
            .navigationTitle(Text(title))
            .alert(item: $alertType) {
                alert(for: $0)
            }
    }
    
    
    var apiList: some View {
        List {
            if apiType == .gameData {
                gameDataSection
            }
            else if apiType == .profile {
                profileSection
            }
        }
        .listStyle(SidebarListStyle())
    }
    
    
    var gameDataSection: some View {
        Group {
            Group {
                Section(header: Text(WorldOfWarcraftView.APISection.achievement.rawValue)) {
                    webServiceRow(api: .achievementCategoryIndex) {
                        battleNetAPI.wow.getAchievementCategoryIndex(completion: { parseResult($0, for: .achievementCategoryIndex) })
                    }
                    webServiceRow(api: .achievementCategory) {
                        battleNetAPI.wow.getAchievementCategory(id: 81, completion: { parseResult($0, for: .achievementCategory) })
                    }
                    webServiceRow(api: .achievementIndex) {
                        battleNetAPI.wow.getAchievementIndex(completion: { parseResult($0, for: .achievementIndex) })
                    }
                    webServiceRow(api: .achievement) {
                        battleNetAPI.wow.getAchievement(id: 6, completion: { parseResult($0, for: .achievement) })
                    }
                    webServiceRow(api: .achievementMedia) {
                        battleNetAPI.wow.getAchievementMedia(id: 6, completion: { parseResult($0, for: .achievementMedia) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.auctionHouse.rawValue)) {
                    webServiceRow(api: .auctions) {
                        battleNetAPI.wow.getAuctions(connectedRealmID: 1146, completion: { parseResult($0, for: .auctions) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.azeriteEssence.rawValue)) {
                    webServiceRow(api: .azeriteEssenceIndex) {
                        battleNetAPI.wow.getAzeriteEssenceIndex(completion: { parseResult($0, for: .azeriteEssenceIndex) })
                    }
                    webServiceRow(api: .azeriteEssence) {
                        battleNetAPI.wow.getAzeriteEssence(id: 2, completion: { parseResult($0, for: .azeriteEssence) })
                    }
                    webServiceRow(api: .azeriteEssenceSearch) {
                        let queries = [
                            "allowed_specializations.id": "65",
                            "orderby": "name",
                            "_page": "1"
                        ]
                        battleNetAPI.wow.searchAzeriteEssence(queries: queries, completion: { parseResult($0, for: .azeriteEssenceSearch) })
                    }
                    webServiceRow(api: .azeriteEssenceMedia) {
                        battleNetAPI.wow.getAzeriteEssence(id: 2, completion: { parseResult($0, for: .azeriteEssenceMedia) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.connectedRealm.rawValue)) {
                    webServiceRow(api: .connectedRealmIndex) {
                        battleNetAPI.wow.getConnectedRealmIndex(completion: { parseResult($0, for: .connectedRealmIndex) })
                    }
                    webServiceRow(api: .connectedRealm) {
                        battleNetAPI.wow.getConnectedRealm(id: 11, completion: { parseResult($0, for: .connectedRealm) })
                    }
                    webServiceRow(api: .connectedRealmSearch) {
                        let queries = [
                            "status.type": "UP",
                            "realms.timezone": "America/New_York",
                            "orderby": "id",
                            "_page": "1"
                        ]
                        battleNetAPI.wow.searchConnectedRealms(queries: queries, completion: { parseResult($0, for: .connectedRealmSearch) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.covenant.rawValue)) {
                    webServiceRow(api: .covenantIndex) {
                        battleNetAPI.wow.getCovenantIndex(completion: { parseResult($0, for: .covenantIndex) })
                    }
                    webServiceRow(api: .covenant) {
                        battleNetAPI.wow.getCovenant(id: 1, completion: { parseResult($0, for: .covenant) })
                    }
                    webServiceRow(api: .covenantMedia) {
                        battleNetAPI.wow.getCovenantMedia(id: 1, completion: { parseResult($0, for: .covenantMedia) })
                    }
                    webServiceRow(api: .soulbindIndex) {
                        battleNetAPI.wow.getSoulbindIndex(completion: { parseResult($0, for: .soulbindIndex) })
                    }
                    webServiceRow(api: .soulbind) {
                        battleNetAPI.wow.getSoulbind(id: 1, completion: { parseResult($0, for: .soulbindIndex) })
                    }
                    webServiceRow(api: .conduitIndex) {
                        battleNetAPI.wow.getConduitIndex(completion: { parseResult($0, for: .conduitIndex) })
                    }
                    webServiceRow(api: .conduit) {
                        battleNetAPI.wow.getConduit(id: 1, completion: { parseResult($0, for: .conduit) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.creature.rawValue)) {
                    webServiceRow(api: .creatureFamilyIndex) {
                        battleNetAPI.wow.getCreatureFamilyIndex(completion: { parseResult($0, for: .creatureFamilyIndex) })
                    }
                    webServiceRow(api: .creatureFamily) {
                        battleNetAPI.wow.getCreatureFamily(id: 1, completion: { parseResult($0, for: .creatureFamily) })
                    }
                    webServiceRow(api: .creatureTypeIndex) {
                        battleNetAPI.wow.getCreatureTypeIndex(completion: { parseResult($0, for: .creatureTypeIndex) })
                    }
                    webServiceRow(api: .creatureType) {
                        battleNetAPI.wow.getCreatureType(id: 1, completion: { parseResult($0, for: .creatureType) })
                    }
                    webServiceRow(api: .creature) {
                        battleNetAPI.wow.getCreature(id: 42722, completion: { parseResult($0, for: .creature) })
                    }
                    webServiceRow(api: .creatureSearch) {
                        let queries = [
                            "name.en_US": "Dragon",
                            "orderby": "id",
                            "_page": "1"
                        ]
                        battleNetAPI.wow.searchCreature(queries: queries, completion: { parseResult($0, for: .creatureSearch) })
                    }
                    webServiceRow(api: .creatureDisplayMedia) {
                        battleNetAPI.wow.getCreatureDisplayMedia(id: 30221, completion: { parseResult($0, for: .creatureDisplayMedia) })
                    }
                    webServiceRow(api: .creatureFamilyMedia) {
                        battleNetAPI.wow.getCreatureFamilyMedia(id: 1, completion: { parseResult($0, for: .creatureFamilyMedia) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.guildCrest.rawValue)) {
                    webServiceRow(api: .guildCrestIndex) {
                        battleNetAPI.wow.getGuildCrestIndex(completion: { parseResult($0, for: .guildCrestIndex) })
                    }
                    webServiceRow(api: .guildCrestBorderMedia) {
                        battleNetAPI.wow.getGuildCrestBorderMedia(id: 0, completion: { parseResult($0, for: .guildCrestBorderMedia) })
                    }
                    webServiceRow(api: .guildCrestEmblemMedia) {
                        battleNetAPI.wow.getGuildCrestEmblemMedia(id: 0, completion: { parseResult($0, for: .guildCrestEmblemMedia) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.item.rawValue)) {
                    webServiceRow(api: .itemClassIndex) {
                        battleNetAPI.wow.getItemClassIndex(completion: { parseResult($0, for: .itemClassIndex) })
                    }
                    webServiceRow(api: .itemClass) {
                        battleNetAPI.wow.getItemClass(id: 0, completion: { parseResult($0, for: .itemClass) })
                    }
                    webServiceRow(api: .itemSetIndex) {
                        battleNetAPI.wow.getItemSetIndex(completion: { parseResult($0, for: .itemSetIndex) })
                    }
                    webServiceRow(api: .itemSet) {
                        battleNetAPI.wow.getItemSet(id: 1, completion: { parseResult($0, for: .itemSet) })
                    }
                    webServiceRow(api: .itemSubclass) {
                        battleNetAPI.wow.getItemSubclass(itemClassID: 0, itemSubclassID: 0, completion: { parseResult($0, for: .itemSubclass) })
                    }
                    webServiceRow(api: .item) {
                        battleNetAPI.wow.getItem(id: 19019, completion: { parseResult($0, for: .item) })
                    }
                    webServiceRow(api: .itemMedia) {
                        battleNetAPI.wow.getItemMedia(id: 19019, completion: { parseResult($0, for: .itemMedia) })
                    }
                    webServiceRow(api: .itemSearch) {
                        let queries = [
                            "name.en_US": "Garrosh",
                            "orderby": "id",
                            "_page": "1"
                        ]
                        battleNetAPI.wow.searchItem(queries: queries, completion: { parseResult($0, for: .itemSearch) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.journal.rawValue)) {
                    webServiceRow(api: .journalExpansionIndex) {
                        battleNetAPI.wow.getJournalExpansionIndex(completion: { parseResult($0, for: .journalExpansionIndex) })
                    }
                    webServiceRow(api: .journalExpansion) {
                        battleNetAPI.wow.getJournalExpansion(id: 68, completion: { parseResult($0, for: .journalExpansion) })
                    }
                    webServiceRow(api: .journalEncounterIndex) {
                        battleNetAPI.wow.getJournalEncounterIndex(completion: { parseResult($0, for: .journalEncounterIndex) })
                    }
                    webServiceRow(api: .journalEncounter) {
                        battleNetAPI.wow.getJournalEncounter(id: 89, completion: { parseResult($0, for: .journalEncounter) })
                    }
                    webServiceRow(api: .journalEncounterSearch) {
                        let queries = [
                            "instance.name.en_US": "Deadmines",
                            "orderby": "id",
                            "_page": "1"
                        ]
                        battleNetAPI.wow.searchJournalEncounter(queries: queries, completion: { parseResult($0, for: .journalEncounterSearch) })
                    }
                    webServiceRow(api: .journalInstanceIndex) {
                        battleNetAPI.wow.getJournalInstanceIndex(completion: { parseResult($0, for: .journalInstanceIndex) })
                    }
                    webServiceRow(api: .journalInstance) {
                        battleNetAPI.wow.getJournalInstance(id: 63, completion: { parseResult($0, for: .journalInstance) })
                    }
                    webServiceRow(api: .journalInstanceMedia) {
                        battleNetAPI.wow.getJournalInstanceMedia(id: 63, completion: { parseResult($0, for: .journalInstanceMedia) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.mediaSearch.rawValue)) {
                    webServiceRow(api: .mediaSearch) {
                        let queries = [
                            "tags": "item",
                            "orderby": "id",
                            "_page": "1"
                        ]
                        battleNetAPI.wow.searchMedia(queries: queries, completion: { parseResult($0, for: .mediaSearch) })
                    }
                }
            }
            Group {
                Section(header: Text(WorldOfWarcraftView.APISection.modifiedCrafting.rawValue)) {
                    webServiceRow(api: .modifiedCraftingIndex) {
                        battleNetAPI.wow.getModifiedCraftingIndex(completion: { parseResult($0, for: .modifiedCraftingIndex) })
                    }
                    webServiceRow(api: .modifiedCraftingCategoryIndex) {
                        battleNetAPI.wow.getModifiedCraftingCategoryIndex(completion: { parseResult($0, for: .modifiedCraftingCategoryIndex) })
                    }
                    webServiceRow(api: .modifiedCraftingCategory) {
                        battleNetAPI.wow.getModifiedCraftingCategory(id: 1, completion: { parseResult($0, for: .modifiedCraftingCategory) })
                    }
                    webServiceRow(api: .modifiedCraftingReagentSlotTypeIndex) {
                        battleNetAPI.wow.getModifiedCraftingReagentSlotTypeIndex(completion: { parseResult($0, for: .modifiedCraftingReagentSlotTypeIndex) })
                    }
                    webServiceRow(api: .modifiedCraftingReagentSlotType) {
                        battleNetAPI.wow.getModifiedCraftingReagentSlotType(id: 16, completion: { parseResult($0, for: .modifiedCraftingReagentSlotType) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.mount.rawValue)) {
                    webServiceRow(api: .mountIndex) {
                        battleNetAPI.wow.getMountIndex(completion: { parseResult($0, for: .mountIndex) })
                    }
                    webServiceRow(api: .mount) {
                        battleNetAPI.wow.getMount(id: 6, completion: { parseResult($0, for: .mount) })
                    }
                    webServiceRow(api: .mountSearch) {
                        let queries = [
                            "name.en_US": "Turtle",
                            "orderby": "id",
                            "_page": "1"
                        ]
                        battleNetAPI.wow.searchMount(queries: queries, completion: { parseResult($0, for: .mountSearch) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.mythicKeystoneAffix.rawValue)) {
                    webServiceRow(api: .mythicKeystoneAffixIndex) {
                        battleNetAPI.wow.getMythicKeystoneAffixIndex(completion: { parseResult($0, for: .mythicKeystoneAffixIndex) })
                    }
                    webServiceRow(api: .mythicKeystoneAffix) {
                        battleNetAPI.wow.getMythicKeystoneAffix(id: 1, completion: { parseResult($0, for: .mythicKeystoneAffix) })
                    }
                    webServiceRow(api: .mythicKeystoneAffixMedia) {
                        battleNetAPI.wow.getMythicKeystoneAffixMedia(id: 1, completion: { parseResult($0, for: .mythicKeystoneAffixMedia) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.mythicKeystoneDungeon.rawValue)) {
                    webServiceRow(api: .mythicKeystoneDungeonIndex) {
                        battleNetAPI.wow.getMythicKeystoneDungeonIndex(completion: { parseResult($0, for: .mythicKeystoneDungeonIndex) })
                    }
                    webServiceRow(api: .mythicKeystoneDungeon) {
                        battleNetAPI.wow.getMythicKeystoneDungeon(id: 375, completion: { parseResult($0, for: .mythicKeystoneDungeon) })
                    }
                    webServiceRow(api: .mythicKeystoneIndex) {
                        battleNetAPI.wow.getMythicKeystoneIndex(completion: { parseResult($0, for: .mythicKeystoneIndex) })
                    }
                    webServiceRow(api: .mythicKeystonePeriodIndex) {
                        battleNetAPI.wow.getMythicKeystonePeriodIndex(completion: { parseResult($0, for: .mythicKeystonePeriodIndex) })
                    }
                    webServiceRow(api: .mythicKeystonePeriod) {
                        battleNetAPI.wow.getMythicKeystonePeriod(id: 641, completion: { parseResult($0, for: .mythicKeystonePeriod) })
                    }
                    webServiceRow(api: .mythicKeystoneSeasonIndex) {
                        battleNetAPI.wow.getMythicKeystoneSeasonIndex(completion: { parseResult($0, for: .mythicKeystoneSeasonIndex) })
                    }
                    webServiceRow(api: .mythicKeystoneSeason) {
                        battleNetAPI.wow.getMythicKeystoneSeason(id: 1, completion: { parseResult($0, for: .mythicKeystoneSeason) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.mythicKeystoneLeaderboard.rawValue)) {
                    webServiceRow(api: .mythicKeystoneLeaderboardIndex) {
                        battleNetAPI.wow.getMythicLeaderboardIndex(connectedRealmID: 11, completion: { parseResult($0, for: .mythicKeystoneLeaderboardIndex) })
                    }
                    webServiceRow(api: .mythicKeystoneLeaderboard) {
                        battleNetAPI.wow.getMythicLeaderboard(connectedRealmID: 11, dungeonID: 197, period: 641, completion: { parseResult($0, for: .mythicKeystoneLeaderboard) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.mythicRaidLeaderboard.rawValue)) {
                    webServiceRow(api: .mythicRaidLeaderboard) {
                        battleNetAPI.wow.getMythicRaidLeaderboard(raid: "uldir", faction: .alliance, completion: { parseResult($0, for: .mythicRaidLeaderboard) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.pet.rawValue)) {
                    webServiceRow(api: .petIndex) {
                        battleNetAPI.wow.getPetIndex(completion: { parseResult($0, for: .petIndex) })
                    }
                    webServiceRow(api: .pet) {
                        battleNetAPI.wow.getPet(id: 39, completion: { parseResult($0, for: .pet) })
                    }
                    webServiceRow(api: .petMedia) {
                        battleNetAPI.wow.getPetMedia(id: 39, completion: { parseResult($0, for: .petMedia) })
                    }
                    webServiceRow(api: .petAbilityIndex) {
                        battleNetAPI.wow.getPetAbilityIndex(completion: { parseResult($0, for: .petAbilityIndex) })
                    }
                    webServiceRow(api: .petAbility) {
                        battleNetAPI.wow.getPetAbility(id: 110, completion: { parseResult($0, for: .petAbility) })
                    }
                    webServiceRow(api: .petAbilityMedia) {
                        battleNetAPI.wow.getPetAbilityMedia(id: 110, completion: { parseResult($0, for: .petAbilityMedia) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.playableClass.rawValue)) {
                    webServiceRow(api: .playableClassIndex) {
                        battleNetAPI.wow.getPlayableClassIndex(completion: { parseResult($0, for: .playableClassIndex) })
                    }
                    webServiceRow(api: .playableClass) {
                        battleNetAPI.wow.getPlayableClass(id: 7, completion: { parseResult($0, for: .playableClass) })
                    }
                    webServiceRow(api: .playableClassMedia) {
                        battleNetAPI.wow.getPlayableClassMedia(id: 7, completion: { parseResult($0, for: .playableClassMedia) })
                    }
                    webServiceRow(api: .pvpTalentSlots) {
                        battleNetAPI.wow.getPlayableClassPvPTalentSlots(classID: 7, completion: { parseResult($0, for: .pvpTalentSlots) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.playableRace.rawValue)) {
                    webServiceRow(api: .playableRaceIndex) {
                        battleNetAPI.wow.getPlayableRaceIndex(completion: { parseResult($0, for: .playableRaceIndex) })
                    }
                    webServiceRow(api: .playableRace) {
                        battleNetAPI.wow.getPlayableRace(id: 2, completion: { parseResult($0, for: .playableRace) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.playableSpecialization.rawValue)) {
                    webServiceRow(api: .playableSpecializationIndex) {
                        battleNetAPI.wow.getPlayableSpecializationIndex(completion: { parseResult($0, for: .playableSpecializationIndex) })
                    }
                    webServiceRow(api: .playableSpecialization) {
                        battleNetAPI.wow.getPlayableSpecialization(id: 262, completion: { parseResult($0, for: .playableSpecialization) })
                    }
                    webServiceRow(api: .playableSpecializationMedia) {
                        battleNetAPI.wow.getPlayableSpecializationMedia(id: 262, completion: { parseResult($0, for: .playableSpecializationMedia) })
                    }
                }
            }
            Group {
                Section(header: Text(WorldOfWarcraftView.APISection.powerType.rawValue)) {
                    webServiceRow(api: .powerTypeIndex) {
                        battleNetAPI.wow.getPowerTypeIndex(completion: { parseResult($0, for: .powerTypeIndex) })
                    }
                    webServiceRow(api: .powerType) {
                        battleNetAPI.wow.getPowerType(id: 0, completion: { parseResult($0, for: .powerType) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.profession.rawValue)) {
                    webServiceRow(api: .professionIndex) {
                        battleNetAPI.wow.getProfessionIndex(completion: { parseResult($0, for: .professionIndex) })
                    }
                    webServiceRow(api: .profession) {
                        battleNetAPI.wow.getProfession(id: 164, completion: { parseResult($0, for: .profession) })
                    }
                    webServiceRow(api: .professionMedia) {
                        battleNetAPI.wow.getProfessionMedia(id: 164, completion: { parseResult($0, for: .professionMedia) })
                    }
                    webServiceRow(api: .professionSkillTier) {
                        battleNetAPI.wow.getProfessionSkillTier(professionID: 164, skillTierID: 2477, completion: { parseResult($0, for: .professionSkillTier) })
                    }
                    webServiceRow(api: .recipe) {
                        battleNetAPI.wow.getRecipe(id: 1631, completion: { parseResult($0, for: .recipe) })
                    }
                    webServiceRow(api: .recipeMedia) {
                        battleNetAPI.wow.getRecipeMedia(id: 1631, completion: { parseResult($0, for: .recipeMedia) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.pvpSeason.rawValue)) {
                    webServiceRow(api: .pvpSeasonIndex) {
                        battleNetAPI.wow.getPvPSeasonIndex(completion: { parseResult($0, for: .pvpSeasonIndex) })
                    }
                    webServiceRow(api: .pvpSeason) {
                        battleNetAPI.wow.getPvPSeason(id: 27, completion: { parseResult($0, for: .pvpSeason) })
                    }
                    webServiceRow(api: .pvpLeaderboardIndex) {
                        battleNetAPI.wow.getPvPLeaderboardIndex(pvpSeasonID: 27, completion: { parseResult($0, for: .pvpLeaderboardIndex) })
                    }
                    webServiceRow(api: .pvpLeaderboard) {
                        battleNetAPI.wow.getPvPLeaderboard(pvpSeasonID: 27, pvpBracket: ._3v3, completion: { parseResult($0, for: .pvpLeaderboard) })
                    }
                    webServiceRow(api: .pvpRewardIndex) {
                        battleNetAPI.wow.getPvPRewardIndex(pvpSeasonID: 27, completion: { parseResult($0, for: .pvpRewardIndex) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.pvpTier.rawValue)) {
                    webServiceRow(api: .pvpTierMedia) {
                        battleNetAPI.wow.getPvPTierMedia(id: 1, completion: { parseResult($0, for: .pvpTierMedia) })
                    }
                    webServiceRow(api: .pvpTierIndex) {
                        battleNetAPI.wow.getPvPTierIndex(completion: { parseResult($0, for: .pvpTierIndex) })
                    }
                    webServiceRow(api: .pvpTier) {
                        battleNetAPI.wow.getPvPTier(id: 1, completion: { parseResult($0, for: .pvpTier) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.quest.rawValue)) {
                    webServiceRow(api: .questIndex) {
                        battleNetAPI.wow.getQuestIndex(completion: { parseResult($0, for: .questIndex) })
                    }
                    webServiceRow(api: .quest) {
                        battleNetAPI.wow.getQuest(id: 2, completion: { parseResult($0, for: .quest) })
                    }
                    webServiceRow(api: .questCategoryIndex) {
                        battleNetAPI.wow.getQuestCategoryIndex(completion: { parseResult($0, for: .questCategoryIndex) })
                    }
                    webServiceRow(api: .questCategory) {
                        battleNetAPI.wow.getQuestCategory(id: 1, completion: { parseResult($0, for: .questCategory) })
                    }
                    webServiceRow(api: .questAreaIndex) {
                        battleNetAPI.wow.getQuestAreaIndex(completion: { parseResult($0, for: .questAreaIndex) })
                    }
                    webServiceRow(api: .questArea) {
                        battleNetAPI.wow.getQuestArea(id: 1, completion: { parseResult($0, for: .questArea) })
                    }
                    webServiceRow(api: .questTypeIndex) {
                        battleNetAPI.wow.getQuestTypeIndex(completion: { parseResult($0, for: .questTypeIndex) })
                    }
                    webServiceRow(api: .questType) {
                        battleNetAPI.wow.getQuestType(id: 1, completion: { parseResult($0, for: .questType) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.realm.rawValue)) {
                    webServiceRow(api: .realmIndex) {
                        battleNetAPI.wow.getRealmIndex(completion: { parseResult($0, for: .realmIndex) })
                    }
                    webServiceRow(api: .realm) {
                        battleNetAPI.wow.getRealm("tichondrius", completion: { parseResult($0, for: .realm) })
                    }
                    webServiceRow(api: .realmSearch) {
                        let queries = [
                            "timezone": "America/New_York",
                            "orderby": "id",
                            "_page": "1"
                        ]
                        battleNetAPI.wow.searchRealm(queries: queries, completion: { parseResult($0, for: .realmSearch) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.region.rawValue)) {
                    webServiceRow(api: .regionIndex) {
                        battleNetAPI.wow.getRegionIndex(completion: { parseResult($0, for: .regionIndex) })
                    }
                    webServiceRow(api: .region) {
                        battleNetAPI.wow.getRegion(id: 1, completion: { parseResult($0, for: .region) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.reputation.rawValue)) {
                    webServiceRow(api: .reputationFactionIndex) {
                        battleNetAPI.wow.getReputationFactionIndex(completion: { parseResult($0, for: .reputationFactionIndex) })
                    }
                    webServiceRow(api: .reputationFaction) {
                        battleNetAPI.wow.getReputationFaction(id: 21, completion: { parseResult($0, for: .reputationFaction) })
                    }
                    webServiceRow(api: .reputationTierIndex) {
                        battleNetAPI.wow.getReputationTierIndex(completion: { parseResult($0, for: .reputationTierIndex) })
                    }
                    webServiceRow(api: .reputationTier) {
                        battleNetAPI.wow.getReputationTier(id: 2, completion: { parseResult($0, for: .reputationTier) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.spell.rawValue)) {
                    webServiceRow(api: .spell) {
                        battleNetAPI.wow.getSpell(id: 196607, completion: { parseResult($0, for: .spell) })
                    }
                    webServiceRow(api: .spellMedia) {
                        battleNetAPI.wow.getSpellMedia(id: 196607, completion: { parseResult($0, for: .spellMedia) })
                    }
                    webServiceRow(api: .spellSearch) {
                        let queries = [
                            "name.en_US": "Holy Shield",
                            "orderby": "id",
                            "_page": "1"
                        ]
                        battleNetAPI.wow.searchSpell(queries: queries, completion: { parseResult($0, for: .spellSearch) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.talent.rawValue)) {
                    webServiceRow(api: .talentIndex) {
                        battleNetAPI.wow.getTalentIndex(completion: { parseResult($0, for: .talentIndex) })
                    }
                    webServiceRow(api: .talent) {
                        battleNetAPI.wow.getTalent(id: 23106, completion: { parseResult($0, for: .talent) })
                    }
                    webServiceRow(api: .pvpTalentIndex) {
                        battleNetAPI.wow.getPvPTalentIndex(completion: { parseResult($0, for: .pvpTalentIndex) })
                    }
                    webServiceRow(api: .pvpTalent) {
                        battleNetAPI.wow.getPvPTalent(id: 11, completion: { parseResult($0, for: .pvpTalent) })
                    }
                }
            }
            Group {
                Section(header: Text(WorldOfWarcraftView.APISection.techTalent.rawValue)) {
                    webServiceRow(api: .techTalentTreeIndex) {
                        battleNetAPI.wow.getTechTalentTreeIndex(completion: { parseResult($0, for: .techTalentTreeIndex) })
                    }
                    webServiceRow(api: .techTalentTree) {
                        battleNetAPI.wow.getTechTalentTree(id: 272, completion: { parseResult($0, for: .techTalentTree) })
                    }
                    webServiceRow(api: .techTalentIndex) {
                        battleNetAPI.wow.getTechTalentIndex(completion: { parseResult($0, for: .techTalentIndex) })
                    }
                    webServiceRow(api: .techTalent) {
                        battleNetAPI.wow.getTechTalent(id: 863, completion: { parseResult($0, for: .techTalent) })
                    }
                    webServiceRow(api: .techTalentMedia) {
                        battleNetAPI.wow.getTechTalentMedia(id: 863, completion: { parseResult($0, for: .techTalent) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.title.rawValue)) {
                    webServiceRow(api: .titleIndex) {
                        battleNetAPI.wow.getTitleIndex(completion: { parseResult($0, for: .titleIndex) })
                    }
                    webServiceRow(api: .title) {
                        battleNetAPI.wow.getTitle(id: 1, completion: { parseResult($0, for: .title) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.wowToken.rawValue)) {
                    webServiceRow(api: .tokenIndex) {
                        battleNetAPI.wow.getTokenIndex(completion: { parseResult($0, for: .tokenIndex) })
                    }
                }
            }
        }
    }
    
    
    var profileSection: some View {
        Group {
            Group {
                Section(header: Text(WorldOfWarcraftView.APISection.accountProfile.rawValue)) {
                    webServiceRow(api: .accountProfileSummary) {
                        battleNetAPI.wow.getAccountProfile(completion: { parseResult($0, for: .accountProfileSummary) })
                    }
                    webServiceRow(api: .protectedCharacterProfileSummary) {
                        battleNetAPI.wow.getProtectedCharacterProfile(id: 1337, realmID: 69, completion: { parseResult($0, for: .protectedCharacterProfileSummary) })
                    }
                    webServiceRow(api: .accountCollectionsIndex) {
                        battleNetAPI.wow.getAccountCollectionsIndex(completion: { parseResult($0, for: .accountCollectionsIndex) })
                    }
                    webServiceRow(api: .accountMountsCollectionSummary) {
                        battleNetAPI.wow.getMountsCollectionSummary(completion: { parseResult($0, for: .accountMountsCollectionSummary) })
                    }
                    webServiceRow(api: .accountPetsCollectionSummary) {
                        battleNetAPI.wow.getPetsCollectionSummary(completion: { parseResult($0, for: .accountPetsCollectionSummary) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterAchievement.rawValue)) {
                    webServiceRow(api: .characterAchievementsSummary) {
                        battleNetAPI.wow.getCharacterAchievementsSummary(characterName: "doof", realmSlug: "frostmourne", completion: { parseResult($0, for: .characterAchievementsSummary) })
                    }
                    webServiceRow(api: .characterAchievementStatistics) {
                        battleNetAPI.wow.getCharacterAchievementStatistics(characterName: "doof", realmSlug: "frostmourne", completion: { parseResult($0, for: .characterAchievementStatistics) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterAppearance.rawValue)) {
                    webServiceRow(api: .characterAppearanceSummary) {
                        battleNetAPI.wow.getCharacterAppearanceSummary(characterName: "doof", realmSlug: "frostmourne", completion: { parseResult($0, for: .characterAppearanceSummary) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterCollection.rawValue)) {
                    webServiceRow(api: .characterCollectionsIndex) {
                        battleNetAPI.wow.getCharacterCollectionsIndex(characterName: "doof", realmSlug: "frostmourne", completion: { parseResult($0, for: .characterCollectionsIndex) })
                    }
                    webServiceRow(api: .characterMountsCollectionSummary) {
                        battleNetAPI.wow.getCharacterMountsCollectionSummary(characterName: "doof", realmSlug: "frostmourne", completion: { parseResult($0, for: .characterMountsCollectionSummary) })
                    }
                    webServiceRow(api: .characterPetsCollectionSummary) {
                        battleNetAPI.wow.getCharacterPetsCollectionSummary(characterName: "doof", realmSlug: "frostmourne", completion: { parseResult($0, for: .characterPetsCollectionSummary) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterEncounter.rawValue)) {
                    webServiceRow(api: .characterEncountersSummary) {
                        battleNetAPI.wow.getCharacterEncountersSummary(characterName: "doof", realmSlug: "frostmourne", completion: { parseResult($0, for: .characterEncountersSummary) })
                    }
                    webServiceRow(api: .characterDungeons) {
                        battleNetAPI.wow.getCharacterDungeons(characterName: "doof", realmSlug: "frostmourne", completion: { parseResult($0, for: .characterDungeons) })
                    }
                    webServiceRow(api: .characterRaids) {
                        battleNetAPI.wow.getCharacterRaids(characterName: "doof", realmSlug: "frostmourne", completion: { parseResult($0, for: .characterRaids) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterEquipment.rawValue)) {
                    webServiceRow(api: .characterEquipmentSummary) {
                        battleNetAPI.wow.getCharacterEquipmentSummary(characterName: "doof", realmSlug: "frostmourne", completion: { parseResult($0, for: .characterEquipmentSummary) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterHunterPet.rawValue)) {
                    webServiceRow(api: .characterHunterPetsSummary) {
                        battleNetAPI.wow.getCharacterHunterPetsSummary(characterName: "peters", realmSlug: "frostmourne", completion: { parseResult($0, for: .characterHunterPetsSummary) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterMedia.rawValue)) {
                    webServiceRow(api: .characterMediaSummary) {
                        battleNetAPI.wow.getCharacterMediaSummary(characterName: "doof", realmSlug: "frostmourne", completion: { parseResult($0, for: .characterMediaSummary) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterMythicKeystoneProfile.rawValue)) {
                    webServiceRow(api: .characterMythicKeystoneProfileIndex) {
                        battleNetAPI.wow.getCharacterMythicKeystoneProfileIndex(characterName: "doof", realmSlug: "frostmourne", completion: { parseResult($0, for: .characterMythicKeystoneProfileIndex) })
                    }
                    webServiceRow(api: .characterMythicKeystoneSeasonDetails) {
                        battleNetAPI.wow.getCharacterMythicKeystoneProfileSeason(seasonID: 1, characterName: "doof", realmSlug: "frostmourne", completion: { parseResult($0, for: .characterMythicKeystoneSeasonDetails) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterProfession.rawValue)) {
                    webServiceRow(api: .characterProfessionsSummary) {
                        battleNetAPI.wow.getCharacterProfessionsSummary(characterName: "doof", realmSlug: "frostmourne", completion: { parseResult($0, for: .characterProfessionsSummary) })
                    }
                }
            }
            Group {
                Section(header: Text(WorldOfWarcraftView.APISection.characterProfile.rawValue)) {
                    webServiceRow(api: .characterProfileSummary) {
                        battleNetAPI.wow.getCharacterProfileSummary(characterName: "doof", realmSlug: "frostmourne", completion: { parseResult($0, for: .characterProfileSummary) })
                    }
                    webServiceRow(api: .characterProfileStatus) {
                        battleNetAPI.wow.getCharacterProfileStatus(characterName: "doof", realmSlug: "frostmourne", completion: { parseResult($0, for: .characterProfileStatus) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterPvP.rawValue)) {
                    webServiceRow(api: .characterPvPBracketStatistics) {
                        battleNetAPI.wow.getCharacterPvPBracketStatistics(characterName: "doof", realmSlug: "frostmourne", pvpBracket: ._3v3, completion: { parseResult($0, for: .characterPvPBracketStatistics) })
                    }
                    webServiceRow(api: .characterPvPSummary) {
                        battleNetAPI.wow.getCharacterPvPSummary(characterName: "doof", realmSlug: "frostmourne", completion: { parseResult($0, for: .characterPvPSummary) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterQuest.rawValue)) {
                    webServiceRow(api: .characterQuests) {
                        battleNetAPI.wow.getCharacterQuests(characterName: "doof", realmSlug: "frostmourne", completion: { parseResult($0, for: .characterQuests) })
                    }
                    webServiceRow(api: .characterCompletedQuests) {
                        battleNetAPI.wow.getCharacterCompletedQuests(characterName: "doof", realmSlug: "frostmourne", completion: { parseResult($0, for: .characterCompletedQuests) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterReputation.rawValue)) {
                    webServiceRow(api: .characterReputationsSummary) {
                        battleNetAPI.wow.getCharacterReputationsSummary(characterName: "doof", realmSlug: "frostmourne", completion: { parseResult($0, for: .characterReputationsSummary) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterSoulbind.rawValue)) {
                    webServiceRow(api: .characterSoulbinds) {
                        battleNetAPI.wow.getCharacterSoulbinds(characterName: "doof", realmSlug: "frostmourne", completion: { parseResult($0, for: .characterSoulbinds) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterSpecialization.rawValue)) {
                    webServiceRow(api: .characterSpecializationsSummary) {
                        battleNetAPI.wow.getCharacterSpecializationsSummary(characterName: "doof", realmSlug: "frostmourne", completion: { parseResult($0, for: .characterSpecializationsSummary) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterStatistic.rawValue)) {
                    webServiceRow(api: .characterStatisticsSummary) {
                        battleNetAPI.wow.getCharacterStatisticsSummary(characterName: "doof", realmSlug: "frostmourne", completion: { parseResult($0, for: .characterStatisticsSummary) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterTitle.rawValue)) {
                    webServiceRow(api: .characterTitlesSummary) {
                        battleNetAPI.wow.getCharacterTitlesSummary(characterName: "doof", realmSlug: "frostmourne", completion: { parseResult($0, for: .characterTitlesSummary) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.guild.rawValue)) {
                    webServiceRow(api: .guild) {
                        battleNetAPI.wow.getGuild(slug: "honestly", realmSlug: "frostmourne", completion: { parseResult($0, for: .guild) })
                    }
                    webServiceRow(api: .guildActivity) {
                        battleNetAPI.wow.getGuildActivity(slug: "honestly", realmSlug: "frostmourne", completion: { parseResult($0, for: .guildActivity) })
                    }
                    webServiceRow(api: .guildAchievements) {
                        battleNetAPI.wow.getGuildAchievements(slug: "honestly", realmSlug: "frostmourne", completion: { parseResult($0, for: .guildAchievements) })
                    }
                    webServiceRow(api: .guildRoster) {
                        battleNetAPI.wow.getGuildRoster(slug: "honestly", realmSlug: "frostmourne", completion: { parseResult($0, for: .guildRoster) })
                    }
                }
            }
        }
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

extension WorldOfWarcraftView {
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



// MARK: - API

extension WorldOfWarcraftView {
    enum API: String, CaseIterable, Hashable, Identifiable {
        // Game Data APIs
        // Achievement API
        case achievementCategoryIndex
        case achievementCategory
        case achievementIndex
        case achievement
        case achievementMedia
        // Auction House API
        case auctions
        // Azerite Essence API
        case azeriteEssenceIndex
        case azeriteEssence
        case azeriteEssenceSearch
        case azeriteEssenceMedia
        // Connected Realm API
        case connectedRealmIndex
        case connectedRealm
        case connectedRealmSearch
        // Covenant API
        case covenantIndex
        case covenant
        case covenantMedia
        case soulbindIndex
        case soulbind
        case conduitIndex
        case conduit
        // Creature API
        case creatureFamilyIndex
        case creatureFamily
        case creatureTypeIndex
        case creatureType
        case creature
        case creatureSearch
        case creatureDisplayMedia
        case creatureFamilyMedia
        // Guild Crest API
        case guildCrestIndex
        case guildCrestBorderMedia
        case guildCrestEmblemMedia
        // Item API
        case itemClassIndex
        case itemClass
        case itemSetIndex
        case itemSet
        case itemSubclass
        case item
        case itemMedia
        case itemSearch
        // Journal API
        case journalExpansionIndex
        case journalExpansion
        case journalEncounterIndex
        case journalEncounter
        case journalEncounterSearch
        case journalInstanceIndex
        case journalInstance
        case journalInstanceMedia
        // Media Search API
        case mediaSearch
        // Modified Crafting API
        case modifiedCraftingIndex
        case modifiedCraftingCategoryIndex
        case modifiedCraftingCategory
        case modifiedCraftingReagentSlotTypeIndex
        case modifiedCraftingReagentSlotType
        // Mount API
        case mountIndex
        case mount
        case mountSearch
        // Mythic Keystone Affix API
        case mythicKeystoneAffixIndex
        case mythicKeystoneAffix
        case mythicKeystoneAffixMedia
        // Mythic Keystone Dungeon API
        case mythicKeystoneDungeonIndex
        case mythicKeystoneDungeon
        case mythicKeystoneIndex
        case mythicKeystonePeriodIndex
        case mythicKeystonePeriod
        case mythicKeystoneSeasonIndex
        case mythicKeystoneSeason
        // Mythic Keystone Leaderboard API
        case mythicKeystoneLeaderboardIndex
        case mythicKeystoneLeaderboard
        // Mythic Raid Leaderboard API
        case mythicRaidLeaderboard
        // Pet API
        case petIndex
        case pet
        case petMedia
        case petAbilityIndex
        case petAbility
        case petAbilityMedia
        // Playable Class API
        case playableClassIndex
        case playableClass
        case playableClassMedia
        case pvpTalentSlots
        // Playable Race API
        case playableRaceIndex
        case playableRace
        // Playable Specialization API
        case playableSpecializationIndex
        case playableSpecialization
        case playableSpecializationMedia
        // Power Type API
        case powerTypeIndex
        case powerType
        // Profession API
        case professionIndex
        case profession
        case professionMedia
        case professionSkillTier
        case recipe
        case recipeMedia
        // PvP Season API
        case pvpSeasonIndex
        case pvpSeason
        case pvpLeaderboardIndex
        case pvpLeaderboard
        case pvpRewardIndex
        // PvP Tier API
        case pvpTierMedia
        case pvpTierIndex
        case pvpTier
        // Quest API
        case questIndex
        case quest
        case questCategoryIndex
        case questCategory
        case questAreaIndex
        case questArea
        case questTypeIndex
        case questType
        // Realm API
        case realmIndex
        case realm
        case realmSearch
        // Region API
        case regionIndex
        case region
        // Reputations API
        case reputationFactionIndex
        case reputationFaction
        case reputationTierIndex
        case reputationTier
        // Spell API
        case spell
        case spellMedia
        case spellSearch
        // Talent API
        case talentIndex
        case talent
        case pvpTalentIndex
        case pvpTalent
        // Tech Talent API
        case techTalentTreeIndex
        case techTalentTree
        case techTalentIndex
        case techTalent
        case techTalentMedia
        // Title API
        case titleIndex
        case title
        // Token API
        case tokenIndex
        
        
        // Profile APIs
        // Account Profile API
        case accountProfileSummary
        case protectedCharacterProfileSummary
        case accountCollectionsIndex
        case accountMountsCollectionSummary
        case accountPetsCollectionSummary
        // Character Achievement API
        case characterAchievementsSummary
        case characterAchievementStatistics
        // Character Appearance API
        case characterAppearanceSummary
        // Character Collections API
        case characterCollectionsIndex
        case characterMountsCollectionSummary
        case characterPetsCollectionSummary
        // Character Encounters API
        case characterEncountersSummary
        case characterDungeons
        case characterRaids
        // Character Equipment API
        case characterEquipmentSummary
        // Character Hunter Pets API
        case characterHunterPetsSummary
        // Character Media API
        case characterMediaSummary
        // Character Mythic Keystone Profile API
        case characterMythicKeystoneProfileIndex
        case characterMythicKeystoneSeasonDetails
        // Character Professions API
        case characterProfessionsSummary
        // Character Profile API
        case characterProfileSummary
        case characterProfileStatus
        // Character PVP API
        case characterPvPBracketStatistics
        case characterPvPSummary
        // Character Quests API
        case characterQuests
        case characterCompletedQuests
        // Character Reputations API
        case characterReputationsSummary
        // Character Soulbinds API
        case characterSoulbinds
        // Character Specializations API
        case characterSpecializationsSummary
        // Character Statistics API
        case characterStatisticsSummary
        // Character Titles API
        case characterTitlesSummary
        // Guild API
        case guild
        case guildActivity
        case guildAchievements
        case guildRoster
        
        
        var id: String { return rawValue }
    }
    
    
    enum APISection: String {
        // Game Data
        case achievement = "Achievement API"
        case auctionHouse = "Auction House API"
        case azeriteEssence = "Azerite Essence API"
        case connectedRealm = "Connected Realm API"
        case covenant = "Covenant API"
        case creature = "Creature API"
        case guildCrest = "Guild Crest API"
        case item = "Item API"
        case journal = "Journal API"
        case mediaSearch = "Media Search API"
        case modifiedCrafting = "Modified Crafting API"
        case mount = "Mount API"
        case mythicKeystoneAffix = "Mythic Keystone Affix API"
        case mythicKeystoneDungeon = "Mythic Keystone Dungeon API"
        case mythicKeystoneLeaderboard = "Mythic Keystone Leaderboard API"
        case mythicRaidLeaderboard = "Mythic Raid Leaderboard API"
        case pet = "Pet API"
        case playableClass = "Playable Class API"
        case playableRace = "Playable Race API"
        case playableSpecialization = "Playable Specialization API"
        case powerType = "Power Type API"
        case profession = "Profession API"
        case pvpSeason = "PvP Season API"
        case pvpTier = "PvP Tier API"
        case quest = "Quest API"
        case realm = "Realm API"
        case region = "Region API"
        case reputation = "Reputations API"
        case spell = "Spell API"
        case talent = "Talent API"
        case techTalent = "Tech Talent API"
        case title = "Title API"
        case wowToken = "WoW Token API"
        
        // Profile
        case accountProfile = "Account Profile API"
        case characterAchievement = "Character Achievements API"
        case characterAppearance = "Character Appearance API"
        case characterCollection = "Character Collections API"
        case characterEncounter = "Character Encounters API"
        case characterEquipment = "Character Equipment API"
        case characterHunterPet = "Character Hunter Pets API"
        case characterMedia = "Character Media API"
        case characterMythicKeystoneProfile = "Character Mythic Keystone Profile API"
        case characterProfession = "Character Professions API"
        case characterProfile = "Character Profile API"
        case characterPvP = "Character PvP API"
        case characterQuest = "Character Quests API"
        case characterReputation = "Character Reputations API"
        case characterSoulbind = "Character Soulbinds API"
        case characterSpecialization = "Character Specializations API"
        case characterStatistic = "Character Statistics API"
        case characterTitle = "Character Titles API"
        case guild = "Guild API"
    }
}



struct WorldOfWarcraftView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WorldOfWarcraftView(apiType: .gameData)
            WorldOfWarcraftView(apiType: .profile)
        }
    }
}
