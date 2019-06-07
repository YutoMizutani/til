## Save GitHub password to KeyChain on OSX

#### osxkeychain

[Gitでhttps接続するときのパスワードを保存したい](https://qiita.com/komacchi/items/88fb3d501b1a6d2db301)
> OSXの場合、保存先がキーチェーンに保存されます。やったーこれは便利！
> 初回パスワード入力時に保存されるので、キーチェーンを消さない限り以後入力不要。
> 今回こちらを採用しました。

```
$ git config --global credential.helper osxkeychain
```

[Gitでhttps接続するときのパスワードを保存したい](https://qiita.com/komacchi/items/88fb3d501b1a6d2db301)
