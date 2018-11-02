## [WIP] Make Project Template

```sh
cd /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/Project\ Templates/
sudo mkdir <foo>
cd <foo>
sudo cp -R /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/Project\ Templates/iOS/Application/{Cocoa\ Touch\ App\ Base.xctemplate,Storyboard\ App.xctemplate,Single\ View\ App.xctemplate} .
sudo mv Single\ View\ App.xctemplate <foo>\ App.xctemplate/
```

[[Xcode7]Project Templateを自作したので作り方をざっとまとめる](https://qiita.com/krimpedance/items/abf6c4da74e5729b427d)
[Move original AppDelegate to group in XCode Template](https://stackoverflow.com/questions/27250015/move-original-appdelegate-to-group-in-xcode-template)
