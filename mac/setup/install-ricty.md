## Install ricty for mac

```
$ brew tap sanemat/font
$ brew install ricty
$ cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
$ fc-cache -vf
```

#### script

```
cd ~ && mkdir scripts/sh && cd scripts/sh
cat << 'EOT' > install-ricty.sh
brew tap sanemat/font
brew install ricty
cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf
EOT
```

[プログラミング用フォントRictyをMacにインストールする](https://qiita.com/segur/items/50ae2697212a7bdb7c7f)
