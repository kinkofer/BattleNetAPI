# Swift BattleNetAPI

[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
![Platform](https://img.shields.io/badge/Platform-iOS%20|%20macOS-lightgray.svg)

A native Swift client for the [Blizzard Battle.net API](http://develop.battle.net), covering World of Warcraft (Retail and Classic), Diablo 3, and StarCraft 2. Supports async/await, all regions and locales, Game Data and Profile APIs, and requires no third-party dependencies.

Requires a free [Blizzard Developer](http://develop.battle.net) account.


## Installation

Add BattleNetAPI via Swift Package Manager in Xcode (**File → Add Packages**) or in `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/kinkofer/BattleNetAPI", from: "1.0.0")
]
```


## Quick Start

Initialize the client with credentials from your Blizzard Developer account:

```swift
let credentials = BattleNetCredentials(clientID: "CLIENT_ID", clientSecret: "CLIENT_SECRET")
let battleNetAPI = BattleNetAPI(credentials: credentials)
```

Each game's APIs are available as properties on the client:

```swift
// Game Data APIs — only require client credentials
let leaderboardData = try await battleNetAPI.d3.getLeaderboard("rift-barbarian", eraID: 1)
let leagueData      = try await battleNetAPI.sc2.getLeagueData(seasonID: 37, queue: .lotV1v1,
                                                              team: .arranged, league: .grandmaster)
let spellData       = try await battleNetAPI.wow.getSpell(id: 196607)
```

All functions return `Data` by default. A `.decoded` accessor is also available for most endpoints, returning typed Swift structs:

```swift
let act   = try await battleNetAPI.d3.decoded.getAct(1)             // returns Act
let spell = try await battleNetAPI.wow.decoded.getSpell(id: 196607) // returns Spell
```

Profile APIs (player-specific data) require the user to authorize your app first:

```swift
try await battleNetAPI.authenticationManager.getUserAccessToken()

let profile = try await battleNetAPI.d3.getProfile(battleTag: "Username-1234")
let mounts  = try await battleNetAPI.wow.getMountsCollectionSummary()
```


## Documentation

| Guide | Description |
|---|---|
| [Usage](Docs/Usage.md) | Initialization, making calls, handling results, access tokens, framework structure |
| [Authentication](Docs/Authentication.md) | Client credentials, OAuth setup, user sign-in flow, redirect handling |
| [API Status](Docs/APIStatus.md) | Full endpoint list with Data / Model / Test coverage for each game |
| [Contributing](Docs/Contributing.md) | How to add models, tests, or report issues |


## Running Tests

Add your `clientID`, `clientSecret`, `clientAccessToken`, and `userAccessToken` to `BattleNetAPITests.swift`, then run the test suite. Each test calls a live endpoint and verifies that the response decodes correctly into the expected model.

See [API Status](Docs/APIStatus.md) for the current test coverage.


## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

*Not affiliated with Blizzard Entertainment.*
