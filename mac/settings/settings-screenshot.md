## Settings screenshot

```
defaults write com.apple.screencapture name ss
cd ~/Pictures/
mkdir screenshot
defaults write com.apple.screencapture location ~/Pictures/screenshot
defaults write com.apple.screencapture type png
killall SystemUIServer
```

[[mac]スクリーンショットの保存先と保存名を変更する。](https://qiita.com/k-kozaki/items/febd07a22faee1b4704f)
[Mac で最初にやった、オススメソフトのインストールやら設定リスト](http://nekonenene.hatenablog.com/entry/2015/10/19/033338)
