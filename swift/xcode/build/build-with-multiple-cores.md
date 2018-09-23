## Build with multiple cores

Write cores num,

```
$ defaults write com.apple.dt.Xcode IDEBuildOperationMaxNumberOfConcurrentCompileTasks 2
```

If you want to see total number of cores on your mac,

```
$ system_profiler SPHardwareDataType
```

Then,

> Total Number of Cores: 4

[Xcode8でコンパイルが遅いのを解消する](https://qiita.com/noppefoxwolf/items/73cef2485426e42693bf)
