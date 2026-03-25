# API Implementation Status

This table shows the current implementation status for each Blizzard API endpoint.

**Legend:**
- ✅ **Data** — A raw `Data` request is implemented (e.g. `battleNetAPI.wow.getSpell(id:)`)
- ✅ **Model** — A decoded-model request is implemented (e.g. `battleNetAPI.wow.decoded.getSpell(id:)`)
- ✅ **Tests** — A unit test exercises the live service call and model decoding
- ⬜ — Not yet implemented
- ❓ — In source code but not confirmed in API documentation

---

## Diablo 3

### Game Data APIs

| Endpoint | Data | Model | Tests |
|---|:---:|:---:|:---:|
| Get Season Index | ✅ | ✅ | ✅ |
| Get Leaderboards for Season | ✅ | ✅ | ✅ |
| Get Leaderboard for Season | ✅ | ✅ | ✅ |
| Get Era Index | ✅ | ✅ | ✅ |
| Get Leaderboards for Era | ✅ | ✅ | ✅ |
| Get Leaderboard for Era | ✅ | ✅ | ✅ |

### Community APIs

| Endpoint | Data | Model | Tests |
|---|:---:|:---:|:---:|
| Get Act Index | ✅ | ✅ | ✅ |
| Get Act | ✅ | ✅ | ✅ |
| Get Artisan | ✅ | ✅ | ✅ |
| Get Recipe (Artisan) | ✅ | ✅ | ✅ |
| Get Follower | ✅ | ✅ | ✅ |
| Get Class | ✅ | ✅ | ✅ |
| Get Skill | ✅ | ✅ | ✅ |
| Get Item Type Index | ✅ | ✅ | ✅ |
| Get Items by Type | ✅ | ✅ | ✅ |
| Get Item | ✅ | ✅ | ✅ |

### Profile APIs

| Endpoint | Data | Model | Tests |
|---|:---:|:---:|:---:|
| Get Profile | ✅ | ✅ | ✅ |
| Get Hero | ✅ | ✅ | ✅ |
| Get Items for Hero | ✅ | ✅ | ✅ |
| Get Follower Items for Hero | ✅ | ✅ | ✅ |

---

## Hearthstone

> ⚠️ Not yet implemented. All endpoints below require a new `WS_Hearthstone` web service.

### Game Data APIs

| Endpoint | Data | Model | Tests |
|---|:---:|:---:|:---:|
| **Cards API** | | | |
| Search Cards | ⬜ | ⬜ | ⬜ |
| Fetch One Card | ⬜ | ⬜ | ⬜ |
| **Card Backs API** | | | |
| Search Card Backs | ⬜ | ⬜ | ⬜ |
| Fetch One Card Back | ⬜ | ⬜ | ⬜ |
| **Deck API** | | | |
| Get Deck (by deck code) | ⬜ | ⬜ | ⬜ |
| **Metadata API** | | | |
| Get All Metadata | ⬜ | ⬜ | ⬜ |
| Get Metadata by Type | ⬜ | ⬜ | ⬜ |

---

## StarCraft 2

### Game Data APIs

| Endpoint | Data | Model | Tests |
|---|:---:|:---:|:---:|
| Get League Data | ✅ | ✅ | ✅ |

### Community APIs — Profile

| Endpoint | Data | Model | Tests |
|---|:---:|:---:|:---:|
| Get Profile Data (static) | ✅ | ✅ | ✅ |
| Get Profile Metadata | ✅ | ✅ | ✅ |
| Get Profile | ✅ | ✅ | ✅ |
| Get Ladder Summary | ✅ | ✅ | ✅ |
| Get Ladder | ✅ | ✅ | ✅ |
| Get Grandmaster Leaderboard | ✅ | ✅ | ✅ |
| Get Ladder Season | ✅ | ✅ | ✅ |
| Get Player (Account) | ✅ | ✅ | ✅ |

### Community APIs — Legacy

| Endpoint | Data | Model | Tests |
|---|:---:|:---:|:---:|
| Get Profile (Legacy) | ✅ | ⬜ | ⬜ |
| Get Ladders (Legacy) | ✅ | ⬜ | ⬜ |
| Get Match History (Legacy) | ✅ | ⬜ | ⬜ |
| Get Ladder (Legacy) | ✅ | ⬜ | ⬜ |
| Get Achievements (Legacy) | ✅ | ⬜ | ⬜ |
| Get Rewards (Legacy) | ✅ | ⬜ | ⬜ |

### Community APIs — China (CN)

| Endpoint | Data | Model | Tests |
|---|:---:|:---:|:---:|
| Get CN Profile | ✅ | ⬜ | ⬜ |
| Get CN Ladders | ✅ | ⬜ | ⬜ |
| Get CN Match History | ✅ | ⬜ | ⬜ |
| Get CN Ladder | ✅ | ⬜ | ⬜ |
| Get CN Achievements | ✅ | ⬜ | ⬜ |
| Get CN Rewards | ✅ | ⬜ | ⬜ |

---

## World of Warcraft (Retail)

### Game Data APIs

| Endpoint | Data | Model | Tests |
|---|:---:|:---:|:---:|
| **Achievement API** | | | |
| Get Achievement Index | ✅ | ✅ | ✅ |
| Get Achievement | ✅ | ✅ | ✅ |
| Get Achievement Media | ✅ | ✅ | ✅ |
| Get Achievement Category Index | ✅ | ✅ | ✅ |
| Get Achievement Category | ✅ | ✅ | ✅ |
| **Auction House API** | | | |
| Get Auctions (Connected Realm) | ✅ | ✅ | ✅ |
| Get Auction Commodities | ⬜ | ⬜ | ⬜ |
| **Azerite Essence API** | | | |
| Get Azerite Essence Index | ✅ | ⬜ | ⬜ |
| Get Azerite Essence | ✅ | ⬜ | ⬜ |
| Search Azerite Essence | ✅ | ⬜ | ⬜ |
| Get Azerite Essence Media | ✅ | ⬜ | ⬜ |
| **Connected Realm API** | | | |
| Get Connected Realm Index | ✅ | ✅ | ✅ |
| Get Connected Realm | ✅ | ✅ | ✅ |
| Search Connected Realms | ✅ | ⬜ | ⬜ |
| **Covenant API** | | | |
| Get Covenant Index | ✅ | ⬜ | ⬜ |
| Get Covenant | ✅ | ⬜ | ⬜ |
| Get Covenant Media | ✅ | ⬜ | ⬜ |
| Get Soulbind Index | ✅ | ⬜ | ⬜ |
| Get Soulbind | ✅ | ⬜ | ⬜ |
| Get Conduit Index | ✅ | ⬜ | ⬜ |
| Get Conduit | ✅ | ⬜ | ⬜ |
| **Creature API** | | | |
| Get Creature Family Index | ✅ | ⬜ | ⬜ |
| Get Creature Family | ✅ | ⬜ | ⬜ |
| Get Creature Type Index | ✅ | ⬜ | ⬜ |
| Get Creature Type | ✅ | ⬜ | ⬜ |
| Get Creature | ✅ | ⬜ | ⬜ |
| Search Creature | ✅ | ⬜ | ⬜ |
| Get Creature Display Media | ✅ | ⬜ | ⬜ |
| Get Creature Family Media | ✅ | ⬜ | ⬜ |
| **Guild Crest API** | | | |
| Get Guild Crest Index | ✅ | ⬜ | ⬜ |
| Get Guild Crest Border Media | ✅ | ⬜ | ⬜ |
| Get Guild Crest Emblem Media | ✅ | ⬜ | ⬜ |
| **Heirloom API** | | | |
| Get Heirloom Index | ⬜ | ⬜ | ⬜ |
| Get Heirloom | ⬜ | ⬜ | ⬜ |
| **Item API** | | | |
| Get Item Class Index | ✅ | ✅ | ⬜ |
| Get Item Class | ✅ | ⬜ | ⬜ |
| Get Item Set Index | ✅ | ⬜ | ⬜ |
| Get Item Set | ✅ | ✅ | ✅ |
| Get Item Subclass | ✅ | ⬜ | ⬜ |
| Get Item | ✅ | ✅ | ✅ |
| Get Item Media | ✅ | ⬜ | ⬜ |
| Search Item | ✅ | ⬜ | ⬜ |
| **Item Appearance API** | | | |
| Get Item Appearance Index | ⬜ | ⬜ | ⬜ |
| Get Item Appearance | ⬜ | ⬜ | ⬜ |
| Get Item Appearance Set Index | ⬜ | ⬜ | ⬜ |
| Get Item Appearance Set | ⬜ | ⬜ | ⬜ |
| Get Item Appearance Slot Index | ⬜ | ⬜ | ⬜ |
| Get Item Appearance by Slot | ⬜ | ⬜ | ⬜ |
| Search Item Appearance | ⬜ | ⬜ | ⬜ |
| **Journal API** | | | |
| Get Journal Expansion Index | ✅ | ⬜ | ⬜ |
| Get Journal Expansion | ✅ | ⬜ | ⬜ |
| Get Journal Encounter Index | ✅ | ⬜ | ⬜ |
| Get Journal Encounter | ✅ | ⬜ | ⬜ |
| Search Journal Encounter | ✅ | ⬜ | ⬜ |
| Get Journal Instance Index | ✅ | ⬜ | ⬜ |
| Get Journal Instance | ✅ | ⬜ | ⬜ |
| Get Journal Instance Media | ✅ | ⬜ | ⬜ |
| **Media Search API** | | | |
| Search Media | ✅ | ⬜ | ⬜ |
| **Modified Crafting API** | | | |
| Get Modified Crafting Index | ✅ | ⬜ | ⬜ |
| Get Modified Crafting Category Index | ✅ | ⬜ | ⬜ |
| Get Modified Crafting Category | ✅ | ⬜ | ⬜ |
| Get Modified Crafting Reagent Slot Type Index | ✅ | ⬜ | ⬜ |
| Get Modified Crafting Reagent Slot Type | ✅ | ⬜ | ⬜ |
| **Mount API** | | | |
| Get Mount Index | ✅ | ✅ | ✅ |
| Get Mount | ✅ | ⬜ | ⬜ |
| Search Mount | ✅ | ⬜ | ⬜ |
| **Mythic Keystone Affix API** | | | |
| Get Mythic Keystone Affix Index | ✅ | ✅ | ✅ |
| Get Mythic Keystone Affix | ✅ | ✅ | ✅ |
| Get Mythic Keystone Affix Media | ✅ | ⬜ | ⬜ |
| **Mythic Keystone Dungeon API** | | | |
| Get Mythic Keystone Dungeon Index | ✅ | ✅ | ✅ |
| Get Mythic Keystone Dungeon | ✅ | ✅ | ✅ |
| Get Mythic Keystone Index | ✅ | ✅ | ✅ |
| Get Mythic Keystone Period Index | ✅ | ✅ | ✅ |
| Get Mythic Keystone Period | ✅ | ✅ | ✅ |
| Get Mythic Keystone Season Index | ✅ | ✅ | ✅ |
| Get Mythic Keystone Season | ✅ | ✅ | ✅ |
| **Mythic Keystone Leaderboard API** | | | |
| Get Mythic Keystone Leaderboard Index | ✅ | ✅ | ✅ |
| Get Mythic Keystone Leaderboard | ✅ | ✅ | ✅ |
| **Mythic Raid Leaderboard API** | | | |
| Get Mythic Raid Leaderboard | ✅ | ✅ | ✅ |
| **Pet API** | | | |
| Get Pet Index | ✅ | ✅ | ✅ |
| Get Pet | ✅ | ⬜ | ⬜ |
| Get Pet Media | ✅ | ⬜ | ⬜ |
| Get Pet Ability Index | ✅ | ⬜ | ⬜ |
| Get Pet Ability | ✅ | ✅ | ✅ |
| Get Pet Ability Media | ✅ | ⬜ | ⬜ |
| **Playable Class API** | | | |
| Get Playable Class Index | ✅ | ✅ | ✅ |
| Get Playable Class | ✅ | ✅ | ✅ |
| Get Playable Class Media | ✅ | ⬜ | ⬜ |
| Get Playable Class PvP Talent Slots | ✅ | ✅ | ✅ |
| **Playable Race API** | | | |
| Get Playable Race Index | ✅ | ✅ | ✅ |
| Get Playable Race | ✅ | ✅ | ✅ |
| **Playable Specialization API** | | | |
| Get Playable Specialization Index | ✅ | ✅ | ✅ |
| Get Playable Specialization | ✅ | ✅ | ✅ |
| Get Playable Specialization Media | ✅ | ⬜ | ⬜ |
| **Player Housing API** | | | |
| Get Decor Index | ⬜ | ⬜ | ⬜ |
| Get Decor | ⬜ | ⬜ | ⬜ |
| Search Decor | ⬜ | ⬜ | ⬜ |
| Get Fixture Index | ⬜ | ⬜ | ⬜ |
| Get Fixture | ⬜ | ⬜ | ⬜ |
| Search Fixture | ⬜ | ⬜ | ⬜ |
| Get Fixture Hook Index | ⬜ | ⬜ | ⬜ |
| Get Fixture Hook | ⬜ | ⬜ | ⬜ |
| Search Fixture Hook | ⬜ | ⬜ | ⬜ |
| Get Neighborhood Map Index | ⬜ | ⬜ | ⬜ |
| Get Neighborhood Map | ⬜ | ⬜ | ⬜ |
| Get Neighborhood | ⬜ | ⬜ | ⬜ |
| Get Room Index | ⬜ | ⬜ | ⬜ |
| Get Room | ⬜ | ⬜ | ⬜ |
| Search Room | ⬜ | ⬜ | ⬜ |
| **Power Type API** | | | |
| Get Power Type Index | ✅ | ✅ | ✅ |
| Get Power Type | ✅ | ✅ | ✅ |
| **Profession API** | | | |
| Get Profession Index | ✅ | ⬜ | ⬜ |
| Get Profession | ✅ | ⬜ | ⬜ |
| Get Profession Media | ✅ | ⬜ | ⬜ |
| Get Profession Skill Tier | ✅ | ⬜ | ⬜ |
| Get Recipe | ✅ | ✅ | ✅ |
| Get Recipe Media | ✅ | ⬜ | ⬜ |
| **PvP Season API** | | | |
| Get PvP Season Index | ✅ | ⬜ | ⬜ |
| Get PvP Season | ✅ | ⬜ | ⬜ |
| Get PvP Leaderboard Index | ✅ | ⬜ | ⬜ |
| Get PvP Leaderboard | ✅ | ✅ | ✅ |
| Get PvP Reward Index | ✅ | ⬜ | ⬜ |
| **PvP Tier API** | | | |
| Get PvP Tier Media | ✅ | ⬜ | ⬜ |
| Get PvP Tier Index | ✅ | ⬜ | ⬜ |
| Get PvP Tier | ✅ | ⬜ | ⬜ |
| **Quest API** | | | |
| Get Quest Index | ✅ | ⬜ | ⬜ |
| Get Quest | ✅ | ✅ | ✅ |
| Get Quest Category Index | ✅ | ⬜ | ⬜ |
| Get Quest Category | ✅ | ⬜ | ⬜ |
| Get Quest Area Index | ✅ | ⬜ | ⬜ |
| Get Quest Area | ✅ | ⬜ | ⬜ |
| Get Quest Type Index | ✅ | ⬜ | ⬜ |
| Get Quest Type | ✅ | ⬜ | ⬜ |
| **Realm API** | | | |
| Get Realm Index | ✅ | ✅ | ✅ |
| Get Realm | ✅ | ✅ | ✅ |
| Search Realm | ✅ | ⬜ | ⬜ |
| **Region API** | | | |
| Get Region Index | ✅ | ✅ | ✅ |
| Get Region | ✅ | ✅ | ✅ |
| **Reputations API** | | | |
| Get Reputation Faction Index | ✅ | ⬜ | ⬜ |
| Get Reputation Faction | ✅ | ⬜ | ⬜ |
| Get Reputation Tier Index | ✅ | ⬜ | ⬜ |
| Get Reputation Tier | ✅ | ⬜ | ⬜ |
| **Spell API** | | | |
| Get Spell | ✅ | ✅ | ✅ |
| Get Spell Media | ✅ | ⬜ | ⬜ |
| Search Spell | ✅ | ⬜ | ⬜ |
| **Talent API** | | | |
| Get Talent Index | ✅ | ✅ | ⬜ |
| Get Talent | ✅ | ⬜ | ⬜ |
| Get PvP Talent Index | ✅ | ⬜ | ⬜ |
| Get PvP Talent | ✅ | ⬜ | ⬜ |
| **Talent Tree API** | | | |
| Get Talent Tree Index | ⬜ | ⬜ | ⬜ |
| Get Talent Tree | ⬜ | ⬜ | ⬜ |
| Get Talent Tree Nodes for Specialization | ⬜ | ⬜ | ⬜ |
| **Tech Talent API** | | | |
| Get Tech Talent Tree Index | ✅ | ⬜ | ⬜ |
| Get Tech Talent Tree | ✅ | ⬜ | ⬜ |
| Get Tech Talent Index | ✅ | ⬜ | ⬜ |
| Get Tech Talent | ✅ | ⬜ | ⬜ |
| Get Tech Talent Media | ✅ | ⬜ | ⬜ |
| **Title API** | | | |
| Get Title Index | ✅ | ⬜ | ⬜ |
| Get Title | ✅ | ⬜ | ⬜ |
| **Token API** | | | |
| Get Token Index | ✅ | ✅ | ✅ |
| **Toy API** | | | |
| Get Toy Index | ⬜ | ⬜ | ⬜ |
| Get Toy | ⬜ | ⬜ | ⬜ |

### Profile APIs

| Endpoint | Data | Model | Tests |
|---|:---:|:---:|:---:|
| **Account Profile API** | | | |
| Get Account Profile Summary | ✅ | ⬜ | ⬜ |
| Get Protected Character Profile Summary | ✅ | ⬜ | ⬜ |
| Get Account Collections Index | ✅ | ⬜ | ⬜ |
| Get Account Mounts Collection Summary | ✅ | ⬜ | ⬜ |
| Get Account Pets Collection Summary | ✅ | ⬜ | ⬜ |
| **Character Achievements API** | | | |
| Get Character Achievements Summary | ✅ | ⬜ | ⬜ |
| Get Character Achievement Statistics | ✅ | ⬜ | ⬜ |
| **Character Appearance API** | | | |
| Get Character Appearance Summary | ✅ | ⬜ | ⬜ |
| **Character Collections API** | | | |
| Get Character Collections Index | ✅ | ✅ | ⬜ |
| Get Character Mounts Collection Summary | ✅ | ⬜ | ⬜ |
| Get Character Pets Collection Summary | ✅ | ⬜ | ⬜ |
| Get Character Heirlooms Collection | ⬜ | ⬜ | ⬜ |
| Get Character Toys Collection | ⬜ | ⬜ | ⬜ |
| Get Character Transmogs Collection | ⬜ | ⬜ | ⬜ |
| Get Character Decor Collection | ⬜ | ⬜ | ⬜ |
| **Character Encounters API** | | | |
| Get Character Encounters Summary | ✅ | ⬜ | ⬜ |
| Get Character Dungeons | ✅ | ⬜ | ⬜ |
| Get Character Raids | ✅ | ⬜ | ⬜ |
| **Character Equipment API** | | | |
| Get Character Equipment Summary | ✅ | ⬜ | ⬜ |
| **Character House API** | | | |
| Get Character House | ⬜ | ⬜ | ⬜ |
| **Character Hunter Pets API** | | | |
| Get Character Hunter Pets Summary | ✅ | ⬜ | ⬜ |
| **Character Media API** | | | |
| Get Character Media Summary | ✅ | ⬜ | ⬜ |
| **Character Mythic Keystone Profile API** | | | |
| Get Character Mythic Keystone Profile Index | ✅ | ✅ | ⬜ |
| Get Character Mythic Keystone Profile Season | ✅ | ✅ | ⬜ |
| **Character Professions API** | | | |
| Get Character Professions Summary | ✅ | ⬜ | ⬜ |
| **Character Profile API** | | | |
| Get Character Profile Summary | ✅ | ✅ | ⬜ |
| Get Character Profile Status | ✅ | ⬜ | ⬜ |
| **Character PvP API** | | | |
| Get Character PvP Bracket Statistics | ✅ | ⬜ | ⬜ |
| Get Character PvP Summary | ✅ | ⬜ | ⬜ |
| **Character Quests API** | | | |
| Get Character Quests | ✅ | ⬜ | ⬜ |
| Get Character Completed Quests | ✅ | ⬜ | ⬜ |
| **Character Reputations API** | | | |
| Get Character Reputations Summary | ✅ | ⬜ | ⬜ |
| **Character Soulbinds API** | | | |
| Get Character Soulbinds | ✅ | ⬜ | ⬜ |
| **Character Specializations API** | | | |
| Get Character Specializations Summary | ✅ | ⬜ | ⬜ |
| **Character Statistics API** | | | |
| Get Character Statistics Summary | ✅ | ⬜ | ⬜ |
| **Character Titles API** | | | |
| Get Character Titles Summary | ✅ | ⬜ | ⬜ |
| **Guild Profile API** | | | |
| Get Guild | ✅ | ✅ | ⬜ |
| Get Guild Activity | ✅ | ⬜ | ⬜ |
| Get Guild Achievements | ✅ | ✅ | ⬜ |
| Get Guild Roster | ✅ | ⬜ | ⬜ |

---

## World of Warcraft Classic

### Game Data APIs

| Endpoint | Data | Model | Tests |
|---|:---:|:---:|:---:|
| **Auction House API** | | | |
| Get Auction House Index (Connected Realm) | ⬜ | ⬜ | ⬜ |
| Get Auction House (by Auction House ID) | ⬜ | ⬜ | ⬜ |
| **Connected Realm API** | | | |
| Get Connected Realm Index | ✅ | ⬜ | ⬜ |
| Get Connected Realm | ✅ | ⬜ | ⬜ |
| Search Connected Realms | ✅ | ⬜ | ⬜ |
| **Creature API** | | | |
| Get Creature Family Index | ✅ | ⬜ | ⬜ |
| Get Creature Family | ✅ | ⬜ | ⬜ |
| Get Creature Type Index | ✅ | ⬜ | ⬜ |
| Get Creature Type | ✅ | ⬜ | ⬜ |
| Get Creature | ✅ | ⬜ | ⬜ |
| Search Creature | ✅ | ⬜ | ⬜ |
| Get Creature Display Media | ✅ | ⬜ | ⬜ |
| Get Creature Family Media | ✅ | ⬜ | ⬜ |
| **Guild Crest API** | | | |
| Get Guild Crest Index | ✅ | ⬜ | ⬜ |
| Get Guild Crest Border Media | ✅ | ⬜ | ⬜ |
| Get Guild Crest Emblem Media | ✅ | ⬜ | ⬜ |
| **Item API** | | | |
| Get Item Class Index | ✅ | ⬜ | ⬜ |
| Get Item Class | ✅ | ⬜ | ⬜ |
| Get Item Set Index | ❓ | ⬜ | ⬜ |
| Get Item Set | ❓ | ⬜ | ⬜ |
| Get Item Subclass | ✅ | ⬜ | ⬜ |
| Get Item | ✅ | ⬜ | ⬜ |
| Get Item Media | ✅ | ⬜ | ⬜ |
| Search Item | ✅ | ⬜ | ⬜ |
| **Media Search API** | | | |
| Search Media | ✅ | ⬜ | ⬜ |
| **Playable Class API** | | | |
| Get Playable Class Index | ✅ | ⬜ | ⬜ |
| Get Playable Class | ✅ | ⬜ | ⬜ |
| Get Playable Class Media | ✅ | ⬜ | ⬜ |
| **Playable Race API** | | | |
| Get Playable Race Index | ✅ | ⬜ | ⬜ |
| Get Playable Race | ✅ | ⬜ | ⬜ |
| **Power Type API** | | | |
| Get Power Type Index | ✅ | ⬜ | ⬜ |
| Get Power Type | ✅ | ⬜ | ⬜ |
| **PvP Season API** | | | |
| Get PvP Region Index | ⬜ | ⬜ | ⬜ |
| Get PvP Season Index (by Region) | ⬜ | ⬜ | ⬜ |
| Get PvP Season (by Region) | ⬜ | ⬜ | ⬜ |
| Get PvP Leaderboard Index (by Region/Season) | ⬜ | ⬜ | ⬜ |
| Get PvP Leaderboard (by Region/Season) | ⬜ | ⬜ | ⬜ |
| Get PvP Reward Index (by Region/Season) | ⬜ | ⬜ | ⬜ |
| **Realm API** | | | |
| Get Realm Index | ✅ | ⬜ | ⬜ |
| Get Realm | ✅ | ⬜ | ⬜ |
| Search Realm | ✅ | ⬜ | ⬜ |
| **Region API** | | | |
| Get Region Index | ✅ | ⬜ | ⬜ |
| Get Region | ✅ | ⬜ | ⬜ |
| **Token API** | | | |
| Get Token Index | ✅ | ⬜ | ⬜ |

### Profile APIs

> ⚠️ Not yet implemented. The Classic Profile APIs share the same endpoint paths as WoW Retail but under the `profile-classic1x` namespace. A new `WS_WorldOfWarcraftClassic` extension would be needed.

| Endpoint | Data | Model | Tests |
|---|:---:|:---:|:---:|
| **Account Profile API** | | | |
| Get Account Profile Summary | ⬜ | ⬜ | ⬜ |
| Get Protected Character Profile Summary | ⬜ | ⬜ | ⬜ |
| **Character Achievements API** | | | |
| Get Character Achievements Summary | ⬜ | ⬜ | ⬜ |
| Get Character Achievement Statistics | ⬜ | ⬜ | ⬜ |
| **Character Appearance API** | | | |
| Get Character Appearance Summary | ⬜ | ⬜ | ⬜ |
| **Character Equipment API** | | | |
| Get Character Equipment Summary | ⬜ | ⬜ | ⬜ |
| **Character Hunter Pets API** | | | |
| Get Character Hunter Pets Summary | ⬜ | ⬜ | ⬜ |
| **Character Media API** | | | |
| Get Character Media Summary | ⬜ | ⬜ | ⬜ |
| **Character Profile API** | | | |
| Get Character Profile Summary | ⬜ | ⬜ | ⬜ |
| Get Character Profile Status | ⬜ | ⬜ | ⬜ |
| **Character PvP API** | | | |
| Get Character PvP Bracket Statistics | ⬜ | ⬜ | ⬜ |
| Get Character PvP Summary | ⬜ | ⬜ | ⬜ |
| **Character Specializations API** | | | |
| Get Character Specializations Summary | ⬜ | ⬜ | ⬜ |
| **Character Statistics API** | | | |
| Get Character Statistics Summary | ⬜ | ⬜ | ⬜ |
| **Guild Profile API** | | | |
| Get Guild | ⬜ | ⬜ | ⬜ |
| Get Guild Activity | ⬜ | ⬜ | ⬜ |
| Get Guild Achievements | ⬜ | ⬜ | ⬜ |
| Get Guild Roster | ⬜ | ⬜ | ⬜ |
