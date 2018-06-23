## Install zsh

```sh
brew install zsh zsh-completions
echo /usr/local/bin/zsh | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
```

[Homebrewで最新のzshをインストール](https://saku.io/install-latest-zsh-using-homebrew/)
[お前らのターミナルはダサい](https://qiita.com/kinchiki/items/57e9391128d07819c321)
