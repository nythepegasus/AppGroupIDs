# AppGroupIDs
A way to access your App Group containers in a type safe way.

## Example
```swift
import Foundation

import AppGroupIDs

// Note: The IDs are specified without the "group." prefix
// AppGroupIDs prepends that for you!
enum NYGroups: String, AppGroupID {
    case ny = "ny.apps"
    case ss = "com.SideStore.SideStore"
}
// That's it! Now we can get their container URLs in a type safe way!
print(NYGroups.ny._container) // returns URL
// Either the App Group container or the app's main container if missing entitlements
print(NYGroups.ny.container) // returns URL?
// Either the App Group container or nil if missing entitlements
```
## Adding `AppGroupIDs` to your project
```swift
let package = Package(
    dependencies: [
    	// etc
        .package(url: "https://github.com/nythepegasus/AppGroupIDs", from: "1.0.0"),
        			// ^^^ Note: This is the same URL you will use in Xcode
    ],
    targets: [
        .target(name: "<tool>", dependencies: [
            // etc
            .product(name: "AppGroupIDs", package: "AppGroupIDs"),
        ]),
        // etc
    ]
)
```
### License
I provide all of my open source software free of charge to any individual who may want to use it under the MIT license.

If you are a business and want to use my software, please [send inquiries to my email](mailto://me@nythepegas.us)!<br>
You can find full details within the [LICENSE](https://github.com/nythepegasus/AppGroupIDs/blob/main/LICENSE) file.
