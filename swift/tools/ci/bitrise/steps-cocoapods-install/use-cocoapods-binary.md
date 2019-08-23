## Use cocoapods-binary

CocoaPods allows any plugins ( https://guides.cocoapods.org/plugins/setting-up-plugins.html ) and gems are required to run them.
In this case, failed to run the plugin ( `cocoapods-binary` ) installed by `Gemfile.lock` and `cocoapods` was excuted on system environment.

where the versions specified with this line ( https://github.com/bitrise-steplib/steps-cocoapods-install/blob/1a276f4ffcf6efd1fcff11fdbcacb9c08993723f/main.go#L340 ), but not specified environment.

So current my solutions:
Added `Script` Step and written `gem install 'cocoapods-binary'` and install `cocoapods-binary` into global environment.

[pod install doesn't use cocoapods plugins #43](https://github.com/bitrise-steplib/steps-cocoapods-install/issues/43#issuecomment-514515135)
[Use bundler if Podfile.lock is missing or the version of Podfile.lock in version range from Gemfile.lock](https://github.com/bitrise-steplib/steps-cocoapods-install/pull/44)
