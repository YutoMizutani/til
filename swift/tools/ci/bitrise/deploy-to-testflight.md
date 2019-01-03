## Deploy to testflight

```ruby
default_platform(:ios)

platform :ios do
  desc "Push a new beta build to TestFlight"
  lane :beta do
    build_app(workspace: "my-project.xcworkspace", scheme: "my-project")
    upload_to_testflight
  end
end
```

[fastlaneでTestFlightにアップロードするところまでをセットアップ](https://blog.piyo.tech/posts/2018-07-30-testflight-with-fastlane/)
