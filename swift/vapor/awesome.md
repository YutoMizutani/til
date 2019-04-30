[vacastics/Sources/App/Controllers/UserController.swift shveiq/vacastics](https://github.com/shveiq/vacastics/blob/master/Sources/App/Controllers/UserController.swift)
[実案件でVaporを採用したときの知見まとめ](https://qiita.com/t-ae/items/71bfdb86395552ff7337#future)

```
$ swift run Run --hostname 0.0.0.0 --port 9090
```
```swift
let serverConfiure = NIOServerConfig.default(hostname: "0.0.0.0", port: 9090)
services.register(serverConfiure)
```
[Vapor のホストネームと起動ポートを変更する](https://qiita.com/takoikatakotako/items/73aa07aa8ba7160b3244)
