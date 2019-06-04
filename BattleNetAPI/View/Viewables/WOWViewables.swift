//
//  WOWViewables.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 6/1/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import Foundation


// MARK: - Auction

extension Auction: Viewable {
    var cell: CellContents {
        return CellContents(title: "Auction", subtitle: "\(files.count) File(s)", type: .object(self))
    }
}


extension AuctionFile: Viewable {
    var cell: CellContents {
        return CellContents(title: "Auction File", subtitle: url, type: .object(self))
    }
}



// MARK: - Battlegroups

extension BattlegroupIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Battlegroup", subtitle: "\(battlegroups.count) Battlegroup(s)", type: .object(self))
    }
}


extension Battlegroup: Viewable {
    var cell: CellContents {
        return CellContents(title: "Battlegroup", subtitle: name, type: .object(self))
    }
}



// MARK: - Boss

extension BossIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Boss", subtitle: "\(bosses.count) Boss(s)", type: .object(self))
    }
}


extension Boss: Viewable {
    var cell: CellContents {
        return CellContents(title: "Boss", subtitle: name, type: .object(self))
    }
}


extension NPC: Viewable {
    var cell: CellContents {
        return CellContents(title: "NPC", subtitle: name, type: .object(self))
    }
}


extension RaidBoss: Viewable {
    var cell: CellContents {
        return CellContents(title: "Raid Boss", subtitle: name, type: .object(self))
    }
}



// MARK: - Challenge

extension ChallengeIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Challenge", subtitle: "\(challenges.count) Challenge(s)", type: .object(self))
    }
}


extension Challenge: Viewable {
    var cell: CellContents {
        return CellContents(title: "Challenge", subtitle: "\(groups.count) Group(s)", type: .object(self))
    }
}


extension ChallengeModeGroup: Viewable {
    var cell: CellContents {
        return CellContents(title: "Group", subtitle: "Ranking \(ranking)", type: .object(self))
    }
}


extension ChallengeFactionType: StringRawRepresentable {
    
}


extension ChallengeModeMember: Viewable {
    var cell: CellContents {
        return CellContents(title: "Member", subtitle: character?.name ?? spec.name, type: .object(self))
    }
}


extension ChallengeCriteria: Viewable {
    var cell: CellContents {
        return CellContents(title: "Challenge Criteria", subtitle: "Time: \(time)", type: .object(self))
    }
}


extension ChallengeModeMap: Viewable {
    var cell: CellContents {
        return CellContents(title: "Map", subtitle: name, type: .object(self))
    }
}



// MARK: - ConnectedRealm

extension ConnectedRealmIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Connected Realm", subtitle: "\(connectedRealms.count) Connected Realm(s)", type: .object(self))
    }
}


extension ConnectedRealm: Viewable {
    var cell: CellContents {
        return CellContents(title: "Connected Realm", subtitle: "ID \(id)", type: .object(self))
    }
}


extension ConnectedRealmStatus: Viewable {
    var cell: CellContents {
        return CellContents(title: "Connected Realm Status", subtitle: name, type: .object(self))
    }
}


extension ConnectedRealmPopulation: Viewable {
    var cell: CellContents {
        return CellContents(title: "Connected Realm Population", subtitle: name, type: .object(self))
    }
}



// MARK: - Guild

extension WOWGuild: Viewable {
    var cell: CellContents {
        return CellContents(title: "Guild", subtitle: name, type: .object(self))
    }
}


extension Emblem: Viewable {
    var cell: CellContents {
        return CellContents(title: "Emblem", subtitle: "Icon \(icon)", type: .object(self))
    }
}


extension WOWGuildRewardIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Reward", subtitle: "\(rewards.count) Reward(s)", type: .object(self))
    }
}


extension WOWGuildReward: Viewable {
    var cell: CellContents {
        return CellContents(title: "Reward", subtitle: item.name, type: .object(self))
    }
}


extension WOWGuildProfile: Viewable {
    var cell: CellContents {
        return CellContents(title: "Profile", subtitle: name, type: .object(self))
    }
}


extension GuildMember: Viewable {
    var cell: CellContents {
        return CellContents(title: "Member", subtitle: character?.name ?? spec?.name ?? "", type: .object(self))
    }
}


extension GuildCharacter: Viewable {
    var cell: CellContents {
        return CellContents(title: "Character", subtitle: name, type: .object(self))
    }
}



// MARK: - Mount

extension MountIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Mount", subtitle: "\(mounts.count) Mount(s)", type: .object(self))
    }
}


extension CollectedMountIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Collected Mount", subtitle: "\(collected.count) Collected Mount(s)", type: .object(self))
    }
}


extension Mount: Viewable {
    var cell: CellContents {
        return CellContents(title: "Mount", subtitle: name, type: .object(self))
    }
}



// MARK: - MythicChallengeMode

extension MythicChallengeMode: Viewable {
    var cell: CellContents {
        return CellContents(title: "Mythic Challenge Mode", subtitle: "Current Period \(currentPeriod)", type: .object(self))
    }
}



// MARK: - MythicKeystoneAffix

extension KeystoneAffixIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Keystone Affix", subtitle: "\(affixes.count) Affix(s)", type: .object(self))
    }
}


extension KeystoneAffix: Viewable {
    var cell: CellContents {
        return CellContents(title: "Keystone Affix", subtitle: name, type: .object(self))
    }
}


extension KeystoneAffixSummary: Viewable {
    var cell: CellContents {
        return CellContents(title: "Keystone Affix Summary", subtitle: keystoneAffix.name ?? keystoneAffix.key.href, type: .object(self))
    }
}



// MARK: - MythicKeystoneDungeon

extension MythicKeystoneIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Mythic Keystone", subtitle: _links.link.href, type: .object(self))
    }
}


extension MythicKeystoneDungeonIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Dungeon", subtitle: _links.link.href, type: .object(self))
    }
}


extension MythicKeystoneDungeon: Viewable {
    var cell: CellContents {
        return CellContents(title: "Dungeon", subtitle: name, type: .object(self))
    }
}


extension KeystoneUpgrade: Viewable {
    var cell: CellContents {
        return CellContents(title: "Keystone Upgrade", subtitle: "Upgrade Level \(upgradeLevel)", type: .object(self))
    }
}


extension Map: Viewable {
    var cell: CellContents {
        return CellContents(title: "Map", subtitle: name, type: .object(self))
    }
}


extension MythicKeystonePeriodIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Period", subtitle: _links.link.href, type: .object(self))
    }
}


extension MythicKeystonePeriod: Viewable {
    var cell: CellContents {
        return CellContents(title: "Period", subtitle: "ID \(id)", type: .object(self))
    }
}


extension MythicKeystoneSeasonIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Season", subtitle: _links.link.href, type: .object(self))
    }
}


extension MythicKeystoneSeason: Viewable {
    var cell: CellContents {
        return CellContents(title: "Season", subtitle: "ID \(id)", type: .object(self))
    }
}



// MARK: - MythicKeystoneProfile

extension MythicKeystoneProfile: Viewable {
    var cell: CellContents {
        return CellContents(title: "Profile", subtitle: _links.link.href, type: .object(self))
    }
}


extension CurrentPeriod: Viewable {
    var cell: CellContents {
        return CellContents(title: "Current Period", subtitle: period.name ?? period.key.href, type: .object(self))
    }
}


extension BestRun: Viewable {
    var cell: CellContents {
        return CellContents(title: "Best Run", subtitle: "Duration: \(duration)", type: .object(self))
    }
}


extension Member: Viewable {
    var cell: CellContents {
        return CellContents(title: "Member", subtitle: character.name, type: .object(self))
    }
}


extension MemberCharacter: Viewable {
    var cell: CellContents {
        return CellContents(title: "Character", subtitle: name, type: .object(self))
    }
}


extension MythicKeystoneRealm: Viewable {
    var cell: CellContents {
        return CellContents(title: "Realm", subtitle: slug, type: .object(self))
    }
}


extension MythicKeystoneProfileSeason: Viewable {
    var cell: CellContents {
        return CellContents(title: "Profile Season", subtitle: _links.link.href, type: .object(self))
    }
}



// MARK: - MythicLeaderboard

extension MythicLeaderboardIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Mythic Leaderboard", subtitle: "\(currentLeaderboards.count) Current Leaderboard(s)", type: .object(self))
    }
}


extension MythicLeaderboard: Viewable {
    var cell: CellContents {
        return CellContents(title: "Mythic Leaderboard", subtitle: name, type: .object(self))
    }
}


extension LeadingGroup: Viewable {
    var cell: CellContents {
        return CellContents(title: "Group", subtitle: "Ranking \(ranking)", type: .object(self))
    }
}


extension PartyMember: Viewable {
    var cell: CellContents {
        return CellContents(title: "Party Member", subtitle: profile.name, type: .object(self))
    }
}


extension WOWProfile: Viewable {
    var cell: CellContents {
        return CellContents(title: "Profile", subtitle: name, type: .object(self))
    }
}


extension Faction: Viewable {
    var cell: CellContents {
        return CellContents(title: "Faction", subtitle: type.rawValue, type: .object(self))
    }
}


extension FactionType: StringRawRepresentable {
    
}


extension WOWFaction: Viewable {
    var cell: CellContents {
        return CellContents(title: "Faction", subtitle: name, type: .object(self))
    }
}


extension MythicRaidLeaderboard: Viewable {
    var cell: CellContents {
        return CellContents(title: "Mythic Raid Leaderboard", subtitle: slug, type: .object(self))
    }
}


extension Entry: Viewable {
    var cell: CellContents {
        return CellContents(title: "Entry", subtitle: "", type: .object(self))
    }
}


extension Guild: Viewable {
    var cell: CellContents {
        return CellContents(title: "Guild", subtitle: name, type: .object(self))
    }
}



// MARK: - Pet

extension PetIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Pet", subtitle: "\(pets.count) Pet(s)", type: .object(self))
    }
}


extension Pet: Viewable {
    var cell: CellContents {
        return CellContents(title: "Pet", subtitle: name, type: .object(self))
    }
}


extension PetFamily: StringRawRepresentable {
    
}


extension PetStats: Viewable {
    var cell: CellContents {
        return CellContents(title: "Stats", subtitle: "Species ID \(speciesID)", type: .object(self))
    }
}


extension PetSpecies: Viewable {
    var cell: CellContents {
        return CellContents(title: "Species", subtitle: name, type: .object(self))
    }
}


extension PetSpeciesAbility: Viewable {
    var cell: CellContents {
        return CellContents(title: "Species Ability", subtitle: name, type: .object(self))
    }
}


extension PetAbility: Viewable {
    var cell: CellContents {
        return CellContents(title: "Ability", subtitle: name, type: .object(self))
    }
}


extension PetTypeIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Pet Type", subtitle: "\(petTypes.count) Pet Type(s)", type: .object(self))
    }
}


extension PetType: Viewable {
    var cell: CellContents {
        return CellContents(title: "Pet Type", subtitle: name, type: .object(self))
    }
}


extension HunterPet: Viewable {
    var cell: CellContents {
        return CellContents(title: "Hunter Pet", subtitle: name, type: .object(self))
    }
}


extension CollectedPetIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Collected Pet", subtitle: "\(numCollected) Collected", type: .object(self))
    }
}


extension CollectedPet: Viewable {
    var cell: CellContents {
        return CellContents(title: "Collected Pet", subtitle: name, type: .object(self))
    }
}


extension PetSlot: Viewable {
    var cell: CellContents {
        return CellContents(title: "Pet Slot", subtitle: "Slot \(slot)", type: .object(self))
    }
}



// MARK: - Perk

extension PerkIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Perk", subtitle: "\(perks.count) Perks", type: .object(self))
    }
}


extension Perk: Viewable {
    var cell: CellContents {
        return CellContents(title: "Perk", subtitle: "Spell \(spell.name)", type: .object(self))
    }
}



// MARK: - PowerType

extension PowerTypeIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Power Type", subtitle: _links.link.href, type: .object(self))
    }
}


extension PowerType: Viewable {
    var cell: CellContents {
        return CellContents(title: "Pwer Type", subtitle: name, type: .object(self))
    }
}



// MARK: - Realm

extension RealmIndexResult: Viewable {
    var cell: CellContents {
        return CellContents(title: "Realm", subtitle: "\(realms.count) Realm(s)", type: .object(self))
    }
}


extension RealmIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Realm", subtitle: name, type: .object(self))
    }
}


extension Realm: Viewable {
    var cell: CellContents {
        return CellContents(title: "Realm", subtitle: name, type: .object(self))
    }
}


extension RealmInfo: Viewable {
    var cell: CellContents {
        return CellContents(title: "Realm", subtitle: name, type: .object(self))
    }
}


extension WOWRealmIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Realm", subtitle: "\(realms.count) Realm(s)", type: .object(self))
    }
}


extension WOWRealm: Viewable {
    var cell: CellContents {
        return CellContents(title: "Realm", subtitle: name, type: .object(self))
    }
}


extension RealmPopulation: StringRawRepresentable {
    
}


extension RealmType: StringRawRepresentable {
    
}


extension RealmSummary: Viewable {
    var cell: CellContents {
        return CellContents(title: "Realm", subtitle: name, type: .object(self))
    }
}



// MARK: - Region

extension RegionIndexResult: Viewable {
    var cell: CellContents {
        return CellContents(title: "Region", subtitle: "\(regions.count) Regions", type: .object(self))
    }
}


extension Region: Viewable {
    var cell: CellContents {
        return CellContents(title: "Region", subtitle: name, type: .object(self))
    }
}



// MARK: - Specialization

extension SpecializationIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Specialization", subtitle: _links.link.href, type: .object(self))
    }
}


extension Specialization: Viewable {
    var cell: CellContents {
        return CellContents(title: "Specialization", subtitle: name, type: .object(self))
    }
}


extension Role: Viewable {
    var cell: CellContents {
        return CellContents(title: "Role", subtitle: name, type: .object(self))
    }
}


extension TalentTier: Viewable {
    var cell: CellContents {
        return CellContents(title: "Talent Tier", subtitle: "Level \(level) - \(talents.count) Talent(s)", type: .object(self))
    }
}


extension Talent: Viewable {
    var cell: CellContents {
        return CellContents(title: "Talent", subtitle: talent.name ?? talent.key.href, type: .object(self))
    }
}


extension SpellTooltip: Viewable {
    var cell: CellContents {
        return CellContents(title: "Spell Tooltip", subtitle: description, type: .object(self))
    }
}


extension CastTime: StringRawRepresentable {
    
}


extension Range: StringRawRepresentable {
    
}


extension CharacterSpecialization: Viewable {
    var cell: CellContents {
        return CellContents(title: "Specialization", subtitle: name, type: .object(self))
    }
}



// MARK: - Spell

extension Spell: Viewable {
    var cell: CellContents {
        return CellContents(title: "Spell", subtitle: name, type: .object(self))
    }
}



// MARK: - Talent

extension ClassTalent: Viewable {
    var cell: CellContents {
        return CellContents(title: "Talents", subtitle: self.class, type: .object(self))
    }
}


extension RoleType: StringRawRepresentable {
    
}


extension TalentElement: Viewable {
    var cell: CellContents {
        return CellContents(title: "Talent", subtitle: "Tier \(tier)", type: .object(self))
    }
}


extension CharacterSpell: Viewable {
    var cell: CellContents {
        return CellContents(title: "Spell", subtitle: name, type: .object(self))
    }
}


extension CharacterTalent: Viewable {
    var cell: CellContents {
        return CellContents(title: "Talent", subtitle: "\(talents.count) Talent(s)", type: .object(self))
    }
}


extension PVPTalentSlots: Viewable {
    var cell: CellContents {
        return CellContents(title: "Talent Slots", subtitle: "\(talentSlots.count) Slot(s)", type: .object(self))
    }
}


extension TalentSlot: Viewable {
    var cell: CellContents {
        return CellContents(title: "Talent Slot", subtitle: "Slot \(slotNumber)", type: .object(self))
    }
}



// MARK: - Token

extension TokenIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Token", subtitle: "Price \(price)", type: .object(self))
    }
}



// MARK: - User

extension User: Viewable {
    var cell: CellContents {
        return CellContents(title: "User", subtitle: battletag, type: .object(self))
    }
}



// MARK: - WOWAchievement

extension WOWAchievementIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Achievement", subtitle: "\(achievements.count) Achievement(s)", type: .object(self))
    }
}


extension WOWAchievementCategory: Viewable {
    var cell: CellContents {
        return CellContents(title: "Achievement Category", subtitle: name, type: .object(self))
    }
}


extension WOWAchievement: Viewable {
    var cell: CellContents {
        return CellContents(title: "Achievement", subtitle: title, type: .object(self))
    }
}


extension WOWAchievementCriterion: Viewable {
    var cell: CellContents {
        return CellContents(title: "Achievement Criterion", subtitle: description, type: .object(self))
    }
}


extension WOWAchievementStatus: Viewable {
    var cell: CellContents {
        return CellContents(title: "Achievement Status", subtitle: "\(achievementsCompleted.count) Achievement(s) Completed", type: .object(self))
    }
}



// MARK: - WOWCharacter

extension WOWCharacterResult: Viewable {
    var cell: CellContents {
        return CellContents(title: "Character", subtitle: "\(characters.count) Characters", type: .object(self))
    }
}


extension WOWCharacter: Viewable {
    var cell: CellContents {
        return CellContents(title: "Character", subtitle: name, type: .object(self))
    }
}


extension WOWCharacterProfile: Viewable {
    var cell: CellContents {
        return CellContents(title: "Character Profile", subtitle: name, type: .object(self))
    }
}


extension RaceIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Race", subtitle: "\(races.count) Race(s)", type: .object(self))
    }
}


extension Race: Viewable {
    var cell: CellContents {
        return CellContents(title: "Race", subtitle: name, type: .object(self))
    }
}


extension RaceFaction: StringRawRepresentable {
    
}


extension WOWRaceIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Race", subtitle: "\(races.count) Race(s)", type: .object(self))
    }
}


extension WOWRace: Viewable {
    var cell: CellContents {
        return CellContents(title: "Race", subtitle: name, type: .object(self))
    }
}


extension WOWCharacterAppearance: Viewable {
    var cell: CellContents {
        return CellContents(title: "Appearance", subtitle: "", type: .object(self))
    }
}


extension Feed: Viewable {
    var cell: CellContents {
        return CellContents(title: "Feed", subtitle: name ?? type, type: .object(self))
    }
}


extension Professions: Viewable {
    var cell: CellContents {
        return CellContents(title: "Professions", subtitle: "\(primary.count) Primary, \(secondary.count) Secondary", type: .object(self))
    }
}


extension Profession: Viewable {
    var cell: CellContents {
        return CellContents(title: "Profession", subtitle: name, type: .object(self))
    }
}


extension WOWProgression: Viewable {
    var cell: CellContents {
        return CellContents(title: "Progression", subtitle: "\(raids.count) Raid(s)", type: .object(self))
    }
}


extension Raid: Viewable {
    var cell: CellContents {
        return CellContents(title: "Raid", subtitle: name, type: .object(self))
    }
}


extension Reputation: Viewable {
    var cell: CellContents {
        return CellContents(title: "Reputation", subtitle: name, type: .object(self))
    }
}


extension StatisticIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Statistic", subtitle: name, type: .object(self))
    }
}


extension StatisticSubcategory: Viewable {
    var cell: CellContents {
        return CellContents(title: "Statistic Subcategory", subtitle: name, type: .object(self))
    }
}


extension Statistic: Viewable {
    var cell: CellContents {
        return CellContents(title: "Statistic", subtitle: name, type: .object(self))
    }
}


extension WOWCharacterStats: Viewable {
    var cell: CellContents {
        return CellContents(title: "Stats", subtitle: "", type: .object(self))
    }
}


extension WOWCharacterTitle: Viewable {
    var cell: CellContents {
        return CellContents(title: "Title", subtitle: name, type: .object(self))
    }
}


extension Audit: Viewable {
    var cell: CellContents {
        return CellContents(title: "Audit", subtitle: "", type: .object(self))
    }
}



// MARK: - WOWClass

extension WOWClassIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Class", subtitle: "\(classes.count) Class(s)", type: .object(self))
    }
}


extension WOWClass: Viewable {
    var cell: CellContents {
        return CellContents(title: "Class", subtitle: name, type: .object(self))
    }
}


extension GenderName: Viewable {
    var cell: CellContents {
        return CellContents(title: "Gender Name", subtitle: "\(male)/\(female)", type: .object(self))
    }
}


extension GenderName2: Viewable {
    var cell: CellContents {
        return CellContents(title: "Gender Name", subtitle: "\(maleName)/\(femaleName)", type: .object(self))
    }
}


extension WOWCharacterClassIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Class", subtitle: "\(classes.count) Class(s)", type: .object(self))
    }
}


extension WOWCharacterClass: Viewable {
    var cell: CellContents {
        return CellContents(title: "Class", subtitle: name, type: .object(self))
    }
}



// MARK: - WOWItem

extension WOWItem: Viewable {
    var cell: CellContents {
        return CellContents(title: "Item", subtitle: name, type: .object(self))
    }
}


extension BonusSummary: Viewable {
    var cell: CellContents {
        return CellContents(title: "Bonus Summary", subtitle: "", type: .object(self))
    }
}


extension WOWItemSource: Viewable {
    var cell: CellContents {
        return CellContents(title: "Item Source", subtitle: "Source Type \(sourceType)", type: .object(self))
    }
}


extension WOWItemSpell: Viewable {
    var cell: CellContents {
        return CellContents(title: "Item Spell", subtitle: scaledDescription, type: .object(self))
    }
}


extension WeaponInfo: Viewable {
    var cell: CellContents {
        return CellContents(title: "Weapon Info", subtitle: "", type: .object(self))
    }
}


extension Damage: Viewable {
    var cell: CellContents {
        return CellContents(title: "Damage", subtitle: "", type: .object(self))
    }
}


extension WOWItemSummary: Viewable {
    var cell: CellContents {
        return CellContents(title: "Summary", subtitle: name, type: .object(self))
    }
}


extension WOWItemAppearance: Viewable {
    var cell: CellContents {
        return CellContents(title: "Appearance", subtitle: "", type: .object(self))
    }
}


extension TooltipParams: Viewable {
    var cell: CellContents {
        return CellContents(title: "Tooltip Params", subtitle: "", type: .object(self))
    }
}


extension WOWItemUpgrade: Viewable {
    var cell: CellContents {
        return CellContents(title: "Upgrade", subtitle: "", type: .object(self))
    }
}


extension WOWItemStat: Viewable {
    var cell: CellContents {
        return CellContents(title: "Stat", subtitle: "", type: .object(self))
    }
}


extension WOWEquippedItems: Viewable {
    var cell: CellContents {
        return CellContents(title: "Equipped Items", subtitle: "", type: .object(self))
    }
}


extension WOWItemSet: Viewable {
    var cell: CellContents {
        return CellContents(title: "Item Set", subtitle: name, type: .object(self))
    }
}


extension SetBonus: Viewable {
    var cell: CellContents {
        return CellContents(title: "Set Bonus", subtitle: description, type: .object(self))
    }
}


extension ItemClassIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Class", subtitle: "\(classes.count) Class(s)", type: .object(self))
    }
}


extension ItemClass: Viewable {
    var cell: CellContents {
        return CellContents(title: "Class", subtitle: name, type: .object(self))
    }
}


extension ItemSubclass: Viewable {
    var cell: CellContents {
        return CellContents(title: "Subclass", subtitle: name, type: .object(self))
    }
}



// MARK: - WOWLeaderboard

extension WOWLeaderboard: Viewable {
    var cell: CellContents {
        return CellContents(title: "Leaderboard", subtitle: "\(rows.count) Row(s)", type: .object(self))
    }
}


extension WOWLeaderboardBracket: StringRawRepresentable {
    
}


extension WOWLeaderboardEntry: Viewable {
    var cell: CellContents {
        return CellContents(title: "Entry", subtitle: name, type: .object(self))
    }
}


extension WOWPVP: Viewable {
    var cell: CellContents {
        return CellContents(title: "PVP Brackets", subtitle: "", type: .object(self))
    }
}


extension WOWBrackets: Viewable {
    var cell: CellContents {
        return CellContents(title: "Brackets", subtitle: "", type: .object(self))
    }
}


extension WOWArenaBracket: Viewable {
    var cell: CellContents {
        return CellContents(title: "Arema Bracket", subtitle: slug, type: .object(self))
    }
}



// MARK: - WOWQuest

extension WOWQuest: Viewable {
    var cell: CellContents {
        return CellContents(title: "Quest", subtitle: title, type: .object(self))
    }
}



// MARK: - WOWRecipe

extension WOWRecipe: Viewable {
    var cell: CellContents {
        return CellContents(title: "Recipe", subtitle: name, type: .object(self))
    }
}



// MARK: - Zone

extension ZoneIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Zone", subtitle: "\(zones.count) Zone(s)", type: .object(self))
    }
}


extension ZoneInfo: Viewable {
    var cell: CellContents {
        return CellContents(title: "Zone", subtitle: name, type: .object(self))
    }
}


extension Zone: Viewable {
    var cell: CellContents {
        return CellContents(title: "Zone", subtitle: name, type: .object(self))
    }
}


extension ZoneMode: StringRawRepresentable {
    
}


extension ZoneSlug: Viewable {
    var cell: CellContents {
        return CellContents(title: "Zone Slug", subtitle: slug, type: .object(self))
    }
}


extension Location: Viewable {
    var cell: CellContents {
        return CellContents(title: "Location", subtitle: name, type: .object(self))
    }
}


extension NumPlayers: StringRawRepresentable {
    
}
