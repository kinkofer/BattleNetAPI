//
//  AuthenticationUITests.swift
//  BattleNetAPI-ViewerUITests
//
//  Created by Claude on 3/10/26.
//

import XCTest


/// UI tests for authentication flows in the BattleNetAPI-Viewer app.
///
/// These tests launch the app and exercise the OAuth authentication flow.
/// The client access token is fetched automatically when any Game Data API is called.
/// The user access token requires manually completing the BattleNet sign-in in the web view.
///
/// **Launch arguments:**
/// - `--resetUserAuth`: Clears the persisted user access token before the app launches,
///   ensuring the test starts from a signed-out state.
final class AuthenticationUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
    }

    override func tearDownWithError() throws {
        app = nil
    }


    // MARK: - User Access Token (Sign In)

    /// Launches the user authentication flow via the profile button.
    ///
    /// Uses the `--resetUserAuth` launch argument to ensure the app starts signed out,
    /// regardless of any previously persisted token.
    ///
    /// **This test requires manual interaction:**
    /// 1. Run this test.
    /// 2. Tap "Sign in" on the confirmation alert.
    /// 3. Enter your BattleNet credentials in the web authentication session browser.
    /// 4. After successful sign-in, tap the profile button again to confirm signed-in status.
    func testAuthenticateUser() throws {
        app.launchArguments = ["--resetUserAuth"]
        app.launch()

        let profileButton = app.buttons["profileButton"]
        XCTAssertTrue(profileButton.waitForExistence(timeout: 10), "Profile button should exist")

        // Tap the profile button to trigger the auth confirmation alert
        profileButton.tap()

        // Tap "Sign in" on the confirmation alert
        let signInButton = app.buttons["Sign in"]
        XCTAssertTrue(signInButton.waitForExistence(timeout: 5), "Sign in alert button should appear")
        signInButton.tap()

        // --- Manual step: Complete BattleNet sign-in in the web authentication session ---
        // The ASWebAuthenticationSession will present a browser.
        // You must manually enter your credentials and authorize the app.
        // Using a long timeout to allow for manual sign-in.

        // Wait for the sign-in flow to complete and the app to return.
        // After the web auth session dismisses, the "Sign in successful" alert appears.
        let successAlert = app.staticTexts["Sign in successful"]
        XCTAssertTrue(successAlert.waitForExistence(timeout: 120),
                      "Should show 'Sign in successful' after authentication.")

        // Dismiss the success alert
        let okButton = app.buttons["OK"]
        if okButton.waitForExistence(timeout: 5) {
            okButton.tap()
        }

        // Verify signed-in state by tapping profile button again
        profileButton.tap()
        let signedInAlert = app.staticTexts["Currently signed in"]
        XCTAssertTrue(signedInAlert.waitForExistence(timeout: 5),
                      "Profile button should now show 'Currently signed in'.")
    }


    // MARK: - Already Signed In

    /// Verifies the already-signed-in state and the sign-out flow.
    ///
    /// This test launches *without* `--resetUserAuth`, so if you have previously
    /// signed in (e.g., by running `testAuthenticateUser()`), the app will start
    /// with a persisted user access token.
    ///
    /// **Steps:**
    /// 1. Tap the profile button — expects "Currently signed in" alert.
    /// 2. Tap "Sign out" to clear the user access token.
    /// 3. Dismiss the "Signed out" confirmation.
    /// 4. Tap the profile button again — expects the "Sign In?" prompt.
    func testAlreadySignedIn() throws {
        app.launch()

        let profileButton = app.buttons["profileButton"]
        XCTAssertTrue(profileButton.waitForExistence(timeout: 10), "Profile button should exist")

        // Tap the profile button — should show "Currently signed in" alert
        profileButton.tap()

        let signedInText = app.staticTexts["Currently signed in"]
        XCTAssertTrue(signedInText.waitForExistence(timeout: 5),
                      "Should show 'Currently signed in' when a user access token is persisted. Run testAuthenticateUser() first if this fails.")

        // Tap "Sign out" to clear the token
        let signOutButton = app.buttons["Sign out"]
        XCTAssertTrue(signOutButton.waitForExistence(timeout: 5), "Sign out button should appear")
        signOutButton.tap()

        // Expect "Signed out" confirmation alert
        let signedOutText = app.staticTexts["Signed out"]
        XCTAssertTrue(signedOutText.waitForExistence(timeout: 5),
                      "Should show 'Signed out' after clearing the user access token.")

        // Dismiss the confirmation
        let okButton = app.buttons["OK"]
        if okButton.waitForExistence(timeout: 5) {
            okButton.tap()
        }

        // Tap the profile button again — should now offer sign-in
        profileButton.tap()

        let signInPrompt = app.staticTexts["Sign In?"]
        XCTAssertTrue(signInPrompt.waitForExistence(timeout: 5),
                      "After signing out, profile button should show 'Sign In?' prompt.")

        // Dismiss the sign-in prompt
        let cancelButton = app.buttons["Cancel"]
        if cancelButton.waitForExistence(timeout: 5) {
            cancelButton.tap()
        }
    }
}
