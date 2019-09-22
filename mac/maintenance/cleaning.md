## Cleaning

```sh
rm -rf ~/Library/Developer/Xcode/Archives/* \
    ; rm -rf ~/Library/Developer/Xcode/DerivedData/* \
    ; rm -rf ~/Library/Developer/Xcode/iOS\ DeviceSupport/* \
    ; rm -rf ~/Library/Logs/iOS\ Simulator/* \
    ; sleep 1s \
    && terminal-notifier -message 'Cleaning Storage: Complete all processes on Terminal!'
```

```sh
rm -rf ~/Library/Developer/Xcode/DerivedData/* ~/Library/Developer/Xcode/iOS\ DeviceSupport/* ~/Library/Logs/iOS\ Simulator/* && sleep 1s && terminal-notifier -message 'Cleaning Storage: Complete all processes on Terminal!'
```

```sh
rm -rf ~/Library/Developer/Xcode/DerivedData/* ~/Library/Developer/Xcode/iOS\ DeviceSupport/* && sleep 1s && terminal-notifier -message 'Cleaning Storage: Complete all processes on Terminal!'
```

- Xcode
// http://blog.kakeragames.com/2015/12/18/slim-xcode-data.html
// https://qiita.com/reikubonaga/items/48987d35fb10b7de6bcc
```sh
rm -rf ~/Library/Developer/Xcode/Archives/*
rm -rf ~/Library/Developer/Xcode/DerivedData/*
rm -rf ~/Library/Developer/Xcode/iOS\ DeviceSupport/*
rm -rf ~/Library/Logs/iOS\ Simulator/*
```


Chaches
// https://qiita.com/reikubonaga/items/48987d35fb10b7de6bcc
```sh
rm -rf ~/Library/Caches
```
