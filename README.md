#  Swift BattleNetAPI

All of the BattleNet API in Swift (as of 2018-05-04). Requires a free Blizzard Developer account. Includes web services that require user authentication through OAuth. Supports all regions and locales for World of Warcraft, Diablo 3, and Starcraft 2. Requires no third party frameworks, all Swift native.

## Getting Started

To run the app to see all the web service calls, you will first need your own clientID and clientSecret provided by Blizzard. You can register for a Blizzard developer account at http://dev.battle.net.

Add the clientID and clientSecret in AuthenticationManager.swift. Launching the app will automatically run services that only require the clientID (considered legacy services), and those that require a clientAccessToken (retrieved from a service using the clientID and clientSecret).
The remaining services require authenticating directly with Blizzard, meaning you will also need a battle.net username and password. A Sign In button has been added to the default ViewController that will open Safari to the Blizzard sign in page. After authenticating with Blizzard, a unique code is redirected through a third-party web site which will in turn open the app and parse the unique code. The unique code is then used to fetch the userAccessToken needed to call the remaining OAuth services.

## Running the tests

By adding your clientID, clientSecret, clientAccessToken, and userAccessToken in BattleNetAPITests.swift, you can then run all the test functions. The tests are set up to run a web service and attempt to decode the result to the appropraite class.

## Integration

If you would like to use BattleNetAPI in your project, there are a number of components you can take directly, or only take some and roll your own for the rest:

* The WebService group contains the Network class to make web service calls, all the web service functions divided by game as well as for authentication and user data, and finally the interface BattleNetAPI class you would use to access the calls.
* The classes that map to their web service responses are located in the Object group. They are divided by game, as well as for authentication and user data.
* Note that the classes may not be 100% accurate as Blizzard does not provide complete documentation for all possible values a web service might return. 
* The functions that map the web service responses to their corresponding classes are in the ModelControllers group.
* Various utility methods are provided in the Utilities group
* Finally, the ViewController shows examples of using the API and prints out some data from the decoded object.

### Authentication Manager

The Authentication Manager is a singleton responsible for managing the tokens needed to call the web services. The Network class will keep a copy of the clientAccessToken and userAccessToken once they are initially retrieved, but it doesn't store them persistently. You should store them yourself, like in the keychain. Then when the app launches again you can load them into the Network class via the `validateClientAccessToken()` and `validateUserAccessToken()` functions. They will return an error if the token has expired, then you must retrieve a new token again.

In order to support the OAuth Profile web services, your app must be able to access the code sent back in the url after a user logs in. For more details on the process, please see the Blizzard API docs. This app supports this process by routing the code through a third party website, https://oauth.click/. By configuring your app's info.plist to include a URLType (CFBundleURLTypes), your app can be opened from a url in Safari. The AppDelegate can parse the url that opened the app in `application(_:open:options:)`.

## Notes

The choice was made to explicitly state the json snake case keys instead of relying on the `JSONDecoder().keyDecodingStrategy` because some objects combined camel case and snake case.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
