#  MeLi Challenge

### This project aims to create an app based on the Mercado Pago API, this API provides endpoints for:

- Payment Methods
- Card Bank Issuers
- Payment Quotes

### Project minimum requirements:

- Xcode 9.4.1 +
- MacOS Sierra 10.13.6 +
- iOS 11 +

### Project Dependencies:

This project runs using 3rd party code libraries managed by Cocoapods, to install
it you must:

- sudo gem install Cocoapods

in the root folder of the project:

- pod install

Installed Pods:

- PureLayout, library to manage AutoLayout via code in a simpler and easier to maintain way
- SDWebImage, async image downloader manager for UIImageViews
- IQKeyboardManager, a handy solution for keyboard on textfields

### Project Structure:

+ XCWorkspace
+ MercadoPago XCProject
+ MercadoPago
+ Views
+ ViewControllers
+ Utils
+ Models
- Assets.xcassets
- LaunchScreen.Storyboard
- Info.plist

+ Pods XCProject
...

### Structures / Architectures / Coding Style

- API calls functions are located on Service Class files, this file contains
all the calls to services with completion blocks for async handling of services responses.

The JSON parsing is managed using vanilla Objective-C  that allows such functionality
without 3rd party libraries

- Most of the ViewControllers follows this coding pattern:
- Local variables and objects (Such as UIKit elements) declaration
- CreateView method for local variables and Objects
- SetupConstraints method, handles the AutoLayout constraints for local elements 
- Most of the UI is done via code by composing UITableViewControllers with Custom Headers with separate files


