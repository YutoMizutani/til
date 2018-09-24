## HTTP Connection

*HTTP* connection usage.

> App Transport Security has blocked a cleartext HTTP (http://) resource load since it is insecure. Temporary exceptions can be configured via your app's Info.plist file.

Write it into your `Info.plist`.

![](https://raw.githubusercontent.com/YutoMizutani/CiNiiKit/media/infoplist.png)

```xml
<key>NSAppTransportSecurity</key>
<dict>
	<key>NSAllowsArbitraryLoads</key>
	<false/>
	<key>NSExceptionDomains</key>
	<dict>
		<key>ci.nii.ac.jp</key>
		<dict>
			<key>NSIncludesSubdomains</key>
			<true/>
			<key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
			<true/>
			<key>NSTemporaryExceptionRequiresForwardSecrecy</key>
			<false/>
		</dict>
	</dict>
</dict>
```

[「http://」のAPIを実行できるようにする(Swift)](https://qiita.com/uhooi/items/68939999c2c31e5f5557)
[CiNiiKit](https://github.com/YutoMizutani/CiNiiKit)
