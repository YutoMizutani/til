## Scheduler in RxSwift

#### The process running on main thread

```swift
let mainScheduler = MainScheduler.instance
```

Usage,

```swift
observer.asObservable()
    .scheduler(MainScheduler.instance)
    .subscribe()
    .disposed(by: disposeBag)
```

#### The process running on background thread

```swift
let backgroundScheduler = SerialDispatchQueueScheduler(globalConcurrentQueueQOS: .Default)
```

[RxSwiftで実行するSchedulerの作り方とお行儀良く扱うためのメモ](http://blog.sgr-ksmt.org/2016/03/15/rxswift_scheduler/)
