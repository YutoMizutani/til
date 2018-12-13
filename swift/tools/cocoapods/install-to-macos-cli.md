## Install to macOS CLI

Write it into your `Podfile`,

```
# Uncomment the next line to define a global platform for your project
 platform :macos, '10.10'

 target 'Demo' do
   # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
   # use_frameworks!

   pod 'JSONtoCodable'

 end

 post_install do |installer|
   installer.pods_project.targets.each do |target|
     if target.name =~ /-macOS$/
       target.build_configurations.each do |config|
         config.build_settings['DYLIB_INSTALL_NAME_BASE'] = target.product_name
         config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'YES'
       end
     end
   end
 end
```

[Command Line Tool + CocoaPods frameworks breaks #3707](https://github.com/CocoaPods/CocoaPods/issues/3707)
[✨ Install pod #8](https://github.com/YutoMizutani/JSONtoCodable/commit/6881897df4a1dc4af1f9d37ff34960b1bf21d36e)
