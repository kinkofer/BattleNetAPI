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
    @State var loadingAPI: API?
    
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
                        try await battleNetAPI.wow.getAchievementCategoryIndex()
                    }
                    webServiceRow(api: .achievementCategory) {
                        try await battleNetAPI.wow.getAchievementCategory(id: 81)
                    }
                    webServiceRow(api: .achievementIndex) {
                        try await battleNetAPI.wow.getAchievementIndex()
                    }
                    webServiceRow(api: .achievement) {
                        try await battleNetAPI.wow.getAchievement(id: 6)
                    }
                    webServiceRow(api: .achievementMedia) {
                        try await battleNetAPI.wow.getAchievementMedia(id: 6)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.auctionHouse.rawValue)) {
                    webServiceRow(api: .auctions) {
                        try await battleNetAPI.wow.getAuctions(connectedRealmID: 1146)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.azeriteEssence.rawValue)) {
                    webServiceRow(api: .azeriteEssenceIndex) {
                        try await battleNetAPI.wow.getAzeriteEssenceIndex()
                    }
                    webServiceRow(api: .azeriteEssence) {
                        try await battleNetAPI.wow.getAzeriteEssence(id: 2)
                    }
                    webServiceRow(api: .azeriteEssenceSearch) {
                        let queries = [
                            "allowed_specializations.id": "65",
                            "orderby": "name",
                            "_page": "1"
                        ]
                        try await battleNetAPI.wow.searchAzeriteEssence(queries: queries)
                    }
                    webServiceRow(api: .azeriteEssenceMedia) {
                        try await battleNetAPI.wow.getAzeriteEssence(id: 2)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.connectedRealm.rawValue)) {
                    webServiceRow(api: .connectedRealmIndex) {
                        try await battleNetAPI.wow.getConnectedRealmIndex()
                    }
                    webServiceRow(api: .connectedRealm) {
                        try await battleNetAPI.wow.getConnectedRealm(id: 11)
                    }
                    webServiceRow(api: .connectedRealmSearch) {
                        let queries = [
                            "status.type": "UP",
                            "realms.timezone": "America/New_York",
                            "orderby": "id",
                            "_page": "1"
                        ]
                        try await battleNetAPI.wow.searchConnectedRealms(queries: queries)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.covenant.rawValue)) {
                    webServiceRow(api: .covenantIndex) {
                        try await battleNetAPI.wow.getCovenantIndex()
                    }
                    webServiceRow(api: .covenant) {
                        try await battleNetAPI.wow.getCovenant(id: 1)
                    }
                    webServiceRow(api: .covenantMedia) {
                        try await battleNetAPI.wow.getCovenantMedia(id: 1)
                    }
                    webServiceRow(api: .soulbindIndex) {
                        try await battleNetAPI.wow.getSoulbindIndex()
                    }
                    webServiceRow(api: .soulbind) {
                        try await battleNetAPI.wow.getSoulbind(id: 1)
                    }
                    webServiceRow(api: .conduitIndex) {
                        try await battleNetAPI.wow.getCondiutIndex()
                    }
                    webServiceRow(api: .conduit) {
                        try await battleNetAPI.wow.getConduit(id: 1)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.creature.rawValue)) {
                    webServiceRow(api: .creatureFamilyIndex) {
                        try await battleNetAPI.wow.getCreatureFamilyIndex()
                    }
                    webServiceRow(api: .creatureFamily) {
                        try await battleNetAPI.wow.getCreatureFamily(id: 1)
                    }
                    webServiceRow(api: .creatureTypeIndex) {
                        try await battleNetAPI.wow.getCreatureTypeIndex()
                    }
                    webServiceRow(api: .creatureType) {
                        try await battleNetAPI.wow.getCreatureType(id: 1)
                    }
                    webServiceRow(api: .creature) {
                        try await battleNetAPI.wow.getCreature(id: 42722)
                    }
                    webServiceRow(api: .creatureSearch) {
                        let queries = [
                            "name.en_US": "Dragon",
                            "orderby": "id",
                            "_page": "1"
                        ]
                        try await battleNetAPI.wow.searchCreature(queries: queries)
                    }
                    webServiceRow(api: .creatureDisplayMedia) {
                        try await battleNetAPI.wow.getCreatureDisplayMedia(id: 30221)
                    }
                    webServiceRow(api: .creatureFamilyMedia) {
                        try await battleNetAPI.wow.getCreatureFamilyMedia(id: 1)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.guildCrest.rawValue)) {
                    webServiceRow(api: .guildCrestIndex) {
                        try await battleNetAPI.wow.getGuildCrestIndex()
                    }
                    webServiceRow(api: .guildCrestBorderMedia) {
                        try await battleNetAPI.wow.getGuildCrestBorderMedia(id: 0)
                    }
                    webServiceRow(api: .guildCrestEmblemMedia) {
                        try await battleNetAPI.wow.getGuildCrestEmblemMedia(id: 0)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.item.rawValue)) {
                    webServiceRow(api: .itemClassIndex) {
                        try await battleNetAPI.wow.getItemClassIndex()
                    }
                    webServiceRow(api: .itemClass) {
                        try await battleNetAPI.wow.getItemClass(id: 0)
                    }
                    webServiceRow(api: .itemSetIndex) {
                        try await battleNetAPI.wow.getItemSetIndex()
                    }
                    webServiceRow(api: .itemSet) {
                        try await battleNetAPI.wow.getItemSet(id: 1)
                    }
                    webServiceRow(api: .itemSubclass) {
                        try await battleNetAPI.wow.getItemSubclass(itemClassID: 0, itemSubclassID: 0)
                    }
                    webServiceRow(api: .item) {
                        try await battleNetAPI.wow.getItem(id: 19019)
                    }
                    webServiceRow(api: .itemMedia) {
                        try await battleNetAPI.wow.getItemMedia(id: 19019)
                    }
                    webServiceRow(api: .itemSearch) {
                        let queries = [
                            "name.en_US": "Garrosh",
                            "orderby": "id",
                            "_page": "1"
                        ]
                        try await battleNetAPI.wow.searchItem(queries: queries)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.journal.rawValue)) {
                    webServiceRow(api: .journalExpansionIndex) {
                        try await battleNetAPI.wow.getJournalExpansionIndex()
                    }
                    webServiceRow(api: .journalExpansion) {
                        try await battleNetAPI.wow.getJournalExpansion(id: 68)
                    }
                    webServiceRow(api: .journalEncounterIndex) {
                        try await battleNetAPI.wow.getJournalEncounterIndex()
                    }
                    webServiceRow(api: .journalEncounter) {
                        try await battleNetAPI.wow.getJournalEncounter(id: 89)
                    }
                    webServiceRow(api: .journalEncounterSearch) {
                        let queries = [
                            "instance.name.en_US": "Deadmines",
                            "orderby": "id",
                            "_page": "1"
                        ]
                        try await battleNetAPI.wow.searchJournalEncounter(queries: queries)
                    }
                    webServiceRow(api: .journalInstanceIndex) {
                        try await battleNetAPI.wow.getJournalInstanceIndex()
                    }
                    webServiceRow(api: .journalInstance) {
                        try await battleNetAPI.wow.getJournalInstance(id: 63)
                    }
                    webServiceRow(api: .journalInstanceMedia) {
                        try await battleNetAPI.wow.getJournalInstanceMedia(id: 63)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.mediaSearch.rawValue)) {
                    webServiceRow(api: .mediaSearch) {
                        let queries = [
                            "tags": "item",
                            "orderby": "id",
                            "_page": "1"
                        ]
                        try await battleNetAPI.wow.searchMedia(queries: queries)
                    }
                }
            }
            Group {
                Section(header: Text(WorldOfWarcraftView.APISection.modifiedCrafting.rawValue)) {
                    webServiceRow(api: .modifiedCraftingIndex) {
                        try await battleNetAPI.wow.getModifiedCraftingIndex()
                    }
                    webServiceRow(api: .modifiedCraftingCategoryIndex) {
                        try await battleNetAPI.wow.getModifiedCraftingCategoryIndex()
                    }
                    webServiceRow(api: .modifiedCraftingCategory) {
                        try await battleNetAPI.wow.getModifiedCraftingCategory(id: 1)
                    }
                    webServiceRow(api: .modifiedCraftingReagentSlotTypeIndex) {
                        try await battleNetAPI.wow.getModifiedCraftingReagentSlotTypeIndex()
                    }
                    webServiceRow(api: .modifiedCraftingReagentSlotType) {
                        try await battleNetAPI.wow.getModifiedCraftingReagentSlotType(id: 16)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.mount.rawValue)) {
                    webServiceRow(api: .mountIndex) {
                        try await battleNetAPI.wow.getMountIndex()
                    }
                    webServiceRow(api: .mount) {
                        try await battleNetAPI.wow.getMount(id: 6)
                    }
                    webServiceRow(api: .mountSearch) {
                        let queries = [
                            "name.en_US": "Turtle",
                            "orderby": "id",
                            "_page": "1"
                        ]
                        try await battleNetAPI.wow.searchMount(queries: queries)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.mythicKeystoneAffix.rawValue)) {
                    webServiceRow(api: .mythicKeystoneAffixIndex) {
                        try await battleNetAPI.wow.getMythicKeystoneAffixIndex()
                    }
                    webServiceRow(api: .mythicKeystoneAffix) {
                        try await battleNetAPI.wow.getMythicKeystoneAffix(id: 1)
                    }
                    webServiceRow(api: .mythicKeystoneAffixMedia) {
                        try await battleNetAPI.wow.getMythicKeystoneAffixMedia(id: 1)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.mythicKeystoneDungeon.rawValue)) {
                    webServiceRow(api: .mythicKeystoneDungeonIndex) {
                        try await battleNetAPI.wow.getMythicKeystoneDungeonIndex()
                    }
                    webServiceRow(api: .mythicKeystoneDungeon) {
                        try await battleNetAPI.wow.getMythicKeystoneDungeon(id: 375)
                    }
                    webServiceRow(api: .mythicKeystoneIndex) {
                        try await battleNetAPI.wow.getMythicKeystoneIndex()
                    }
                    webServiceRow(api: .mythicKeystonePeriodIndex) {
                        try await battleNetAPI.wow.getMythicKeystonePeriodIndex()
                    }
                    webServiceRow(api: .mythicKeystonePeriod) {
                        try await battleNetAPI.wow.getMythicKeystonePeriod(id: 641)
                    }
                    webServiceRow(api: .mythicKeystoneSeasonIndex) {
                        try await battleNetAPI.wow.getMythicKeystoneSeasonIndex()
                    }
                    webServiceRow(api: .mythicKeystoneSeason) {
                        try await battleNetAPI.wow.getMythicKeystoneSeason(id: 1)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.mythicKeystoneLeaderboard.rawValue)) {
                    webServiceRow(api: .mythicKeystoneLeaderboardIndex) {
                        try await battleNetAPI.wow.getMythicLeaderboardIndex(connectedRealmID: 11)
                    }
                    webServiceRow(api: .mythicKeystoneLeaderboard) {
                        try await battleNetAPI.wow.getMythicLeaderboard(connectedRealmID: 11, dungeonID: 197, period: 641)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.mythicRaidLeaderboard.rawValue)) {
                    webServiceRow(api: .mythicRaidLeaderboard) {
                        try await battleNetAPI.wow.getMythicRaidLeaderboard(raid: "uldir", faction: .alliance)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.pet.rawValue)) {
                    webServiceRow(api: .petIndex) {
                        try await battleNetAPI.wow.getPetIndex()
                    }
                    webServiceRow(api: .pet) {
                        try await battleNetAPI.wow.getPet(id: 39)
                    }
                    webServiceRow(api: .petMedia) {
                        try await battleNetAPI.wow.getPetMedia(id: 39)
                    }
                    webServiceRow(api: .petAbilityIndex) {
                        try await battleNetAPI.wow.getPetAbilityIndex()
                    }
                    webServiceRow(api: .petAbility) {
                        try await battleNetAPI.wow.getPetAbility(id: 110)
                    }
                    webServiceRow(api: .petAbilityMedia) {
                        try await battleNetAPI.wow.getPetAbilityMedia(id: 110)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.playableClass.rawValue)) {
                    webServiceRow(api: .playableClassIndex) {
                        try await battleNetAPI.wow.getPlayableClassIndex()
                    }
                    webServiceRow(api: .playableClass) {
                        try await battleNetAPI.wow.getPlayableClass(id: 7)
                    }
                    webServiceRow(api: .playableClassMedia) {
                        try await battleNetAPI.wow.getPlayableClassMedia(id: 7)
                    }
                    webServiceRow(api: .pvpTalentSlots) {
                        try await battleNetAPI.wow.getPlayableClassPvPTalentSlots(classID: 7)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.playableRace.rawValue)) {
                    webServiceRow(api: .playableRaceIndex) {
                        try await battleNetAPI.wow.getPlayableRaceIndex()
                    }
                    webServiceRow(api: .playableRace) {
                        try await battleNetAPI.wow.getPlayableRace(id: 2)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.playableSpecialization.rawValue)) {
                    webServiceRow(api: .playableSpecializationIndex) {
                        try await battleNetAPI.wow.getPlayableSpecializationIndex()
                    }
                    webServiceRow(api: .playableSpecialization) {
                        try await battleNetAPI.wow.getPlayableSpecialization(id: 262)
                    }
                    webServiceRow(api: .playableSpecializationMedia) {
                        try await battleNetAPI.wow.getPlayableSpecializationMedia(id: 262)
                    }
                }
            }
            Group {
                Section(header: Text(WorldOfWarcraftView.APISection.powerType.rawValue)) {
                    webServiceRow(api: .powerTypeIndex) {
                        try await battleNetAPI.wow.getPowerTypeIndex()
                    }
                    webServiceRow(api: .powerType) {
                        try await battleNetAPI.wow.getPowerType(id: 0)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.profession.rawValue)) {
                    webServiceRow(api: .professionIndex) {
                        try await battleNetAPI.wow.getProfessionIndex()
                    }
                    webServiceRow(api: .profession) {
                        try await battleNetAPI.wow.getProfession(id: 164)
                    }
                    webServiceRow(api: .professionMedia) {
                        try await battleNetAPI.wow.getProfessionMedia(id: 164)
                    }
                    webServiceRow(api: .professionSkillTier) {
                        try await battleNetAPI.wow.getProfessionSkillTier(professionID: 164, skillTierID: 2477)
                    }
                    webServiceRow(api: .recipe) {
                        try await battleNetAPI.wow.getRecipe(id: 1631)
                    }
                    webServiceRow(api: .recipeMedia) {
                        try await battleNetAPI.wow.getRecipeMedia(id: 1631)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.pvpSeason.rawValue)) {
                    webServiceRow(api: .pvpSeasonIndex) {
                        try await battleNetAPI.wow.getPvPSeasonIndex()
                    }
                    webServiceRow(api: .pvpSeason) {
                        try await battleNetAPI.wow.getPvPSeason(id: 27)
                    }
                    webServiceRow(api: .pvpLeaderboardIndex) {
                        try await battleNetAPI.wow.getPvPLeaderboardIndex(pvpSeasonID: 27)
                    }
                    webServiceRow(api: .pvpLeaderboard) {
                        try await battleNetAPI.wow.getPvPLeaderboard(pvpSeasonID: 27, pvpBracket: ._3v3)
                    }
                    webServiceRow(api: .pvpRewardIndex) {
                        try await battleNetAPI.wow.getPvPRewardIndex(pvpSeasonID: 27)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.pvpTier.rawValue)) {
                    webServiceRow(api: .pvpTierMedia) {
                        try await battleNetAPI.wow.getPvPTierMedia(id: 1)
                    }
                    webServiceRow(api: .pvpTierIndex) {
                        try await battleNetAPI.wow.getPvPTierIndex()
                    }
                    webServiceRow(api: .pvpTier) {
                        try await battleNetAPI.wow.getPvPTier(id: 1)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.quest.rawValue)) {
                    webServiceRow(api: .questIndex) {
                        try await battleNetAPI.wow.getQuestIndex()
                    }
                    webServiceRow(api: .quest) {
                        try await battleNetAPI.wow.getQuest(id: 2)
                    }
                    webServiceRow(api: .questCategoryIndex) {
                        try await battleNetAPI.wow.getQuestCategoryIndex()
                    }
                    webServiceRow(api: .questCategory) {
                        try await battleNetAPI.wow.getQuestCategory(id: 1)
                    }
                    webServiceRow(api: .questAreaIndex) {
                        try await battleNetAPI.wow.getQuestAreaIndex()
                    }
                    webServiceRow(api: .questArea) {
                        try await battleNetAPI.wow.getQuestArea(id: 1)
                    }
                    webServiceRow(api: .questTypeIndex) {
                        try await battleNetAPI.wow.getQuestTypeIndex()
                    }
                    webServiceRow(api: .questType) {
                        try await battleNetAPI.wow.getQuestType(id: 1)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.realm.rawValue)) {
                    webServiceRow(api: .realmIndex) {
                        try await battleNetAPI.wow.getRealmIndex()
                    }
                    webServiceRow(api: .realm) {
                        try await battleNetAPI.wow.getRealm("tichondrius")
                    }
                    webServiceRow(api: .realmSearch) {
                        let queries = [
                            "timezone": "America/New_York",
                            "orderby": "id",
                            "_page": "1"
                        ]
                        try await battleNetAPI.wow.searchRealm(queries: queries)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.region.rawValue)) {
                    webServiceRow(api: .regionIndex) {
                        try await battleNetAPI.wow.getRegionIndex()
                    }
                    webServiceRow(api: .region) {
                        try await battleNetAPI.wow.getRegion(id: 1)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.reputation.rawValue)) {
                    webServiceRow(api: .reputationFactionIndex) {
                        try await battleNetAPI.wow.getReputationFactionIndex()
                    }
                    webServiceRow(api: .reputationFaction) {
                        try await battleNetAPI.wow.getReputationFaction(id: 21)
                    }
                    webServiceRow(api: .reputationTierIndex) {
                        try await battleNetAPI.wow.getReputationTierIndex()
                    }
                    webServiceRow(api: .reputationTier) {
                        try await battleNetAPI.wow.getReputationTier(id: 2)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.spell.rawValue)) {
                    webServiceRow(api: .spell) {
                        try await battleNetAPI.wow.getSpell(id: 196607)
                    }
                    webServiceRow(api: .spellMedia) {
                        try await battleNetAPI.wow.getSpellMedia(id: 196607)
                    }
                    webServiceRow(api: .spellSearch) {
                        let queries = [
                            "name.en_US": "Holy Shield",
                            "orderby": "id",
                            "_page": "1"
                        ]
                        try await battleNetAPI.wow.searchSpell(queries: queries)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.talent.rawValue)) {
                    webServiceRow(api: .talentIndex) {
                        try await battleNetAPI.wow.getTalentIndex()
                    }
                    webServiceRow(api: .talent) {
                        try await battleNetAPI.wow.getTalent(id: 23106)
                    }
                    webServiceRow(api: .pvpTalentIndex) {
                        try await battleNetAPI.wow.getPvPTalentIndex()
                    }
                    webServiceRow(api: .pvpTalent) {
                        try await battleNetAPI.wow.getPvPTalent(id: 11)
                    }
                }
            }
            Group {
                Section(header: Text(WorldOfWarcraftView.APISection.techTalent.rawValue)) {
                    webServiceRow(api: .techTalentTreeIndex) {
                        try await battleNetAPI.wow.getTechTalentTreeIndex()
                    }
                    webServiceRow(api: .techTalentTree) {
                        try await battleNetAPI.wow.getTechTalentTree(id: 272)
                    }
                    webServiceRow(api: .techTalentIndex) {
                        try await battleNetAPI.wow.getTechTalentIndex()
                    }
                    webServiceRow(api: .techTalent) {
                        try await battleNetAPI.wow.getTechTalent(id: 863)
                    }
                    webServiceRow(api: .techTalentMedia) {
                        try await battleNetAPI.wow.getTechTalentMedia(id: 863)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.title.rawValue)) {
                    webServiceRow(api: .titleIndex) {
                        try await battleNetAPI.wow.getTitleIndex()
                    }
                    webServiceRow(api: .title) {
                        try await battleNetAPI.wow.getTitle(id: 1)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.wowToken.rawValue)) {
                    webServiceRow(api: .tokenIndex) {
                        try await battleNetAPI.wow.getTokenIndex()
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
                        try await battleNetAPI.wow.getAccountProfile()
                    }
                    webServiceRow(api: .protectedCharacterProfileSummary) {
                        try await battleNetAPI.wow.getProtectedCharacterProfile(id: 1337, realmID: 69)
                    }
                    webServiceRow(api: .accountCollectionsIndex) {
                        try await battleNetAPI.wow.getAccountCollectionsIndex()
                    }
                    webServiceRow(api: .accountMountsCollectionSummary) {
                        try await battleNetAPI.wow.getMountsCollectionSummary()
                    }
                    webServiceRow(api: .accountPetsCollectionSummary) {
                        try await battleNetAPI.wow.getPetsCollectionSummary()
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterAchievement.rawValue)) {
                    webServiceRow(api: .characterAchievementsSummary) {
                        try await battleNetAPI.wow.getCharacterAchievementsSummary(characterName: "doof", realmSlug: "frostmourne")
                    }
                    webServiceRow(api: .characterAchievementStatistics) {
                        try await battleNetAPI.wow.getCharacterAchievementStatistics(characterName: "doof", realmSlug: "frostmourne")
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterAppearance.rawValue)) {
                    webServiceRow(api: .characterAppearanceSummary) {
                        try await battleNetAPI.wow.getCharacterAppearanceSummary(characterName: "doof", realmSlug: "frostmourne")
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterCollection.rawValue)) {
                    webServiceRow(api: .characterCollectionsIndex) {
                        try await battleNetAPI.wow.getCharacterCollectionsIndex(characterName: "doof", realmSlug: "frostmourne")
                    }
                    webServiceRow(api: .characterMountsCollectionSummary) {
                        try await battleNetAPI.wow.getCharacterMountsCollectionSummary(characterName: "doof", realmSlug: "frostmourne")
                    }
                    webServiceRow(api: .characterPetsCollectionSummary) {
                        try await battleNetAPI.wow.getCharacterPetsCollectionSummary(characterName: "doof", realmSlug: "frostmourne")
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterEncounter.rawValue)) {
                    webServiceRow(api: .characterEncountersSummary) {
                        try await battleNetAPI.wow.getCharacterEncountersSummary(characterName: "doof", realmSlug: "frostmourne")
                    }
                    webServiceRow(api: .characterDungeons) {
                        try await battleNetAPI.wow.getCharacterDungeons(characterName: "doof", realmSlug: "frostmourne")
                    }
                    webServiceRow(api: .characterRaids) {
                        try await battleNetAPI.wow.getCharacterRaids(characterName: "doof", realmSlug: "frostmourne")
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterEquipment.rawValue)) {
                    webServiceRow(api: .characterEquipmentSummary) {
                        try await battleNetAPI.wow.getCharacterEquipmentSummary(characterName: "doof", realmSlug: "frostmourne")
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterHunterPet.rawValue)) {
                    webServiceRow(api: .characterHunterPetsSummary) {
                        try await battleNetAPI.wow.getCharacterHunterPetsSummary(characterName: "peters", realmSlug: "frostmourne")
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterMedia.rawValue)) {
                    webServiceRow(api: .characterMediaSummary) {
                        try await battleNetAPI.wow.getCharacterMediaSummary(characterName: "doof", realmSlug: "frostmourne")
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterMythicKeystoneProfile.rawValue)) {
                    webServiceRow(api: .characterMythicKeystoneProfileIndex) {
                        try await battleNetAPI.wow.getCharacterMythicKeystoneProfileIndex(characterName: "doof", realmSlug: "frostmourne")
                    }
                    webServiceRow(api: .characterMythicKeystoneSeasonDetails) {
                        try await battleNetAPI.wow.getCharacterMythicKeystoneProfileSeason(seasonID: 1, characterName: "doof", realmSlug: "frostmourne")
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterProfession.rawValue)) {
                    webServiceRow(api: .characterProfessionsSummary) {
                        try await battleNetAPI.wow.getCharacterProfessionsSummary(characterName: "doof", realmSlug: "frostmourne")
                    }
                }
            }
            Group {
                Section(header: Text(WorldOfWarcraftView.APISection.characterProfile.rawValue)) {
                    webServiceRow(api: .characterProfileSummary) {
                        try await battleNetAPI.wow.getCharacterProfileSummary(characterName: "doof", realmSlug: "frostmourne")
                    }
                    webServiceRow(api: .characterProfileStatus) {
                        try await battleNetAPI.wow.getCharacterProfileStatus(characterName: "doof", realmSlug: "frostmourne")
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterPvP.rawValue)) {
                    webServiceRow(api: .characterPvPBracketStatistics) {
                        try await battleNetAPI.wow.getCharacterPvPBracketStatistics(characterName: "doof", realmSlug: "frostmourne", pvpBracket: ._3v3)
                    }
                    webServiceRow(api: .characterPvPSummary) {
                        try await battleNetAPI.wow.getCharacterPvPSummary(characterName: "doof", realmSlug: "frostmourne")
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterQuest.rawValue)) {
                    webServiceRow(api: .characterQuests) {
                        try await battleNetAPI.wow.getCharacterQuests(characterName: "doof", realmSlug: "frostmourne")
                    }
                    webServiceRow(api: .characterCompletedQuests) {
                        try await battleNetAPI.wow.getCharacterCompletedQuests(characterName: "doof", realmSlug: "frostmourne")
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterReputation.rawValue)) {
                    webServiceRow(api: .characterReputationsSummary) {
                        try await battleNetAPI.wow.getCharacterReputationsSummary(characterName: "doof", realmSlug: "frostmourne")
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterSoulbind.rawValue)) {
                    webServiceRow(api: .characterSoulbinds) {
                        try await battleNetAPI.wow.getCharacterSoulbinds(characterName: "doof", realmSlug: "frostmourne")
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterSpecialization.rawValue)) {
                    webServiceRow(api: .characterSpecializationsSummary) {
                        try await battleNetAPI.wow.getCharacterSpecializationsSummary(characterName: "doof", realmSlug: "frostmourne")
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterStatistic.rawValue)) {
                    webServiceRow(api: .characterStatisticsSummary) {
                        try await battleNetAPI.wow.getCharacterStatisticsSummary(characterName: "doof", realmSlug: "frostmourne")
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.characterTitle.rawValue)) {
                    webServiceRow(api: .characterTitlesSummary) {
                        try await battleNetAPI.wow.getCharacterTitlesSummary(characterName: "doof", realmSlug: "frostmourne")
                    }
                }
                
                Section(header: Text(WorldOfWarcraftView.APISection.guild.rawValue)) {
                    webServiceRow(api: .guild) {
                        try await battleNetAPI.wow.getGuild(slug: "honestly", realmSlug: "frostmourne")
                    }
                    webServiceRow(api: .guildActivity) {
                        try await battleNetAPI.wow.getGuildActivity(slug: "honestly", realmSlug: "frostmourne")
                    }
                    webServiceRow(api: .guildAchievements) {
                        try await battleNetAPI.wow.getGuildAchievements(slug: "honestly", realmSlug: "frostmourne")
                    }
                    webServiceRow(api: .guildRoster) {
                        try await battleNetAPI.wow.getGuildRoster(slug: "honestly", realmSlug: "frostmourne")
                    }
                }
            }
        }
    }
    
    
    func webServiceRow(api: API, webService: @escaping () async throws -> Data) -> some View {
        Button {
            loadingAPI = api
            Task {
                do {
                    let data = try await webService()
                    webServiceData = data
                    apiSelection = api
                } catch {
                    alertType = .error(error)
                }
                loadingAPI = nil
            }
        } label: {
            HStack {
                Text(api.rawValue)
                Spacer()
                if loadingAPI == api {
                    ProgressView()
                }
            }
        }
        .background(
            NavigationLink(destination: WebServiceView(title: api.rawValue, data: webServiceData), tag: api, selection: $apiSelection) {
                EmptyView()
            }
            .hidden()
        )
    }
    
    
    
    // MARK: - Web Services
    

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
