## Count Rx objects

#### Usages

```swift
print(RxSwift.Resources.total)
```

```swift
#if TRACE_RESOURCES
let timer = Timer.init(timeInterval: 3.0, target: BlockOperation.init(block: {
    print("### Resource count \(RxSwift.Resources.total)")
}), selector: #selector(Operation.main), userInfo: nil, repeats: true)
RunLoop.main.add(timer, forMode: RunLoopMode.commonModes)
#endif
```

#### Setup

1. Update config

- Use Pods

Add below into *Podfile*

```sh
post_install do |installer|
   installer.pods_project.targets.each do |target|
      if target.name == 'RxSwift'
         target.build_configurations.each do |config|
            if config.name == 'Debug'
               config.build_settings['OTHER_SWIFT_FLAGS'] ||= ['-D', 'TRACE_RESOURCES']
            end
         end
      end
   end
end
```

- Use carthage

```sh
$ carthage update --no-use-binaries --configuration Debug RxSwift
```

1. Update flag

Change Xcode,

```sh
--- OTHER_SWIFT_FLAGS = "$(inherited)";
+++ OTHER_SWIFT_FLAGS = "$(inherited) \"-D\" \"TRACE_RESOURCES\"";
```

![](https://cloud.githubusercontent.com/assets/1337867/15808602/c14a4d30-2b40-11e6-9366-746e141dd561.png)

#### References

[RxSwift.resourceCount not accessable #378](https://github.com/ReactiveX/RxSwift/issues/378)
[RxSwift: UITableViewCellのreuse対策](https://qiita.com/ShingoFukuyama/items/20035171f9ec78efded7)
[RxSwiftでオブジェクト数を確認する](https://fukatsu.tech/debug-rxswift)
