# SwiftUI Api Of Ice And Fire

[![Build Status](https://app.bitrise.io/app/a24bf888-d2e9-489f-ae97-39e0d9ade530/status.svg?token=8ahHJ_zAnLed4AVGOu7r7w&branch=main)](https://app.bitrise.io/app/a24bf888-d2e9-489f-ae97-39e0d9ade530) ![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg) [![Ask Me Anything !](https://img.shields.io/badge/Ask%20me-anything-1abc9c.svg)](https://twitter.com/matthias_code) [![License: CC BY-SA 3.0](https://img.shields.io/badge/License-CC%20BY--SA%203.0-red.svg)](https://creativecommons.org/licenses/by-sa/3.0/) [![Twitter Follow](https://img.shields.io/twitter/follow/matthias_code?style=social)](https://twitter.com/matthias_code) [![Mastodon Follow](https://img.shields.io/mastodon/follow/112079288247188162?domain=https%3A%2F%2Fmastodon.social&style=social)](https://mastodon.cloud/@matthias_code) [![Youtube Subscribe](https://img.shields.io/youtube/channel/subscribers/UCvMdsKesM05bIG0eq7M5z1g?style=social)](https://www.youtube.com/channel/UCvMdsKesM05bIG0eq7M5z1g?sub_confirmation=1)

A SwiftUI-App that lists the houses in A Song of Ice and Fire, taken from the [API of Ice And Fire](https://anapioficeandfire.com/). Also created separately [in Flutter for iOS and Android](https://github.com/matthiaszarzecki/FlutterApiOfIceAndFire/).

| _ | _ | _ |
:-------------------------:|:-------------------------:|:-------------------------:
<img src="media/screenshot_12.png">|<img src="media/screenshot_13.png">|<img src="media/screenshot_14.png">
<img src="media/screenshot_15.png">|<img src="media/screenshot_16.png">|

### Contains
- SwiftUI
- Combine-Subscriptions
- Native API Calls with generic types 
- Pagination
- Nested API-Calls
- Widgets
- Graceful Failure - elements that do not exist (yet) are not shown instead of showing empty elements or errors
- MVVM Architecture
- Detailed House-View
- Detailed Character-View
- List of all Houses
- Elegant in-view error-handling on SingleHouse and Character Views (no popups!)
- Continuous Integration with BitRise
- Unit-Tests
- Detailed comments
- Custom color-parser to create icons per house from text-only description of the Coat of Arms
- Small Screen Support
- Extensive SwiftUI Previews
- Skeleton Loading Views
- Major Houses Display
- Downloader-Protocol for unit-test mocking
- SwiftLint
- Custom SwiftLint rules
- URLComponents
- SwiftUI Animations

### TODO
- Improved Accessibility Features
- Integrate to my SonarQube
- Nicer Widgets
- Open House-page on tap on widget
- Timeout on Main Screen
- Tap tabbar icons to reset views
- More Unit-Tests
- More Unit-Tests for ViewModels
- Better error-handling in combine-call
- More ViewModels in smaller views
- Add timeout error case, move timeout to api calls

### Nice to Have
- SwiftFormat
- Fastlane function to create screenshots for this readme
- CodeCov integration in CICD
- Unit-Testing Views with ViewInspector Plugin
- Monkey-Tests
- Fetch nested data for Characters
- UI-Tests
- Dark Color Scheme & scheme switching
- Automated tests for error-handling
- Replace generic native calls with combine-subscriptions
- Data Caching (Realm or CoreData)
- Welcome Tab with House of the Day View
- Async Await Calls
- Apple Watch integration

### See Also
- [Flutter Api of Ice and Fire](https://github.com/matthiaszarzecki/FlutterApiOfIceAndFire)

### Attribution
- Images for Great Houses taken from the Wiki of Ice and Fire using CC-BY-SA 3.0 License
- Dragon Icon created by Ramy Wafaa

Created by Matthias Zarzecki, 2021-01
