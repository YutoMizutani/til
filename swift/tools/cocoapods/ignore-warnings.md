## Ignore warnings in pods

```
platform :ios

# ignore all warnings from all pods
inhibit_all_warnings!

# ignore warnings from a specific pod
pod 'FBSDKCoreKit', :inhibit_warnings => true
```

[Ignore Xcode warnings when using Cocoapods](https://stackoverflow.com/questions/13208202/ignore-xcode-warnings-when-using-cocoapods)
