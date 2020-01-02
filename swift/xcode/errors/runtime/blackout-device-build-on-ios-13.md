## Blackout connected devices when build on iOS 13 and Xcode 11

Cannot call `func scene()` on `SceneDelegate.swift` and correctly work on simulators

Write it your `Info.plist`,

```yaml
	<key>UIApplicationSceneManifest</key>
	<dict>
		<key>UIApplicationSupportsMultipleScenes</key>
		<false/>
		<key>UISceneConfigurations</key>
		<dict>
			<key>UIWindowSceneSessionRoleApplication</key>
			<array>
				<dict>
					<key>UISceneConfigurationName</key>
					<string>Default Configuration</string>
					<key>UISceneDelegateClassName</key>
					<string>$(PRODUCT_MODULE_NAME).SceneDelegate</string>
				</dict>
			</array>
		</dict>
	</dict>
```

[iOS 13.1.3 update` - Got a black screen right after launch screen](https://stackoverflow.com/questions/58485328/ios-13-1-3-update-got-a-black-screen-right-after-launch-screen)
