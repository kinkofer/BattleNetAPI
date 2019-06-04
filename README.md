#  Swift BattleNetAPI

All of the BattleNet API in Swift (as of 2019-04-17). Requires a free Blizzard Developer account. Includes web services that require user authentication through OAuth. Supports all regions and locales for World of Warcraft, Diablo 3, and Starcraft 2. Requires no third party frameworks, all Swift native.

## Getting Started

To run the app to see all the web service calls, you will first need your own clientID and clientSecret provided by Blizzard. You can register for a Blizzard developer account at `http://develop.battle.net`. Create a new client and provide a redirect URI (this app is configured to use `https://oauth.click/BattleNetAPI/`).

Add the clientID and clientSecret in AuthToken.swift. Launching the app will then allow you to run game data services that only require a clientAccessToken (retrieved from a service using the clientID and clientSecret). The remaining profile and community services require authenticating directly with Blizzard, meaning you will also need a battle.net username and password.

While running the app, a Sign In alert will show when trying to access profile and community services the first time. Following the prompt will open Safari to the Blizzard sign in page. After authenticating with Blizzard and authorizing the app, you'll be able to access the remaining services.

More details about the OAuth process can be found in the Authenication Manger section below.

## Running the tests

By adding your clientID, clientSecret, clientAccessToken, and userAccessToken in AuthToken.swift, you can then run all the test functions. The tests are set up to call a web service and attempt to decode the result to the appropriate class.

To acquire the clientAccessToken and userAccessToken, following the instructions above will print them to the console.

## Integration

If you would like to use BattleNetAPI in your project, there are a number of components you can take directly, or only take some and roll your own for the rest:

* **Network Group**: This contains the Network class to make web service calls, all the web service functions divided by game as well as for authentication and user data, and finally the interface BattleNetAPI class you would use to access the calls.
* **Model Group**: Everything can be used together, or some pieces can work separately.
	* **Auth Subgroup**: AuthToken.swift is used to store your tokens (keep these secret). The AuthenticationManager helps fetch your clientAccessToken and the userAccessToken; it requires the AuthenticationModelController and a few Network Objects.
	* **ModelControllers Subgroup**: These singletons call the BattleNetAPI functions and map their responses to the corresponding classes found in the Object subgroup.
	* **Object Subgroup**: This contains the classes that map to their web service responses. They are divided by game, as well as for authentication and user data.
		* Note that the classes may not be 100% accurate as Blizzard does not provide complete documentation for all possible values a web service might return. The classes were constructed based off a few test responses.
	* **World.swift**: Mainly used as a convenience to choose the current region and locale. The ModelControllers use the `Current` variable as default values. You can change these values yourself, or let the user change it in the app for their region and locale.
* **Utilities Group**: Various utility methods. Some of these are required for files in the Network group, but were not grouped there for organizational reasons.
* Finally, the **View** and **ViewController** groups show the API in action. You don't need these for your app, but they contain examples for how to use the ModelControllers. It also acts as an explorer for the objects returned from the web services.

### Authentication Manager

The Authentication Manager is a singleton responsible for managing the tokens needed to call the web services. The Network class will keep a copy of the clientAccessToken and userAccessToken once they are initially retrieved, but it doesn't store them persistently. You should store them securely yourself, like in the keychain. Then when the app launches again you can load them into the Network class via the `validateClientAccessToken()` and `validateUserAccessToken()` functions. They will return an error if the token has expired, then you must retrieve a new token again.

In order to support the OAuth Profile web services, your app must be able to access the `code` value sent back in the url after a user signs into Battle.Net. For more details on the process, please see the Blizzard API docs. This app supports this process by using `ASWebAuthenticationSession` and routing the `code` through a third party website, `https://oauth.click/`. By configuring your app's info.plist to include a URLType (`CFBundleURLTypes`) and URLSchemes (`CFBundleURLSchemes`), your app can be opened from a url in Safari. 

`https://oauth.click/{URLScheme}` is a website that automatically redirects to `{URLScheme}://`. As a third-party site, you should use with caution and prefer creating your own solution for redirecting back to your app.

## Notes

The Blizzard API contains services with json keys using both camel case and snake case. For this reason, the Objects use a mix of CodingKeys and `JSONDecoder().keyDecodingStrategy`. A comment was added to Objects that might appear in a service containing a mix of both.

## License

This project is licensed under the MIT License - see the LICENSE file for details.


*Not affiliated with Blizzard.*
