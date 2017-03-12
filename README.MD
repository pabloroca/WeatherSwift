
## Main specs:

* Developed in SWIFT 3.0
* iOS 9.0 compatible
* CocoaPods
* using ligth MVC architecture
* Network requests in the background
* Image downloading in the background
* Unit tests
* plist with NSAppTransportSecurity
* plist with UIRequiresPersistentWiFi (like Apple's mail app)
* AutoLayout
* waiting indicators in status bar
* cache by 5 mins internally, cause OpenWeatherMap has no cache system. (not finished)
* using SwiftLint to enforce Swift style and conventions
* Using as few external libraries as possible:

* Alamofire
* AlamofireImage
* RealmSwift
* SwiftLint
* SwiftyJSON
* SwiftDate
* OHHTTPStubs

## Running Unit tests

* From Menu select View -> Navigators -> Show Test Navigator or Apple key + 5
* From Menu select Product -> Test or Apple Key + U

## Storyboards

Even storyboards are a problem in team development (because git conflicts), they have some specs not available to NIBs (like size classes)

## SOLID principles

Trying to apply SOLID principles and Clean Code, specially the Single Responsability. Classes must be lightewigth and perform only one task inside his abstraction layer. So it's better to have more classes that one big bloated class

## SwiftLint
https://github.com/realm/SwiftLint

A tool for enforcing good code style.

The run script if deactivated, just in case you don't have it installed. To reenable, uncomment lines in Run Script Phase we have in the ChatBot target

## jazzy (Doc generation)
https://github.com/realm/jazzy

    jazzy \
      --clean \
      --author PabloRoca \
      --author_url https://pr2studio.com \
      --module-version 1.00 \
      --xcodebuild-arguments -scheme,WeatherSwiftDoc \
      --module WeatherSwift \
      --output docs/swift_output \
      --min-acl internal


## Database

Using RealmSwift, I have created this tables:

* Cities
* ForeCast

## TODO (out of time), What I would add

* Enable a searchbar for cities and using Google Maps search
* complete HeaderDoc documentation.
* VIPER architecture
* OHHTTPStubs tests
* Cache network requests for 5 minutes

## To enhance

* more use of protocols
