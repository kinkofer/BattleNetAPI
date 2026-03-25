# Contributing

Contributions are welcome! Whether it's filling in missing decoded models, adding unit tests, fixing a parsing bug, or improving documentation, pull requests are appreciated.

## Getting Started

1. Fork the repository and clone your fork.
2. Open `Package.swift` in Xcode or use `swift build` from the command line.
3. Create a new branch for your changes: `git checkout -b feature/my-improvement`

## Areas That Would Benefit Most

Looking at the [API Status table](APIStatus.md), the highest-value contributions would be:

- **Decoded models for WoW Classic** — The Classic endpoints all return raw `Data` but have no model structs yet.
- **Decoded models for partial WoW Retail endpoints** — Many game data endpoints (Covenant, Creature, Journal, etc.) have `Data` requests but no structs.
- **Unit tests for existing decoded endpoints** — Several WoW Profile endpoints have model support but no live test coverage.
- **SC2 Legacy / CN model support** — The Legacy and China-region SC2 endpoints have `Data` requests but no decoded structs.

## Adding a Decoded Model

1. Add a Swift struct to the appropriate file in `Sources/BattleNetAPI/Model/Object/`.
2. Make it conform to `Decodable` (and `Codable` if needed).
3. Add the decoded function to the corresponding `+Decoded.swift` file in `WebServices/`.
4. Add a unit test in `Tests/BattleNetAPITests/`.

> **Note on accuracy:** Blizzard does not publish complete response schemas. If you build a struct from a sample response, please add a comment noting this so others know to treat it as best-effort.

## Adding a Unit Test

Tests call the live Blizzard API, so you'll need valid tokens. Add your `clientID`, `clientSecret`, `clientAccessToken`, and `userAccessToken` to `BattleNetAPITests.swift` before running tests.

Each test calls the `.decoded` accessor directly. Because the test function is `async throws`, any failure — whether a network error or a decoding error — automatically fails the test and XCTest reports the full error with the key path and context.

```swift
func testGetMyNewEndpoint() async throws {
    _ = try await battleNetAPI.wow.decoded.getMyNewEndpoint(id: 1)
}
```

The `_ =` discard is intentional; the test passes as long as the call doesn't throw. If you want to make an additional assertion about the returned value, you can capture it:

```swift
func testGetMyNewEndpoint() async throws {
    let result = try await battleNetAPI.wow.decoded.getMyNewEndpoint(id: 1)
    XCTAssertFalse(result.items.isEmpty)
}
```

## Pull Request Guidelines

- Keep pull requests focused — one feature or fix per PR is easier to review.
- If you're adding a new model struct, include at least one unit test.
- Describe what your PR changes and why in the description.
- The project uses no third-party dependencies; please keep it that way.

## Reporting Issues

If you find an API endpoint returning unexpected data, or a decoded struct that doesn't match a real response, please open an issue with the endpoint name and (if possible) a sanitized example of the response JSON.
