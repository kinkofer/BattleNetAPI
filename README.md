#  Swift BattleNetAPI

[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
![Swift Package Manager compatible](https://img.shields.io/badge/Platform-iOS%20|%20MacOS-lightgray.svg)

All of the BattleNet API in Swift (as of 2020-02-14). Requires a free [Blizzard Developer](http://develop.battle.net) account. Includes web services that require user authentication through OAuth. Supports all regions and locales for World of Warcraft (Retail and Classic), Diablo 3, and Starcraft 2. Requires no additional third party frameworks, all Swift native.


## Usage

Initialize a BattleNetAPI client with the credentials you receive from your Blizzard Developer account.

```swift
let credentials = BattleNetCredentials(clientID: "CLIENT_ID", clientSecret: "CLIENT_SECRET")
let battleNetAPI = BattleNetAPI(credentials: credentials)
```

Each game's API is separated into its own property on the client.
Certain functions, known as Game Data APIs, only require your developer credentials, which you'll already have provided when intializing the API client.

```swift
battleNetAPI.d3.getEras() { result in ... }
battleNetAPI.sc2.getLeagueData(seasonID: 37, queue: .lotV1v1, team: .arranged, league: .grandmaster) { result in ... }
battleNetAPI.wow.getPlayableClassIndex() { result in ... }
```

Others functions, known as Community or Profile APIs, require a player to first authorize your app by signing into their BattleNet account. The AuthenticationManager class is intended to help with this process (see below for more details).

``` swift
let oauth = BattleNetOAuth(scope: [.d3, .sc2, .wow, .openID], scheme: "BattleNetAPI", redirectUrl: "https://redirect.to/BattleNetAPI")
let authManager = AuthenticationManager(battleNetAPI: battleNetAPI, oauth: oauth, providerContext: AuthenicationViewModel())
authManager.getUserAccessToken { result in ... }
```

Using the AuthenticationManager, if the player authorizes your app, you can then use the same client to call Community and Profile APIs.

```swift
battleNetAPI.d3.getProfile(battleTag: "BATTLE_TAG") { result in ... }
battleNetAPI.sc2.getProfileData(sc2Region: .us) { result in ... }
battleNetAPI.wow.getPetsCollectionSummary() { result in ... }
```


## Getting Started

Add the BattleNetAPI framework to your app through Swift Packages.

To start making API calls, or to run the example apps to see the API in action, you will first need your own clientID and clientSecret provided by Blizzard. You can register for a Blizzard developer account at [develop.battle.net](http://develop.battle.net), then create a new client to get the clientID and clientSecret.

If you plan to call Community or Profile APIs, you'll need to support the user OAuth process. This requires a redirect url where the authorization code will be sent. iOS and Mac apps can be opened by a url with a custom url scheme, but unfortunately Blizzard does not allow url schemes other than http/https. A possible solution is discussed in the Authenication Manager section below.

Initialize a BattleNetAPI client to begin calling APIs. The client can be configured with a custom URLSession, and different regions and locales for localization.

```swift
let battleNetAPI = BattleNetAPI(credentials: credentials, session: .shared, region: .us, locale: .en_US)
```

## Handling Results

Each API function includes a `completion` parameter that contains the result of the web service call. The type of this parameter is `Result<Data, Error>` where the error will typically be of type `HTTPError`, an enum within the BattleNetAPI framework.

The Data is the encoded web service response. Blizzard sends their responses as JSON, so the Data can be JSON serialized.

```swift
switch result {
case .success(let data):
    do {
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
    }
    catch {
        print(error.localizedDescription)
    }
case .failure(let error):
    print(error.localizedDescription)
}
```

The Data could also be decoded into a custom struct or class.

The framework attempts to provide classes for each response, but Blizzard has not released documentation for any objects, and therefore accuracy cannot be guaranteed.

If you want to skip the Data conversion, the framework provides Repository classes which automatically map the results to an object.

```swift
let diablo3Repo = Diablo3Repository(battleNetAPI: battleNetAPI)
diablo3Repo.getActs() { result in // result is type Result<[Act], Error>
	switch result {
    case .success(let acts):
        print(acts.count)
    case .failure(let error):
        print(error.localizedDescription)
    }
}
```

Again, the accuracy of the objects cannot be guaranteed, so if there is a JSON parsing error, it's recommended you fall back on the functions that return Data instead. The Repositories are a work in progress.


## Access Tokens

Calling each API requires either a clientAccessToken (for Game Data APIs) or a userAccessToken (for Community and Profile APIs). The BattleNetAPI client will manage the clientAccessToken automatically, and using the AuthenticationManager will manage the userAccessToken, but it's recommended you retrieve and store these tokens to reinitialize the client each time the app launches.

```swift
// Initialize AuthenticationManager
let authManager = AuthenticationManager(...)

// This can be called as early as app launch
authManager.getClientAccessToken { result in 
	if let clientAccessToken = try? result.get() {
		UserDefaults.standard.set(clientAccessToken, forKey: "clientAccessToken")
	}
}

// This requires the user to sign into their BattleNet account
authManager.getUserAccessToken { result in
	if let userAccessToken = try? result.get() {
		UserDefaults.standard.set(userAccessToken, forKey: "userAccessToken")
	}
}
```

Once you've saved the tokens, you can include them in the BattleNetCredentials when you initialize the BattleNetAPI client.

```swift
var credentials = BattleNetCredentials(clientID: "CLIENT_ID",
									clientSecret: "CLIENT_SECRET",
									clientAccessToken: UserDefaults.standard.string(forKey: "clientAccessToken"),
									userAccessToken: UserDefaults.standard.string(forKey: "userAccessToken"))
```

The AuthenticationManager will validate the token each time you call `getClientAccessToken` and `getUserAccessToken` to check if it's expired, and acquire a new token if so.


## Running Tests

By adding your clientID and clientSecret, plus a valid clientAccessToken and userAccessToken in BattleNetAPITests.swift, you can then run all the test functions. The tests are set up to call a web service and attempt to decode the result to the appropriate class.

To acquire the clientAccessToken and userAccessToken, follow the instructions above and print them to the console from your app.

## Framework Structure

Here's a quick explanation of the framework structure under `Sources/BattleNetAPI/`

* **Network Group**: This contains the WebService protocol that performs the web service calls themselves; the AuthenticationWebService protocol that handles authentication and access tokens; other protocols and enums to help construct calls; and finally the BattleNetAPI class you should use to access the API calls.
* **WebServices Group**: Contains all the web service functions divided by game as well as for authentication and user data. Although these can be used directly, it's strongly recommended you use an instance of the BattleNetAPI class instead.
* **Model Group**: 
	* **Auth Subgroup**: Includes the BattleNetCredentials and BattleNetOAuth classes you'll need to initialize the API client. The AuthenticationManager helps fetch your clientAccessToken and the player's userAccessToken.
	* **Repositories Subgroup**: These structs call the BattleNetAPI functions and map their responses to the corresponding classes found in the Object subgroup.
	* **Object Subgroup**: This contains the classes that map to their web service responses. They are divided by game, as well as for authentication and user data.
		* Note that the classes may not be 100% accurate as Blizzard does not provide complete documentation for all possible values a web service might return. The classes were constructed based off a few test responses.
* **Utilities Group**: Various utility methods. Some of these are required for files in the Network group, but were not grouped there for organizational reasons.


## Client and User Authentication

The AuthenticationManager class is responsible for managing the tokens needed to call the web services. It edits the BattleNetAPI Credentials with the clientAccessToken and userAccessToken once they are initially retrieved, but it doesn't store them persistently. See the Access Tokens section above for more details about this process.

The AuthenticationManager is especially helpful with asking the player to sign into their BattleNet account and authorizing your app. However, this requires you to configure your app to be opened by a url, and to handle the OAuth redirect outside the app.

### BattleNetOAuth

We'll start by initializing BattleNetOAuth. Note, if your app will not access Profile or Community APIs, you can use empty values to initialize this.

`BattleNetOAuth(scope:scheme:redirectUrl:)`

The `scope` is the list of games you plan to retrieve player data from. When you request the player to permit your app, they will see which games you're requesting, and can choose to permit all, some, or none.

The `scheme` is the URLScheme value you indicate to allow your app to be opened by a url. First, add a URLScheme for your app by [editing your app's Info.plist](https://developer.apple.com/documentation/xcode/allowing_apps_and_websites_to_link_to_your_content/defining_a_custom_url_scheme_for_your_app).

The `redirectUrl` is a part of the OAuth process, where Blizzard will redirect the player after they sign into their account and give your app permission. Because Blizzard does not allow a redirect to your URLScheme, you would need to build a custom solution outside the app. More on this in a bit.

```swift
let oauth = BattleNetOAuth(scope: [.d3, .sc2, .wow, .openID], scheme: "BattleNetAPI", redirectUrl: "https://redirect.to/BattleNetAPI")
```

### Authentication Manager

Next we'll initialize the AuthenticationManager using the BattleNetOAuth from the previous step, a BattleNetAPI client we'll use to eventually call APIs, and a context that Apple needs to present the Blizzard sign in page to the user.

`AuthenticationManager(battleNetAPI:oauth:providerContext:)`

The first two parameters we've previously discussed. The `providerContext` is actually not so complicated. It's any class that's essentially telling Apple how to present the sign in to the user.

You can create a new class for this

```swift
class AuthenticationContext: NSObject, ASWebAuthenticationPresentationContextProviding {
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return ASPresentationAnchor()
    }
}
```

or have a UIViewController act as the context

```swift
extension SomeViewController: ASWebAuthenticationPresentationContextProviding {
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return ASPresentationAnchor()
    }
}
```

Be sure to import `AuthenticationServices`.

Now you're ready to initialize the AuthenticationManager.

```swift
let authManager = AuthenticationManager(battleNetAPI: battleNetAPI, oauth: oauth, providerContext: AuthenticationContext())
// Or use self for providerContext if you create the authManager in the UIViewController you extended
```

### User Authentication

You call `authManager.getUserAccessToken(completion:)` to begin the user authentication process. A web view will be presented with the BattleNet sign in, and the user will see which games you're asking them to permit your app access to.

After the user grants permission, Blizzard will call the redirectURL along with some query parameters. The AuthenticationManager class expects these query parameters also be included in the url that opens the app. As previously stated, the redirectURL cannot use your app's URLScheme (a limitation on the Blizzard developer site), so a custom solution will be required.

You could build an API to receive the redirect on a server, then could open your app from there. My personal solution uses a PHP framework, where the redirectURL includes my app's URLScheme, so I can configure a new url with the same query parameters to open my app:

```php
Route::get('redirect/{scheme}', function ($scheme, Request $request) {
    $url = $scheme . "://?" . http_build_query($request->query());
    return redirect()->away($url);
});
```

## Notes

The Blizzard API contains services with json keys using both camel case and snake case. For this reason, the Objects use a mix of CodingKeys and `JSONDecoder().keyDecodingStrategy`. A comment was added to Objects that might appear in a service containing a mix of both.


## License

This project is licensed under the MIT License - see the LICENSE file for details.


*Not affiliated with Blizzard.*
