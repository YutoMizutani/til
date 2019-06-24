## sed; Stream Editor

```sh
sed -i 's/original/new/g' file.txt

foo='new'
sed -i 's/original/'$foo'/g' file.txt
```

> Explanation:
>
> sed = Stream EDitor
> -i = in-place (i.e. save back to the original file)
> The command string:
> s = the substitute command
> original = a regular expression describing the word to replace (or just the word itself)
> new = the text to replace it with
> g = global (i.e. replace all and not just the first occurrence)
> file.txt = the file name

## If you use macOS

```sh
sed -i "" 's/original/'$foo'/g' file.txt
```

[Sed: 'sed: 1: invalid command code R' on Mac OS X](https://markhneedham.com/blog/2011/01/14/sed-sed-1-invalid-command-code-r-on-mac-os-x/)
[Find and replace text within a file using commands](https://askubuntu.com/questions/20414/find-and-replace-text-within-a-file-using-commands)
[sedコマンドの条件式に変数を使う場合に注意すること](https://hacknote.jp/archives/32540/)
[Mac OS X のローカルで sed が実行されないケース](http://arshavin0909.hateblo.jp/entry/2012/08/29/150609)
