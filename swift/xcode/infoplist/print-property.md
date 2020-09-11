## Print property

In Info.plist,

```xml
<key>CFBundleVersion</key>
<string>1</string>
```

Then

```sh
/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "./Info.plist"
```

[How can I use PlistBuddy to access an element of PreferencesSpecified by its property?](https://stackoverflow.com/questions/13970218/how-can-i-use-plistbuddy-to-access-an-element-of-preferencesspecified-by-its-pro)
[Reedyuk/set-xcode-plist-value/set-xcode-plist-value/step.sh](https://github.com/Reedyuk/set-xcode-plist-value/blob/master/step.sh#L53)
