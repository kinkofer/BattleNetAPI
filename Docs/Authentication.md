# Authentication

## Overview

The BattleNet API uses OAuth 2.0. There are two levels of access:

- **Client Credentials** (Game Data APIs) — your `clientID` and `clientSecret` are sufficient. The framework handles the token exchange automatically.
- **User Authorization** (Profile APIs) — the player must sign into their BattleNet account and grant your app permission.

---

## Client Authentication

When you create a `BattleNetAPI` instance, it automatically uses your `clientID` and `clientSecret` to request a client access token. You don't need to do anything extra for Game Data APIs.

If you've stored a previously retrieved token, pass it in at initialization to skip the network round-trip:

```swift
let credentials = BattleNetCredentials(
    clientID: "CLIENT_ID",
    clientSecret: "CLIENT_SECRET",
    clientAccessToken: storedToken  // optional
)
let battleNetAPI = BattleNetAPI(credentials: credentials)
```

To be notified when the token changes (e.g., after it expires and is refreshed), assign a delegate:

```swift
battleNetAPI.delegate = MyDelegate()

class MyDelegate: BattleNetAuthDelegate {
    func battleNetAPI(_ api: BattleNetAPI, didChangeClientAccessToken token: String?) {
        // Save or clear the token
        UserDefaults.standard.set(token, forKey: "clientAccessToken")
    }
    func battleNetAPI(_ api: BattleNetAPI, didChangeUserAccessToken token: String?) {
        UserDefaults.standard.set(token, forKey: "userAccessToken")
    }
}
```

---

## User Authentication (OAuth)

Profile APIs require a user access token, which means the player must sign in and authorize your app. This is handled by `battleNetAPI.authenticationManager`.

### 1. Configure BattleNetOAuth

Before calling any Profile APIs, initialize `BattleNetOAuth` with your app's OAuth settings. If your app does not use Profile APIs, you can pass empty or placeholder values.

```swift
let oauth = BattleNetOAuth(
    scope: [.d3, .sc2, .wow, .openID],
    scheme: "YourAppScheme",
    redirectUrl: "https://your-server.com/oauth/redirect",
    providerContext: AuthenticationContext()
)
```

**Parameters:**

- `scope` — The games you want to request player access to. The player will see exactly which games you're requesting when they authorize your app.
- `scheme` — Your app's URL scheme (e.g. `"YourApp"`), registered in your app's Info.plist. Used to reopen the app after the OAuth redirect.
- `redirectUrl` — The URL Blizzard will redirect the player to after they sign in. **Blizzard does not allow a URL scheme as the redirect**, so this must be an `https` URL you control. See the redirect handling section below.
- `providerContext` — Any class that conforms to `ASWebAuthenticationPresentationContextProviding`. This tells the system how to present the sign-in view.

A minimal `providerContext` looks like this:

```swift
import AuthenticationServices

class AuthenticationContext: NSObject, ASWebAuthenticationPresentationContextProviding {
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return ASPresentationAnchor()
    }
}
```

Or you can make a `UIViewController` conform directly:

```swift
extension MyViewController: ASWebAuthenticationPresentationContextProviding {
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return view.window ?? ASPresentationAnchor()
    }
}
```

### 2. Request User Authorization

Call `getUserAccessToken()` to present the BattleNet sign-in flow. A web view will appear and the player will see which games your app is requesting access to.

```swift
try await battleNetAPI.authenticationManager.getUserAccessToken()
```

### 3. Handle the OAuth Redirect

After the player signs in, Blizzard redirects them to your `redirectUrl` with query parameters containing the authorization code. Your redirect handler must forward these parameters back to your app.

Since Blizzard does not allow a URL scheme redirect directly, you need a small server-side relay. One approach with PHP/Laravel:

```php
Route::get('redirect/{scheme}', function ($scheme, Request $request) {
    $url = $scheme . "://?" . http_build_query($request->query());
    return redirect()->away($url);
});
```

This receives Blizzard's redirect at your server, then opens your app using its URL scheme, passing along the same query parameters. Your app receives the URL, and the `AuthenticationManager` extracts the authorization code to complete the token exchange.

### 4. Call Profile APIs

Once the user access token is obtained, Profile API calls work the same as any other:

```swift
let profile = try await battleNetAPI.d3.getProfile(battleTag: "Username-1234")
let sc2Profile = try await battleNetAPI.sc2.getProfileData(sc2Region: .us)
let mounts = try await battleNetAPI.wow.getMountsCollectionSummary()
```
