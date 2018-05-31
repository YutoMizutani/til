## Rectangle Selection

矩形選択を行う。

#### Install packages

* multi-cursor
* vim-mode

#### Keymap settings

vim-modeの設定からキーバインドを変更する。

keymap.cson
```cs
'atom-text-editor.vim-mode:not(.insert-mode)':
  'alt-cmd-j': 'multi-cursor:expandDown'
  'alt-cmd-k': 'multi-cursor:expandUp'
  'alt-cmd-l': 'core:select-right'
  'alt-cmd-h': 'core:select-left'
  'alt-cmd-u': 'multi-cursor:skipUp'
  'alt-cmd-d': 'multi-cursor:skipDown'
```

Windowsならこんな感じ。

```cs
'atom-text-editor.vim-mode:not(.insert-mode)':
  'alt-ctrl-j': 'multi-cursor:expandDown'
  'alt-ctrl-k': 'multi-cursor:expandUp'
  'alt-ctrl-l': 'core:select-right'
  'alt-ctrl-h': 'core:select-left'
  'alt-ctrl-u': 'multi-cursor:skipUp'
  'alt-ctrl-d': 'multi-cursor:skipDown'
```

[【Atom Editor】マウス操作不要！キーボードだけで矩形選択をする方法](https://qiita.com/cw-shibuya/items/ea043acab16925497cb4)
