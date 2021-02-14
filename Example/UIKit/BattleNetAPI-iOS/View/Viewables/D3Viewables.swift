//
//  D3Viewables.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/28/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import Foundation
import BattleNetAPI


// MARK: - Act

extension ActIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Acts", subtitle: "\(acts.count) Total", type: .object(self))
    }
}


extension Act: Viewable {
    var cell: CellContents {
        return CellContents(title: "Act", subtitle: "\(name)", type: .object(self))
    }
}


extension D3Quest: Viewable {
    var cell: CellContents {
        return CellContents(title: "Quest", subtitle: name, type: .object(self))
    }
}



// MARK: - Artisan

extension Artisan: Viewable {
    var cell: CellContents {
        return CellContents(title: "Artisan", subtitle: name, type: .object(self))
    }
}


extension Training: Viewable {
    var cell: CellContents {
        return CellContents(title: "Training", subtitle: "\(tiers.count) Tier(s)", type: .object(self))
    }
}


extension Tier: Viewable {
    var cell: CellContents {
        return CellContents(title: "Tier", subtitle: "Tier \(tier)", type: .object(self))
    }
}


extension D3Recipe: Viewable {
    var cell: CellContents {
        return CellContents(title: "Recipe", subtitle: name, type: .object(self))
    }
}


extension Reagent: Viewable {
    var cell: CellContents {
        return CellContents(title: "Reagent", subtitle: item.name, type: .object(self))
    }
}



// MARK: - D3Class

extension D3Class: Viewable {
    var cell: CellContents {
        return CellContents(title: "Class", subtitle: name, type: .object(self))
    }
}



// MARK: - D3Item

extension D3Item: Viewable {
    var cell: CellContents {
        return CellContents(title: "Item", subtitle: name, type: .object(self))
    }
}


extension D3ItemType: Viewable {
    var cell: CellContents {
        return CellContents(title: "Item Type", subtitle: name, type: .object(self))
    }
}


extension D3EquippedItem: Viewable {
    var cell: CellContents {
        return CellContents(title: "Equipped Item", subtitle: name, type: .object(self))
    }
}


extension D3FullItem: Viewable {
    var cell: CellContents {
        return CellContents(title: "Item", subtitle: name, type: .object(self))
    }
}


extension D3FullEquippedItem: Viewable {
    var cell: CellContents {
        return CellContents(title: "Equipped Item", subtitle: name, type: .object(self))
    }
}


extension D3TwoHandedItemType: Viewable {
    var cell: CellContents {
        return CellContents(title: "Two Handed Item Type", subtitle: id, type: .object(self))
    }
}


extension AttributeSet: Viewable {
    var cell: CellContents {
        return CellContents(title: "Attribute Set", subtitle: "\(primary.count) primaries", type: .object(self))
    }
}


extension Attribute: Viewable {
    var cell: CellContents {
        return CellContents(title: "Attribute", subtitle: text, type: .object(self))
    }
}


extension EquippedAttributeSet: Viewable {
    var cell: CellContents {
        return CellContents(title: "Equipped Attribute Set", subtitle: "\(primary.count) primaries", type: .object(self))
    }
}


extension RandomAffix: Viewable {
    var cell: CellContents {
        return CellContents(title: "Random Affix", subtitle: "\(oneOf.count) Total", type: .object(self))
    }
}


extension EquippedItems: Viewable {
    var cell: CellContents {
        return CellContents(title: "Equipped Items", subtitle: "", type: .object(self))
    }
}


extension FullEquippedItems: Viewable {
    var cell: CellContents {
        return CellContents(title: "Equipped Items", subtitle: "", type: .object(self))
    }
}


extension Gem: Viewable {
    var cell: CellContents {
        return CellContents(title: "Gem", subtitle: item.name, type: .object(self))
    }
}


extension D3ItemSet: Viewable {
    var cell: CellContents {
        return CellContents(title: "Item Set", subtitle: name, type: .object(self))
    }
}


extension Dye: Viewable {
    var cell: CellContents {
        return CellContents(title: "Dye", subtitle: name, type: .object(self))
    }
}



// MARK: - D3Leaderboard

extension LeaderboardColumn: Viewable {
    var cell: CellContents {
        return CellContents(title: "Leaderboard Column", subtitle: label.en_US ?? "Order \(type)", type: .object(self))
    }
}


extension LeaderboardColumnType: StringRawRepresentable {
    
}


extension LeaderboardEntry: Viewable {
    var cell: CellContents {
        return CellContents(title: "Leaderboard Entry", subtitle: "Order \(order)", type: .object(self))
    }
}


extension Datum: Viewable {
    var cell: CellContents {
        return CellContents(title: "Datum", subtitle: id, type: .object(self))
    }
}


extension D3Player: Viewable {
    var cell: CellContents {
        return CellContents(title: "Player", subtitle: key, type: .object(self))
    }
}



// MARK: - D3Profile

extension D3Profile: Viewable {
    var cell: CellContents {
        return CellContents(title: "Profile", subtitle: battleTag, type: .object(self))
    }
}


extension Kills: Viewable {
    var cell: CellContents {
        var subtitle = ""
        
        if let elites = elites {
            subtitle = "Elites \(String(elites))"
        }
        else if let monsters = monsters {
            subtitle = "Monsters \(String(monsters))"
        }
        else if let hardcoreMonsters = hardcoreMonsters {
            subtitle = "Hardcore Monsters \(String(hardcoreMonsters))"
        }
        
        return CellContents(title: "Kills", subtitle: subtitle, type: .object(self))
    }
}


extension TimePlayed: Viewable {
    var cell: CellContents {
        let total = barbarian + crusader + demonHunter + monk + necromancer + witchDoctor + wizard
        return CellContents(title: "Time Played", subtitle: "\(total) Total", type: .object(self))
    }
}


extension D3ProgressionCompletion: Viewable {
    var cell: CellContents {
        let completedCount = [act1, act2, act3, act4, act5].filter { $0 == true }.count
        return CellContents(title: "Progression Completion", subtitle: "\(completedCount) Completed Act(s)", type: .object(self))
    }
}


extension ArtisanLevel: Viewable {
    var cell: CellContents {
        return CellContents(title: "Artisan Level", subtitle: "\(slug): \(level)", type: .object(self))
    }
}



// MARK: - D3Season

extension D3Season: Viewable {
    var cell: CellContents {
        return CellContents(title: "Season", subtitle: String(seasonId), type: .object(self))
    }
}

extension D3SeasonIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Current Season", subtitle: String(currentSeason), type: .object(self))
    }
}


extension D3SeasonLeaderboardIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Season Leaderboard", subtitle: "Season ID \(seasonID)", type: .object(self))
    }
}


extension SeasonLeaderboardLink: Viewable {
    var cell: CellContents {
        return CellContents(title: "Season Leaderboard", subtitle: "Link \(ladder.href)", type: .object(self))
    }
}


extension SeasonLeaderboard: Viewable {
    var cell: CellContents {
        return CellContents(title: "Season Leaderboard", subtitle: "Season \(String(season))", type: .object(self))
    }
}



// MARK: - D3Skill

extension D3Skill: Viewable {
    var cell: CellContents {
        return CellContents(title: "Skill", subtitle: name, type: .object(self))
    }
}


extension D3SkillCategory: Viewable {
    var cell: CellContents {
        return CellContents(title: "Skill Category", subtitle: name, type: .object(self))
    }
}


extension D3SkillSet: Viewable {
    var cell: CellContents {
        return CellContents(title: "Skill Set", subtitle: "\(active.count) active(s), \(passive.count) passive(s)", type: .object(self))
    }
}


extension D3SkillConfiguration: Viewable {
    var cell: CellContents {
        return CellContents(title: "Skill Configuration", subtitle: skill.name, type: .object(self))
    }
}


extension Rune: Viewable {
    var cell: CellContents {
        return CellContents(title: "Rune", subtitle: name, type: .object(self))
    }
}



// MARK: - Era

extension EraIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Era Index", subtitle: "Current Era \(currentEra) of \(era.count)", type: .object(self))
    }
}


extension EraLeaderboardIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Era Leaderboard Index", subtitle: "\(leaderboard.count) Leaderboard(s)", type: .object(self))
    }
}


extension EraLeaderboardLink: Viewable {
    var cell: CellContents {
        return CellContents(title: "Era Leaderboard Link", subtitle: "Ladder Link \(ladder.href)", type: .object(self))
    }
}


extension EraLeaderboard: Viewable {
    var cell: CellContents {
        return CellContents(title: "Era Leaderboard", subtitle: key, type: .object(self))
    }
}



// MARK: - Hero

extension Hero: Viewable {
    var cell: CellContents {
        return CellContents(title: "Hero", subtitle: name, type: .object(self))
    }
}


extension FullHero: Viewable {
    var cell: CellContents {
        return CellContents(title: "Hero", subtitle: name, type: .object(self))
    }
}


extension HeroFollowers: Viewable {
    var cell: CellContents {
        return CellContents(title: "Followers", subtitle: "Levels: Enchantress \(enchantress.level), Scoundrel \(scoundrel.level), Templar \(templar.level)", type: .object(self))
    }
}


extension HeroFollowerItems: Viewable {
    var cell: CellContents {
        return CellContents(title: "Follower Items", subtitle: "Equipped Items for Enchantress, Scoundrel, and Templar", type: .object(self))
    }
}


extension HeroSkillSet: Viewable {
    var cell: CellContents {
        return CellContents(title: "Skill Set", subtitle: "\(active.count) active(s), \(passive.count) passive(s)", type: .object(self))
    }
}


extension D3Progression: Viewable {
    var cell: CellContents {
        let completedCount = [act1, act2, act3, act4, act5].filter { $0.completed == true }.count
        return CellContents(title: "Progression", subtitle: "\(completedCount) Completed Acts", type: .object(self))
    }
}


extension CompletedAct: Viewable {
    var cell: CellContents {
        return CellContents(title: "Completed Act", subtitle: "Completed: \(completed)", type: .object(self))
    }
}


extension D3StatBlock: Viewable {
    var cell: CellContents {
        return CellContents(title: "Stat Block", subtitle: "Stat Values", type: .object(self))
    }
}



// MARK: - Follower

extension Follower: Viewable {
    var cell: CellContents {
        return CellContents(title: "Follower", subtitle: name, type: .object(self))
    }
}


extension FollowerHero: Viewable {
    var cell: CellContents {
        return CellContents(title: "Follower Hero", subtitle: "Level \(level)", type: .object(self))
    }
}


extension FollowerStats: Viewable {
    var cell: CellContents {
        return CellContents(title: "Follower Stats", subtitle: "Experience Bonus \(experienceBonus)", type: .object(self))
    }
}
