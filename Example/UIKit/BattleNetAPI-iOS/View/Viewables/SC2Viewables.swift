//
//  SC2Viewables.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 5/4/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import Foundation
import BattleNetAPI


// MARK: - Ladder

extension LadderSummary: Viewable {
    var cell: CellContents {
        return CellContents(title: "Ladder", subtitle: "\(allLadderMemberships.count) Membership(s)", type: .object(self))
    }
}


extension ShowCaseEntry: Viewable {
    var cell: CellContents {
        return CellContents(title: "Show Case Entry", subtitle: "League \(leagueName)", type: .object(self))
    }
}


extension PlacementMatch: Viewable {
    var cell: CellContents {
        return CellContents(title: "Placement Match", subtitle: "Game Mode: \(localizedGameMode)", type: .object(self))
    }
}


extension LadderMembership: Viewable {
    var cell: CellContents {
        return CellContents(title: "Ladder Membership", subtitle: "Game Mode: \(localizedGameMode)", type: .object(self))
    }
}


extension Team: Viewable {
    var cell: CellContents {
        return CellContents(title: "Team", subtitle: "Game Mode: \(localizedGameMode)", type: .object(self))
    }
}


extension TeamMember: Viewable {
    var cell: CellContents {
        return CellContents(title: "Team Member", subtitle: "\(name)", type: .object(self))
    }
}


extension Ladder: Viewable {
    var cell: CellContents {
        return CellContents(title: "Ladder", subtitle: "\(ladderTeams.count) Ladder Team(s)", type: .object(self))
    }
}


extension LadderTeam: Viewable {
    var cell: CellContents {
        return CellContents(title: "Ladder Team", subtitle: "\(teamMembers.count) Team Member(s)", type: .object(self))
    }
}


extension LadderTeamMember: Viewable {
    var cell: CellContents {
        return CellContents(title: "Ladder Team Member", subtitle: "\(displayName)", type: .object(self))
    }
}


extension FavoriteRace: StringRawRepresentable {
    
}


extension RanksAndPool: Viewable {
    var cell: CellContents {
        return CellContents(title: "Ranks and Pool", subtitle: "Rank \(rank), Bonus Pool \(bonusPool)", type: .object(self))
    }
}


extension GrandmasterLeaderboard: Viewable {
    var cell: CellContents {
        return CellContents(title: "Grandmaster Leaderboard", subtitle: "\(ladderTeams.count) Ladder Team(s)", type: .object(self))
    }
}



// MARK: - League

extension League: Viewable {
    var cell: CellContents {
        return CellContents(title: "League", subtitle: _links.link.href, type: .object(self))
    }
}


extension LeagueKey: Viewable {
    var cell: CellContents {
        return CellContents(title: "League Key", subtitle: "League ID \(leagueID)", type: .object(self))
    }
}


extension LeagueTier: Viewable {
    var cell: CellContents {
        return CellContents(title: "League Tier", subtitle: "ID \(id)", type: .object(self))
    }
}


extension Division: Viewable {
    var cell: CellContents {
        return CellContents(title: "League Tier", subtitle: "ID \(id)", type: .object(self))
    }
}



// MARK: - LeagueEnums

extension LeagueQueue: StringRawRepresentable {
    
}


extension LeagueTeam: StringRawRepresentable {
    
}


extension LeagueType: StringRawRepresentable {
    
}



// MARK: - Matches

extension MatchIndex: Viewable {
    var cell: CellContents {
        return CellContents(title: "Match Index", subtitle: "\(matches.count) Match(s)", type: .object(self))
    }
}


extension Match: Viewable {
    var cell: CellContents {
        return CellContents(title: "Match", subtitle: "Map \(map), Type \(type)", type: .object(self))
    }
}



// MARK: - SC2Achievement

extension SC2Achievement: Viewable {
    var cell: CellContents {
        return CellContents(title: "Achievement", subtitle: title, type: .object(self))
    }
}



// MARK: - SC2Category

extension SC2Category: Viewable {
    var cell: CellContents {
        return CellContents(title: "Category", subtitle: name, type: .object(self))
    }
}



// MARK: - SC2Criteria

extension SC2Criteria: Viewable {
    var cell: CellContents {
        return CellContents(title: "Criteria", subtitle: "ID \(id)", type: .object(self))
    }
}



// MARK: - SC2Profile

extension SC2ProfileData: Viewable {
    var cell: CellContents {
        return CellContents(title: "Profile", subtitle: "\(rewards.count) Reward(s), \(achievements.count) Achievements", type: .object(self))
    }
}


extension SC2ProfileMetadata: Viewable {
    var cell: CellContents {
        return CellContents(title: "Profile", subtitle: name, type: .object(self))
    }
}


extension SC2Profile: Viewable {
    var cell: CellContents {
        return CellContents(title: "Profile", subtitle: "Summary Name: \(summary.displayName)", type: .object(self))
    }
}



extension SC2ProfileSummary: Viewable {
    var cell: CellContents {
        return CellContents(title: "Profile Summary", subtitle: displayName, type: .object(self))
    }
}


extension SC2ProfileSnapshot: Viewable {
    var cell: CellContents {
        return CellContents(title: "Profile Snapshot", subtitle: "\(seasonSnapshot.keys.count) Season(s)", type: .object(self))
    }
}


extension SeasonSnapshot: Viewable {
    var cell: CellContents {
        return CellContents(title: "Season Snapshot", subtitle: "Rank \(rank)", type: .object(self))
    }
}


extension SC2ProfileCareer: Viewable {
    var cell: CellContents {
        return CellContents(title: "Profile Career", subtitle: "\(totalCareerGames) Total Game(s)", type: .object(self))
    }
}


extension BestFinish: Viewable {
    var cell: CellContents {
        return CellContents(title: "Best Finish", subtitle: "Times Achieved: \(timesAchieved)", type: .object(self))
    }
}


extension SC2ProfileCampaign: Viewable {
    var cell: CellContents {
        return CellContents(title: "Campagin", subtitle: "", type: .object(self))
    }
}


extension DifficultyCompleted: Viewable {
    var cell: CellContents {
        return CellContents(title: "Difficulty Completed", subtitle: "", type: .object(self))
    }
}


extension SC2ProfileSwarmLevel: Viewable {
    var cell: CellContents {
        return CellContents(title: "Swarm Level", subtitle: "Level \(level)", type: .object(self))
    }
}


extension RaceLevelPoints: Viewable {
    var cell: CellContents {
        return CellContents(title: "Level Points", subtitle: "Level \(level)", type: .object(self))
    }
}


extension CategoryPointProgress: Viewable {
    var cell: CellContents {
        return CellContents(title: "Category Point Progress", subtitle: "\(categoryID): \(pointsEarned)", type: .object(self))
    }
}


extension EarnedAchievement: Viewable {
    var cell: CellContents {
        return CellContents(title: "Earned Achievement", subtitle: achievementID, type: .object(self))
    }
}


extension SC2AchievementCriterion: Viewable {
    var cell: CellContents {
        return CellContents(title: "Achievement Criteron", subtitle: criterionID, type: .object(self))
    }
}


extension SC2AchievementEarned: Viewable {
    var cell: CellContents {
        return CellContents(title: "Achievement Earned", subtitle: "Quantity \(quantity)", type: .object(self))
    }
}


extension EarnedReward: Viewable {
    var cell: CellContents {
        return CellContents(title: "Earned Reward", subtitle: rewardID, type: .object(self))
    }
}



// MARK: - SC2Season

extension SC2Season: Viewable {
    var cell: CellContents {
        return CellContents(title: "Season", subtitle: "\(seasonID)", type: .object(self))
    }
}



// MARK: - SC2Reward

extension SC2Reward: Viewable {
    var cell: CellContents {
        return CellContents(title: "Reward", subtitle: name, type: .object(self))
    }
}
