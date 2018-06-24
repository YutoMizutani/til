## Install pyenv

#### Install

```sh
# Install python (pyenv, virtualenv, python2, python3)
cat << 'EOT' > install-pyenv.sh
brew install pyenv pyenv-virtualenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
python2=$(pyenv install -l | grep -v '[a-zA-Z]' | grep -e '\s2\.?*' | tail -1)
python3=$(pyenv install -l | grep -v '[a-zA-Z]' | grep -e '\s3\.?*' | tail -1)
pyenv install $python2
pyenv install $python3
pyenv global $python2 $python3
pyenv rehash
EOT
sh install-pyenv.sh
```

#### Search versions

python 2.x

```sh
$ pyenv install -l | grep -v '[a-zA-Z]' | grep -e '\s2\.?*' | tail -1
```

python 3.x

```sh
$ pyenv install -l | grep -v '[a-zA-Z]' | grep -e '\s3\.?*' | tail -1
```


[rbenvでRubyの最新安定版をインストールするワンライナー](https://mawatari.jp/archives/install-latest-stable-version-of-ruby-using-rbenv)
[tail - ファイルの末尾部分を表示する](https://www.ibm.com/support/knowledgecenter/ja/ssw_i5_54/rzahz/tail.htm)
[grepでこういう時はどうする?](https://qiita.com/hirohiro77/items/771ffb64dddceabf69a3)
[grepコマンドの詳細まとめました【Linuxコマンド集】](https://eng-entrance.com/linux-command-grep)
[変数を使用する – UNIX & Linux コマンド・シェルスクリプト リファレンス](https://shellscript.sunone.me/variable.html)
[MacでPython使う時の最低限のメモ（pyenv編）](https://qiita.com/zaburo/items/dd1a8323633035614efc)
[【へぇ】IT業界でよく見る、rc版、とかga版とはなんぞや](https://chat-rate.com/it/2200/)
