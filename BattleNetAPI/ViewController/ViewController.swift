//
//  ViewController.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/6/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var signInBtn: UIButton!
    
    let authMC = AuthenticationModelController.shared
    let userMC = UserModelController.shared
    
    let d3MC = Diablo3ModelController.shared
    let sc2MC = StarCraft2ModelController.shared
    let wowMC = WorldOfWarcraftModelController.shared
    
    let authManager = AuthenticationManager()
    
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authManager.delegate = self
        
        authManager.setupLegacyWebServices()
        
        authManager.getClientAccessToken() { result in
            switch result {
            case .success(let token):
                Debug.print("clientAccessToken: \(token)")
                // TODO: Save to keychain if new
                
                Debug.print("Ready for game data web services")
                self.startGameDataCalls()
            case .failure(let error):
                self.handleError(error)
            }
        }
        
        authManager.validateUserAccessToken()
        
        if authManager.userAccessToken != nil {
            setSignIn(false)
        }
    }
    
    
    
    // MARK: - IBActions
    
    @IBAction func signIn() {
        if authManager.userAccessToken == nil { // Sign In
            authManager.getUserAccessToken(scope: [.wow, .sc2])
        }
        else { // Sign Out
            self.presentConfirmAlert(title: "Sign Out", message: "Are you should you want to sign out?", confirmed: { alert in
                self.authManager.userAccessToken = nil
                self.setSignIn(true)
            })
        }
    }
    
    
    func startGameDataCalls() {
        // WOW Services
        
        getConnectedRealmIndex()
        getConnectedRealm(id: 11)
        
        getMythicLeaderboards(connectedRealmID: 11)
        getMythicLeaderboard(connectedRealmID: 11, dungeonID: 197, period: 641)
        
        getMythicChallengeMode()
        
        getPlayableClasses()
        getPlayableClass(id: 7)
        
        getPlayableSpecializations()
        getPlayableSpecialization(id: 262)
        
        getRealmIndex()
        getRealm(slug: "tichondrius")
        
        getRegionIndex()
        getRegion(id: 1)
        
        getTokenIndex()
        
        getAchievement(id: 2144)
        getAuctions(realm: "medivh")
        
        getBosses()
        getBoss(id: 24723)
        
        getChallengeLeaderboards(realm: "medivh")
        getTopChallengeLeaderboards()
        
        getCharacter("Aedimus", realm: "Aegwynn", fields: [.achievements, .appearance, .feed, .guild, .items,
                                                           .mounts, .pets, .petSlots, .professions, .progression,
                                                           .pvp, .quests, .reputation, .statistics, .stats,
                                                           .talents, .titles, .audit, .hunterPets])
        getCharacter("Ahote", realm: "Aegwynn", fields: [.hunterPets])
        getGuild("Limit", realm: "Illidan", fields: [.achievements, .challenges, .members, .news])
        
        getWOWItem(id: 18803)
        getWOWItemSet(setID: 1060)
        
        getMounts()
        
        getPets()
        getPetAbility(abilityID: 640)
        getPetSpecies(speciesID: 258)
        getPetStats(speciesID: 258, level: 25, breedID: 5, qualityID: 4)
        
        getWOWLeaderboard(bracket: ._2v2)
        
        getWOWQuest(id: 13146)
        
        getWOWRealmsStatus()
        
        getWOWRecipe(id: 33994)
        
        getWOWSpell(id: 1)
        
        getZones()
        getZone(id: 4131)
        
        getBattlegroups()
        getRaces()
        getWOWClasses()
        getWOWAchievements()
        getWOWGuildRewards()
        getWOWGuildPerks()
        getWOWGuildAchievements()
        getItemClasses()
        getTalents()
        getPetTypes()
        
        
        // D3 Services
        
        getActs()
        getAct(5)
        
        getArtisan("blacksmith")
        getRecipe("apprentice-flamberge", forArtisan: "blacksmith")
        
        getFollower("templar")
        
        getClass("barbarian")
        getSkill("bash", forClass: "barbarian")
        
        getD3ItemTypes()
        getD3ItemsByType("sword2h")
        getD3Item("corrupted-ashbringer-Unique_Sword_2H_104_x1")
        
        getProfile(battleTag: "kinkofer-11254")
        getHero(88095369, for: "hionpotuse-1872")
//        getItems(forHero: 88095369, forBattleTag: "hionpotuse-1872")
        getItems(forHero: 99983354, forBattleTag: "kinkofer-11254")
        getFollowerItems(forHero: 88095369, forBattleTag: "hionpotuse-1872")
        
        
        // SC2 Services
        
        getCharacter(id: 2541852, profileName: "MaSa", sc2Region: 1)
        getLadders(id: 2541852, profileName: "MaSa", sc2Region: 1)
        getMatches(id: 2541852, profileName: "MaSa", sc2Region: 1)
        
        getLadder(id: 263156)
        
        getSC2Achievements()
        getSC2Rewards()
    }
    
    
    func startProfileCalls() {
        // User
        getUser()
        
        // WOW Services
        getWOWCharacters()
        
        
        // SC2 Services
        getSC2Characters()
        
        
        // D3 Services
        getSeasons()
        getLeaderboards(forSeason: 1)
        getLeaderboard("achievement-points", forSeason: 1)
        
        getEras()
        getLeaderboards(forEra: 1)
        getLeaderboard("rift-barbarian", forEra: 1)
    }
    
    
    
    // MARK: - Data
    
    
    // MARK: Profile API
    
    func getUser(region: APIRegion = .us) {
        userMC.getUser(region: region) { result in
            switch result {
            case .success(let user):
                Debug.print("Retrieved User \(user.battletag)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getWOWCharacters(region: APIRegion = .us) {
        wowMC.getCharacters(region: region) { result in
            switch result {
            case .success(let characters):
                Debug.print("Retrieved \(characters.count) Character(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getSC2Characters(region: APIRegion = .us) {
        sc2MC.getCharacters(region: region) { result in
            switch result {
            case .success(let characters):
                Debug.print("Retrieved \(characters.count) Character(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    
    // MARK: Game Data API
    
    // MARK: WOW
    
    func getConnectedRealmIndex(region: APIRegion = .us, locale: APILocale? = .en_US) {
        wowMC.getConnectedRealmIndex(region: region, locale: locale) { result in
            switch result {
            case .success(let connectedRealms):
                Debug.print("Retrieved \(connectedRealms.count) conntected Realm(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getConnectedRealm(id: Int, region: APIRegion = .us, locale: APILocale? = .en_US) {
        wowMC.getConnectedRealm(id: id, region: region, locale: locale) { result in
            switch result {
            case .success(let connectedRealm):
                Debug.print("Retrieved connectedRealm.id \(connectedRealm.id) with \(connectedRealm.realms.count) Realm(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getMythicLeaderboards(connectedRealmID: Int, region: APIRegion = .us, locale: APILocale? = .en_US) {
        wowMC.getMythicLeaderboards(connectedRealmID: connectedRealmID, region: region, locale: locale) { result in
            switch result {
            case .success(let leaderboards):
                Debug.print("Retrieved \(leaderboards.currentLeaderboards.count) Current Leaderboard(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getMythicLeaderboard(connectedRealmID: Int, dungeonID: Int, period: Int, region: APIRegion = .us, locale: APILocale? = .en_US) {
        wowMC.getMythicLeaderboard(connectedRealmID: connectedRealmID, dungeonID: dungeonID, period: period, region: region, locale: locale) { result in
            switch result {
            case .success(let leaderboard):
                let keystoneAffixes = leaderboard.keystoneAffixes.map { $0.keystoneAffix.name }
                Debug.print("Retrieved Mythic Leaderboard \(leaderboard.name) with Keystone Affixes \(keystoneAffixes.joined(separator: ", "))")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getMythicChallengeMode(region: APIRegion = .us, locale: APILocale? = .en_US) {
        wowMC.getMythicChallengeMode(region: region, locale: locale) { result in
            switch result {
            case .success(let mythicChallengeMode):
                let keystoneAffixes = mythicChallengeMode.currentKeystoneAffixes.map { $0.keystoneAffix.name }
                Debug.print("Retrieved Mythic Challenge Mode with Current Period \(mythicChallengeMode.currentPeriod) with Keystone Affixes \(keystoneAffixes.joined(separator: ", "))")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getPlayableClasses(region: APIRegion = .us, locale: APILocale? = .en_US) {
        wowMC.getPlayableClasses(region: region, locale: locale) { result in
            switch result {
            case .success(let classIndex):
                Debug.print("Retrieved \(classIndex.classes.count) WOW Playable Class(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getPlayableClass(id: Int, region: APIRegion = .us, locale: APILocale? = .en_US) {
        wowMC.getPlayableClass(id: id, region: region, locale: locale) { result in
            switch result {
            case .success(let wowClass):
                let specializations = wowClass.specializations.map { $0.name ?? "Unknown" }
                Debug.print("Retrieved WOW Class \(wowClass.name) with Specializations \(specializations.joined(separator: ", "))")
                
                self.wowMC.getResource(from: wowClass.media.key) { result in
                    switch result {
                    case .success(let media):
                        Debug.print("\(media.assets.first!.value)")
                    case .failure(let error):
                        self.handleError(error)
                    }
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getPlayableSpecializations(region: APIRegion = .us, locale: APILocale? = .en_US) {
        wowMC.getPlayableSpecializations(region: region, locale: locale) { result in
            switch result {
            case .success(let specializations):
                Debug.print("Retrieved \(specializations.characterSpecializations.count) Character Specialization(s) and \(specializations.petSpecializations.count) Pet Specialization(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getPlayableSpecialization(id: Int, region: APIRegion = .us, locale: APILocale? = .en_US) {
        wowMC.getPlayableSpecialization(id: id, region: region, locale: locale) { result in
            switch result {
            case .success(let specialization):
                Debug.print("Retrieved Specialization \(specialization.name) for Playable Class \(specialization.playableClass.name)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getRealmIndex(region: APIRegion = .us, locale: APILocale? = .en_US) {
        wowMC.getRealmIndex(region: region, locale: locale) { result in
            switch result {
            case .success(let realms):
                Debug.print("Retrieved \(realms.count) Realm(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getRealm(id: Int? = nil, slug: String? = nil, region: APIRegion = .us, locale: APILocale? = .en_US) {
        wowMC.getRealm(id: id, slug: slug, region: region, locale: locale) { result in
            switch result {
            case .success(let realm):
                Debug.print("Retrieved Realm \(realm.name)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getRegionIndex(region: APIRegion = .us, locale: APILocale? = .en_US) {
        wowMC.getRegionIndex(region: region, locale: locale) { result in
            switch result {
            case .success(let regions):
                Debug.print("Retrieved \(regions.count) Region(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getRegion(id: Int, region: APIRegion = .us, locale: APILocale? = .en_US) {
        wowMC.getRegion(id: id, region: region, locale: locale) { result in
            switch result {
            case .success(let region):
                Debug.print("Retrieved Region \(region.name)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getTokenIndex(region: APIRegion = .us, locale: APILocale? = .en_US) {
        wowMC.getTokenIndex(region: region, locale: locale) { result in
            switch result {
            case .success(let tokenIndex):
                Debug.print("TokenIndex.lastUpdatedTimestamp: \(tokenIndex.lastUpdatedTimestamp)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getAchievement(id: Int, region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getAchievement(id: id, region: region, locale: locale) { result in
            switch result {
            case .success(let achievement):
                Debug.print("Retrieved Achievement \(achievement.title)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getAuctions(realm: String, region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getAuctions(realm: realm, region: region, locale: locale) { result in
            switch result {
            case .success(let auction):
                Debug.print("Retrieved \(auction.files.count) Auction(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getBosses(region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getBosses(region: region, locale: locale) { result in
            switch result {
            case .success(let bosses):
                Debug.print("Retrieved \(bosses.count) Boss(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getBoss(id: Int, region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getBoss(id: id, region: region, locale: locale) { result in
            switch result {
            case .success(let boss):
                Debug.print("Retrieved Boss \(boss.name)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getChallengeLeaderboards(realm: String, region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getChallengeLeaderboards(realm: realm, region: region, locale: locale) { result in
            switch result {
            case .success(let challenges):
                Debug.print("Retrieved \(challenges.count) Challenge(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getTopChallengeLeaderboards(region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getTopChallengeLeaderboards(region: region, locale: locale) { result in
            switch result {
            case .success(let challenges):
                Debug.print("Retrieved \(challenges.count) Challenge(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getCharacter(_ name: String, realm: String, fields: WOWCharacterField? = nil, region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getCharacter(name, realm: realm, fields: fields, region: region, locale: locale) { result in
            switch result {
            case .success(let character):
                Debug.print("Retrieved Character \(character.name) from Realm \(character.realm)")
                
                if let achievements = character.achievements {
                    print("... with \(achievements.achievementsCompleted.count) Completed Achievement(s)")
                }
                
                if let appearance = character.appearance {
                    print("... with face variation \(appearance.faceVariation)")
                }
                
                if let feed = character.feed {
                    print("... with \(feed.count) Feed Item(s)")
                }
                
                if let guild = character.guild {
                    print("... with Guild \(guild.name)")
                }
                
                if let hunterPets = character.hunterPets {
                    print("... with \(hunterPets.count) Hunter Pet(s)")
                }
                
                if let mounts = character.mounts {
                    print("... with \(mounts.collected.count) Collected Mount(s)")
                }
                
                if let pets = character.pets {
                    print("... with \(pets.collected.count) Collected Pet(s)")
                }
                
                if let petSlots = character.petSlots {
                    print("... with \(petSlots.count) Pet Slot(s)")
                }
                
                if let professions = character.professions {
                    print("... with \(professions.primary.count) Primary Profession(s) and \(professions.secondary.count) Secondary Profession(s)")
                }
                
                if let progression = character.progression {
                    print("... with \(progression.raids.count) Progression Raid(s)")
                }
                
                if let pvp = character.pvp {
                    print("... with 2v2 Arena Bracket Rating \(pvp.brackets.arenaBracket2V2.rating)")
                }
                
                if let quests = character.quests {
                    print("... with \(quests.count) Quest(s)")
                }
                
                if let reputation = character.reputation {
                    print("... with \(reputation.count) Reputation(s)")
                }
                
                if let statistics = character.statistics {
                    print("... with \(statistics.subcategories.count) Statistic Subcategory(s)")
                }
                
                if let stats = character.stats {
                    print("... with Character Health Stat \(stats.health)")
                }
                
                if let talents = character.talents {
                    print("... with \(talents.count) Talent(s)")
                }
                
                if let titles = character.titles {
                    print("... with \(titles.count) Title(s)")
                }
                
                if let audit = character.audit {
                    print("... with Appropriate Armor Type \(audit.appropriateArmorType)")
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getGuild(_ name: String, realm: String, fields: WOWGuildField? = nil, region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getGuild(name, realm: realm, fields: fields, region: region, locale: locale) { result in
            switch result {
            case .success(let guild):
                Debug.print("Retrieved Guild \(guild.name) from Realm \(guild.realm)")
                
                if let achievements = guild.achievements {
                    print("... with \(achievements.achievementsCompleted.count) Completed Achievement(s)")
                }

                if let challenges = guild.challenges {
                    print("... with \(challenges.count) Challenge(s)")
                }

                if let members = guild.members {
                    print("... with \(members.count) Member(s)")
                }

                if let news = guild.news {
                    print("... with \(news.count) News Item(s)")
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getWOWItem(id: Int, region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getItem(id: id, region: region, locale: locale) { result in
            switch result {
            case .success(let item):
                Debug.print("Retrieved WOW Item \(item.name)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getWOWItemSet(setID: Int, region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getItemSet(setID: setID, region: region, locale: locale) { result in
            switch result {
            case .success(let itemSet):
                Debug.print("Retrieved WOW Item Set \(itemSet.name) with \(itemSet.items.count) Item(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getMounts(region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getMounts(region: region, locale: locale) { result in
            switch result {
            case .success(let mounts):
                let groundMounts = mounts.filter { $0.isGround }
                let flyingMounts = mounts.filter { $0.isFlying }
                let aquaticMounts = mounts.filter { $0.isAquatic }
                let jumpingMounts = mounts.filter { $0.isJumping }
                Debug.print("Retrieved \(mounts.count) Mount(s): \(groundMounts.count) Ground, \(flyingMounts.count) Flying, \(aquaticMounts.count) Aquatic, \(jumpingMounts.count) Jumping")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getPets(region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getPets(region: region, locale: locale) { result in
            switch result {
            case .success(let pets):
                Debug.print("Retrieved \(pets.count) Pet(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getPetAbility(abilityID: Int, region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getPetAbility(abilityID: abilityID, region: region, locale: locale) { result in
            switch result {
            case .success(let petAbility):
                Debug.print("Retrieved Pet Ability \(petAbility.name)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getPetSpecies(speciesID: Int, region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getPetSpecies(speciesID: speciesID, region: region, locale: locale) { result in
            switch result {
            case .success(let petSpecies):
                Debug.print("Retrieved Pet Species \(petSpecies.name)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getPetStats(speciesID: Int, level: Int = 1, breedID: Int = 3, qualityID: Int = 1, region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getPetStats(speciesID: speciesID, level: level, breedID: breedID, qualityID: qualityID, region: region, locale: locale) { result in
            switch result {
            case .success(let petStats):
                Debug.print("Retrieved Pet Stats: health \(petStats.health), power \(petStats.power), speed \(petStats.speed)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getWOWLeaderboard(bracket: WOWLeaderboardBracket, region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getLeaderboard(bracket: bracket, region: region, locale: locale) { result in
            switch result {
            case .success(let leaderboard):
                Debug.print("Retrieved WOW Leaderboard with \(leaderboard.rows.count) entry(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getWOWQuest(id: Int, region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getQuest(id: id, region: region, locale: locale) { result in
            switch result {
            case .success(let quest):
                Debug.print("Retrieved WOW Quest \(quest.title)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getWOWRealmsStatus(region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getRealmsStatus(region: region, locale: locale) { result in
            switch result {
            case .success(let realms):
                Debug.print("Retrieved Status for \(realms.count) WOW Realm(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getWOWRecipe(id: Int, region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getRecipe(id: id, region: region, locale: locale) { result in
            switch result {
            case .success(let recipe):
                Debug.print("Retrieved WOW Recipe \(recipe.name)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getWOWSpell(id: Int, region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getSpell(id: id, region: region, locale: locale) { result in
            switch result {
            case .success(let spell):
                Debug.print("Retrieved WOW Spell \(spell.name)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getZones(region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getZones(region: region, locale: locale) { result in
            switch result {
            case .success(let zones):
                let raids = zones.filter { $0.isRaid }
                let dungeons = zones.filter { $0.isDungeon }
                Debug.print("Retrieved \(zones.count) Zone(s) with \(raids.count) Raid(s) and \(dungeons.count) Dungeon(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getZone(id: Int, region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getZone(id: id, region: region, locale: locale) { result in
            switch result {
            case .success(let zone):
                Debug.print("Retrieved Zone \(zone.name) with \(zone.bosses.count) Bosses")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getBattlegroups(region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getBattlegroups(region: region, locale: locale) { result in
            switch result {
            case .success(let battlegroups):
                Debug.print("Retrieved \(battlegroups.count) Battlegroup(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getRaces(region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getRaces(region: region, locale: locale) { result in
            switch result {
            case .success(let races):
                Debug.print("Retrieved \(races.count) Race(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getWOWClasses(region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getClasses(region: region, locale: locale) { result in
            switch result {
            case .success(let classes):
                Debug.print("Retrieved \(classes.count) WOW Class(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getWOWAchievements(region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getAchievements(region: region, locale: locale) { result in
            switch result {
            case .success(let achievementCategories):
                Debug.print("Retrieved \(achievementCategories.count) WOW Achievement Category(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getWOWGuildRewards(region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getGuildRewards(region: region, locale: locale) { result in
            switch result {
            case .success(let rewards):
                Debug.print("Retrieved \(rewards.count) WOW Guild Reward(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getWOWGuildPerks(region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getGuildPerks(region: region, locale: locale) { result in
            switch result {
            case .success(let perks):
                Debug.print("Retrieved \(perks.count) WOW Guild Perk(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getWOWGuildAchievements(region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getGuildAchievements(region: region, locale: locale) { result in
            switch result {
            case .success(let achievementCategories):
                Debug.print("Retrieved \(achievementCategories.count) WOW Guild Achievement Category(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getItemClasses(region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getGuildAchievements(region: region, locale: locale) { result in
            switch result {
            case .success(let itemClasses):
                Debug.print("Retrieved \(itemClasses.count) Item Class(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getTalents(region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getTalents(region: region, locale: locale) { result in
            switch result {
            case .success(let talentDictionary):
                Debug.print("Retrieved Talents for \(talentDictionary.keys.count) Class(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getPetTypes(region: APIRegion = .us, locale: APILocale = .en_US) {
        wowMC.getPetTypes(region: region, locale: locale) { result in
            switch result {
            case .success(let petTypes):
                Debug.print("Retrieved \(petTypes.count) Pet Type(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    
    // MARK: D3
    
    func getActs(region: APIRegion = .us, locale: APILocale = .en_US) {
        d3MC.getActs(region: region, locale: locale) { result in
            switch result {
            case .success(let acts):
                Debug.print("Retrieved \(acts.count) Acts")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getAct(_ id: Int, region: APIRegion = .us, locale: APILocale = .en_US) {
        d3MC.getAct(id, region: region, locale: locale) { result in
            switch result {
            case .success(let act):
                Debug.print("Retrieved \(act.name)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getArtisan(_ slug: String, region: APIRegion = .us, locale: APILocale = .en_US) {
        d3MC.getArtisan(slug, region: region, locale: locale) { result in
            switch result {
            case .success(let artisan):
                Debug.print("Artisan \(artisan.name) has \(artisan.training.tiers.first!.trainedRecipes.count) Trained Recipes at first tier")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getRecipe(_ recipeSlug: String, forArtisan artisanSlug: String, region: APIRegion = .us, locale: APILocale = .en_US) {
        d3MC.getRecipe(recipeSlug, forArtisan: artisanSlug, region: region, locale: locale) { result in
            switch result {
            case .success(let recipe):
                Debug.print("Recipe \(recipe.name) has \(recipe.reagents.count) Reagents and produces \(recipe.itemProduced.name)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getFollower(_ slug: String, region: APIRegion = .us, locale: APILocale = .en_US) {
        d3MC.getFollower(slug, region: region, locale: locale) { result in
            switch result {
            case .success(let follower):
                Debug.print("Follower \(follower.name) has \(follower.skills.count) Skills")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getClass(_ slug: String, region: APIRegion = .us, locale: APILocale = .en_US) {
        d3MC.getClass(slug, region: region, locale: locale) { result in
            switch result {
            case .success(let d3Class):
                Debug.print("Class \(d3Class.name) has \(d3Class.skills.active.count) Active Skills")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getSkill(_ skillSlug: String, forClass classSlug: String, region: APIRegion = .us, locale: APILocale = .en_US) {
        d3MC.getSkill(skillSlug, forClass: classSlug, region: region, locale: locale) { result in
            switch result {
            case .success(let skillConfig):
                Debug.print("Skill \(skillConfig.skill.name) has \(skillConfig.runes?.count ?? 0) Runes")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getD3ItemTypes(region: APIRegion = .us, locale: APILocale = .en_US) {
        d3MC.getItemTypes(region: region, locale: locale) { result in
            switch result {
            case .success(let itemTypes):
                Debug.print("Retrieved \(itemTypes.count) Item Type(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getD3ItemsByType(_ typeSlug: String, region: APIRegion = .us, locale: APILocale = .en_US) {
        d3MC.getItemsByType(typeSlug, region: region, locale: locale) { result in
            switch result {
            case .success(let items):
                Debug.print("Retrieved \(items.count) Item(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getD3Item(_ slugAndID: String, region: APIRegion = .us, locale: APILocale = .en_US) {
        d3MC.getItem(slugAndID, region: region, locale: locale) { result in
            switch result {
            case .success(let item):
                Debug.print("Retrieved Full Item \(item.name)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getProfile(battleTag: String, region: APIRegion = .us, locale: APILocale = .en_US) {
        d3MC.getProfile(battleTag: battleTag, region: region, locale: locale) { result in
            switch result {
            case .success(let profile):
                Debug.print("Retrieved Profile \(profile.battleTag)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getHero(_ heroID: Int, for battleTag: String, region: APIRegion = .us, locale: APILocale = .en_US) {
        d3MC.getHero(heroID, for: battleTag, region: region, locale: locale) { result in
            switch result {
            case .success(let hero):
                Debug.print("Retrieved Hero \(hero.name) with Main Hand Item \(hero.items.mainHand?.name ?? "no item")")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getItems(forHero heroID: Int, forBattleTag battleTag: String, region: APIRegion = .us, locale: APILocale = .en_US) {
        d3MC.getItems(forHero: heroID, forBattleTag: battleTag, region: region, locale: locale) { result in
            switch result {
            case .success(let equippedItems):
                let slots = [equippedItems.head?.slots,
                             equippedItems.neck?.slots,
                             equippedItems.torso?.slots,
                             equippedItems.shoulders?.slots,
                             equippedItems.legs?.slots,
                             equippedItems.waist?.slots,
                             equippedItems.hands?.slots,
                             equippedItems.bracers?.slots,
                             equippedItems.feet?.slots,
                             equippedItems.leftFinger?.slots,
                             equippedItems.rightFinger?.slots,
                             equippedItems.mainHand?.slots,
                             equippedItems.offHand?.slots].compactMap({$0})
                
                Debug.print("Hero \(heroID) has items equipped to \(slots.joined(separator: ", "))")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getFollowerItems(forHero heroID: Int, forBattleTag battleTag: String, region: APIRegion = .us, locale: APILocale = .en_US) {
        d3MC.getFollowerItems(forHero: heroID, forBattleTag: battleTag, region: region, locale: locale) { result in
            switch result {
            case .success(let heroFollower):
                let slots: (FullEquippedItems) -> [String] = { followerItems in
                    return [followerItems.head?.slots,
                            followerItems.neck?.slots,
                            followerItems.torso?.slots,
                            followerItems.shoulders?.slots,
                            followerItems.legs?.slots,
                            followerItems.waist?.slots,
                            followerItems.hands?.slots,
                            followerItems.bracers?.slots,
                            followerItems.feet?.slots,
                            followerItems.leftFinger?.slots,
                            followerItems.rightFinger?.slots,
                            followerItems.mainHand?.slots,
                            followerItems.offHand?.slots].compactMap({$0})
                }
                
                Debug.print("Hero \(heroID)'s templar has items equipped to \(slots(heroFollower.templar).joined(separator: ", "))")
                Debug.print("Hero \(heroID)'s scoundrel has items equipped to \(slots(heroFollower.scoundrel).joined(separator: ", "))")
                Debug.print("Hero \(heroID)'s enchantress has items equipped to \(slots(heroFollower.enchantress).joined(separator: ", "))")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getSeasons(region: APIRegion = .us) {
        d3MC.getSeasons(region: region) { result in
            switch result {
            case .success(let seasonIndex):
                Debug.print("Retrieved \(seasonIndex.season.count) Seasons")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getLeaderboards(forSeason seasonID: Int, region: APIRegion = .us) {
        d3MC.getLeaderboards(forSeason: seasonID, region: region) { result in
            switch result {
            case .success(let seasonLeaderboard):
                Debug.print("Retrieved \(seasonLeaderboard.leaderboard.count) Leaderboards for Season \(seasonID)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getLeaderboard(_ leaderboard: String, forSeason seasonID: Int, region: APIRegion = .us) {
        d3MC.getLeaderboard(leaderboard, forSeason: seasonID, region: region) { result in
            switch result {
            case .success(let leaderboard):
                Debug.print("Retrieved Season Leaderboard \(leaderboard.title.en_US ?? "") which has \(leaderboard.column.count) Column(s) and \(leaderboard.row.count) Entry(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getEras(region: APIRegion = .us) {
        d3MC.getEras(region: region) { result in
            switch result {
            case .success(let eraIndex):
                Debug.print("Retrieved \(eraIndex.era.count) Eras")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getLeaderboards(forEra eraID: Int, region: APIRegion = .us) {
        d3MC.getLeaderboards(forEra: eraID, region: region) { result in
            switch result {
            case .success(let eraLeaderboard):
                Debug.print("Retrieved \(eraLeaderboard.leaderboard.count) Leaderboards for Era \(eraID)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getLeaderboard(_ leaderboard: String, forEra eraID: Int, region: APIRegion = .us) {
        d3MC.getLeaderboard(leaderboard, forEra: eraID, region: region) { result in
            switch result {
            case .success(let leaderboard):
                Debug.print("Retrieved Era Leaderboard \(leaderboard.title.en_US ?? "") which has \(leaderboard.column.count) Column(s) and \(leaderboard.row.count) Entry(s)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    
    // MARK: SC2
    
    func getCharacter(id: Int, profileName: String, sc2Region: Int, region: APIRegion = .us, locale: APILocale = .en_US) {
        sc2MC.getCharacter(id: id, profileName: profileName, sc2Region: sc2Region, region: region, locale: locale) { result in
            switch result {
            case .success(let character):
                Debug.print("Retrieved \(character.displayName) with \(character.achievements.achievements.count) unlocked Achievements")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getLadders(id: Int, profileName: String, sc2Region: Int, region: APIRegion = .us, locale: APILocale = .en_US) {
        sc2MC.getLadders(id: id, profileName: profileName, sc2Region: sc2Region, region: region, locale: locale) { result in
            switch result {
            case .success(let ladderOverview):
                Debug.print("Retrieved Current Season Ladder \(ladderOverview.currentSeason.first!.ladder.first!.ladderName)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getMatches(id: Int, profileName: String, sc2Region: Int, region: APIRegion = .us, locale: APILocale = .en_US) {
        sc2MC.getMatches(id: id, profileName: profileName, sc2Region: sc2Region, region: region, locale: locale) { result in
            switch result {
            case .success(let matches):
                Debug.print("Retrieved \(matches.count) Matches")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getLadder(id: Int, region: APIRegion = .us, locale: APILocale = .en_US) {
        sc2MC.getLadder(id: id, region: region, locale: locale) { result in
            switch result {
            case .success(let ladder):
                Debug.print("Retrieved Ladder 263156 with \(ladder.ladderMembers.count) Members")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getSC2Achievements(region: APIRegion = .us, locale: APILocale = .en_US) {
        sc2MC.getAchievements(region: region, locale: locale) { result in
            switch result {
            case .success(let achievementsIndex):
                Debug.print("Retrieved \(achievementsIndex.achievements.count) Achievements and \(achievementsIndex.categories.count) Categories")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getSC2Rewards(region: APIRegion = .us, locale: APILocale = .en_US) {
        sc2MC.getRewards(region: region, locale: locale) { result in
            switch result {
            case .success(let rewards):
                Debug.print("Retrieved \(rewards.count) Rewards")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    
    // MARK: - Error handling
    
    func handleError(_ error: HTTPError, function: String = #function) {
        Debug.print(function + ": " + error.message)
    }
    
    
    
    // MARK: - Views
    
    func setSignIn(_ signIn: Bool) {
        let title = signIn ? "Sign In" : "Sign Out"
        signInBtn.setTitle(title, for: .normal)
    }
}



extension ViewController: UserAuthDelegate {
    func didReceiveUserAccessResult(_ result: Result<String>) {
        switch result {
        case .success(let token):
            Debug.print("userAccessToken: \(token)")
            // TODO: Save to keychain if new
            
            Debug.print("Ready for profile web services")
            self.startProfileCalls()
            self.setSignIn(false)
        case .failure(let error):
            handleError(error)
            self.setSignIn(true)
        }
    }
}
