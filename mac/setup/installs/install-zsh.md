## Install zsh

```sh
brew install zsh zsh-completions zsh-syntax-highlighting autojump peco
echo source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh >> ~/.zshrc
echo /usr/local/bin/zsh | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
```

[Homebrewで最新のzshをインストール](https://saku.io/install-latest-zsh-using-homebrew/)
[お前らのターミナルはダサい](https://qiita.com/kinchiki/items/57e9391128d07819c321)
[zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
[え、まだpecoを使ってないの？？？](https://qiita.com/vintersnow/items/08852df841e8d5faa7c2)
[wting/autojump](https://github.com/wting/autojump)
[]()
[]()
[]()
