## Line code on windows

mac側で開発した.gitを、Windows側でgit add . するとCRLFで改行文字を変更しようとする。

```
$ git add .
warning: LF will be replaced by CRLF in <foo>
```

> なにやら Git が改行コードを CRLF へ変更しようとするらしい。
> で、以下を実行

```
$ git config --global core.autoCRLF false
```

> これで、改行コードを CRLF へ変更しなくなるらしい。

[git add した時に出る改行コードのwarning対応](http://d.hatena.ne.jp/Kmizukix/20100106/1262711140)
