# Usage Guide

## Getting Started

Add BattleNetAPI to your project via Swift Package Manager. In Xcode, go to **File → Add Packages** and enter the repository URL, or add it directly to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/kinkofer/BattleNetAPI", from: "1.0.0")
]
```

You'll need a free [Blizzard Developer](http://develop.battle.net) account. Register there to get a `clientID` and `clientSecret` for your app.

### Initializing the Client

Create a `BattleNetAPI` instance with your credentials. The optional parameters let you specify a custom `URLSession`, `region`, and `locale`:

```swift
import BattleNetAPI

let credentials = BattleNetCredentials(clientID: "CLIENT_ID", clientSecret: "CLIENT_SECRET")
let battleNetAPI = BattleNetAPI(credentials: credentials)

// With OAuth (required for Profile APIs)
let oauth = BattleNetOAuth(scope: [.d3, .sc2, .wow, .openID],
                           scheme: "YourApp",
                           redirectUrl: "https://redirect.to/YourApp",
                           providerContext: AuthenticationContext())
let battleNetAPI = BattleNetAPI(credentials: credentials, oauth: oauth,
                                session: .shared, region: .us, locale: .en_US)
```

Each game's APIs are accessed through a property on the client:

```swift
battleNetAPI.d3   // Diablo 3
battleNetAPI.sc2  // StarCraft 2
battleNetAPI.wow  // World of Warcraft (Retail)
battleNetAPI.wowClassic  // World of Warcraft Classic
```

---

## Making API Calls

### Game Data APIs (Client Credentials)

Game Data APIs only require the credentials you provided at initialization. Call them directly using `async/await`:

```swift
let leaderboard = try await battleNetAPI.d3.getLeaderboard("rift-barbarian", eraID: 1)
let leagueData = try await battleNetAPI.sc2.getLeagueData(seasonID: 37, queue: .lotV1v1,
                                                           team: .arranged, league: .grandmaster)
let spell = try await battleNetAPI.wow.getSpell(id: 196607)
```

### Profile APIs (User Authorization)

Profile APIs require a player to authorize your app first. See [Authentication.md](Authentication.md) for setup details. Once you have a user access token, call Profile APIs the same way:

```swift
try await battleNetAPI.authenticationManager.getUserAccessToken()

// After authorization:
let profile = try await battleNetAPI.d3.getProfile(battleTag: "BATTLE_TAG")
let sc2Profile = try await battleNetAPI.sc2.getProfileData(sc2Region: .us)
let mounts = try await battleNetAPI.wow.getMountsCollectionSummary()
```

---

## Handling Results

Every API function returns `Data` — the raw JSON response from Blizzard's servers. You can use this directly or decode it.

### Using Raw Data

```swift
do {
    let data = try await battleNetAPI.sc2.getProfileData(sc2Region: .us)
    let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
    print(jsonObject)
} catch {
    print(error.localizedDescription)
}
```

### Decoded Responses

Most APIs have a corresponding `.decoded` variant that returns a typed Swift struct instead of `Data`:

```swift
let act = try await battleNetAPI.d3.decoded.getAct(1)       // returns Act
let spell = try await battleNetAPI.wow.decoded.getSpell(id: 196607)  // returns Spell
```

Because Blizzard does not publish complete response schemas, the decoded structs were constructed from sample responses and **accuracy cannot be guaranteed**. If you encounter a JSON parsing error, fall back to the raw `Data` version and file an issue or pull request.

See [APIStatus.md](APIStatus.md) for a full list of endpoints that have decoded model support.

### Error Handling

Errors are typically thrown as `HTTPError`, an enum defined in the framework. Wrap your calls in a `do/catch` block:

```swift
do {
    let data = try await battleNetAPI.wow.getSpell(id: 196607)
    // use data
} catch let error as HTTPError {
    switch error {
    case .unexpectedResponse(let code): print("HTTP \(code)")
    default: print(error.localizedDescription)
    }
} catch {
    print(error.localizedDescription)
}
```

---

## Access Tokens

Calling APIs requires one of two tokens:

- **Client Access Token** — used for Game Data APIs. Retrieved automatically using your `clientID` and `clientSecret`.
- **User Access Token** — used for Profile APIs. Requires the player to sign in and authorize your app.

The `BattleNetAPI` client manages both tokens automatically once they are first retrieved, but it does not persist them between launches. You should save them yourself using the delegate:

```swift
let credentials = BattleNetCredentials(
    clientID: "CLIENT_ID",
    clientSecret: "CLIENT_SECRET",
    clientAccessToken: UserDefaults.standard.string(forKey: "clientAccessToken"),
    userAccessToken: UserDefaults.standard.string(forKey: "userAccessToken")
)
let battleNetAPI = BattleNetAPI(credentials: credentials, oauth: oauth)
battleNetAPI.delegate = MyDelegate()

class MyDelegate: BattleNetAuthDelegate {
    func battleNetAPI(_ api: BattleNetAPI, didChangeClientAccessToken token: String?) {
        UserDefaults.standard.set(token, forKey: "clientAccessToken")
    }
    func battleNetAPI(_ api: BattleNetAPI, didChangeUserAccessToken token: String?) {
        UserDefaults.standard.set(token, forKey: "userAccessToken")
    }
}
```

Tokens are validated when the `BattleNetAPI` instance is created. If a token is invalid or expired, the delegate will be called with `nil` so you can clear your stored value.

---

## Notes

### JSON Key Encoding

The Blizzard API returns responses that use a mix of camelCase and snake_case JSON keys. For this reason, the model objects use a combination of explicit `CodingKeys` and `JSONDecoder().keyDecodingStrategy`. Any model that appears in a service that mixes both styles includes a comment noting this.

### Framework Structure

Under `Sources/BattleNetAPI/`:

- **Network** — The `WebService` protocol that performs the underlying URL calls, authentication protocols, enums for regions/locales/namespaces, and the main `BattleNetAPI` class.
- **WebServices** — API functions organized by game and auth. The `+Decoded` extensions contain the typed variants.
- **Model/Auth** — `BattleNetCredentials` and `BattleNetOAuth`, needed to initialize the client.
- **Model/Object** — Swift structs mapped to API response objects, organized by game.
- **Utilities** — Shared helper methods used by the Network group.
