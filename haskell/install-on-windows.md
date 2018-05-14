## Install on Windows

1. Download from [this](https://www.haskell.org/platform/windows.html).
2. Install settings open by *cmd.exe*,

```
> cabal update
> cabal install happy hlint
```

### with VS code
1. Install hoogle
マウスホバー時に情報表示
```
> stack install hoogle --install-ghc
> hoogle generate
```
2. Isntall HIE
```
> stack install happy
> git clone https://github.com/haskell/haskell-ide-engine
> cd haskell-ide-engine
> stack install
```

### Auto rebuild
```
> stack build --fast --file-watch
```

## Reference
- https://www.haskell.org/platform/windows.html
- http://chichi1091.hatenablog.jp/entry/2017/03/21/120837
- https://qiita.com/nakamurau1@github/items/7feaeb643cb48842b613
- https://qiita.com/waddlaw/items/b83cd10311200095fe87
