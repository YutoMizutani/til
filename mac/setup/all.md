## All install script

```sh
# Add settings folder
cd ~ && mkdir scripts && mkdir scripts/settings && cd scripts/settings

# Settings Finder (Show hidden files)
cat << 'EOT' > settings-finder.sh
defaults write com.apple.finder AppleShowAllFiles -boolean true
killall Finder
EOT

# Settings ScreenShot (Change save path)
cat << 'EOT' > settings-screenshot.sh
defaults write com.apple.screencapture name "screenshot"
defaults write com.apple.screencapture include-date -bool false
defaults write com.apple.screencapture location "~/Pictures/screenshot"
killall SystemUIServer
EOT

# Settings auto-run photos app when any iOS devices connected
cat << 'EOT' > settings-photos.sh
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool YES
EOT

# Add install script folder
cd ~ && mkdir scripts/dependencies && cd scripts/dependencies

# Install Xcode
cat << 'EOT' > install-xcode.sh
xcode-select --install
EOT

# Install Homebrew
cat << 'EOT' > install-homebrew.sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew analytics off
brew upgrade
brew install bash
echo export HOMEBREW_CASK_OPTS="--appdir=/Applications" >> .bashrc
echo export HOMEBREW_NO_ANALYTICS=1 >> .bashrc
source .bashrc
EOT

# Install ruby (rbenv, bundler)
cat << 'EOT' > install-rbenv.sh
brew install rbenv ruby-build
rbenv install $(rbenv install -l | grep -v - | tail -1)
rbenv global $(rbenv install -l | grep -v - | tail -1)
sudo gem install bundler
rbenv rehash
EOT

# Install python (pyenv, virtualenv, python3)
cat << 'EOT' > install-pyenv.sh
brew install pyenv pyenv-virtualenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
python3=$(pyenv install -l | grep -v '[a-zA-Z]' | grep -e '\s3\.?*' | tail -1)
pyenv install $python3
pyenv global $python3
pyenv rehash
EOT

cat << 'EOT' > install-nodebrew.sh
brew install nodebrew
nodebrew setup
echo export PATH=/usr/local/var/nodebrew/current/bin:$PATH >> ~/.bash_profile
echo export PATH=$HOME/.nodebrew/current/bin:$PATH >> ~/.bash_profile
source .bash_profile
nodebrew install-binary stable
nodebrew use stable
npm update -g npm
EOT

# Add install script folder
cd ~ && mkdir scripts/installers && cd scripts/installers

# Install CocoaPods
cat << 'EOT' > install-cocoapods.sh
sudo gem install cocoapods
pod setup
EOT

# Install ricty
cat << 'EOT' > install-ricty.sh
brew tap sanemat/font
brew install ricty
cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf
EOT

## brew installs

# Install tree
cat << 'EOT' > install-tree.sh
brew install tree
EOT

# Install zsh
cat << 'EOT' > install-zsh.sh
cp .bashrc .zshrc
cp .bash_profile .zprofile
brew install zsh zsh-completions zsh-syntax-highlighting autojump peco
echo source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh >> ~/.zshrc
echo /usr/local/bin/zsh | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
EOT

# Install wget
cat << 'EOT' > install-wget.sh
brew install wget
EOT

# Install mas
cat << 'EOT' > install-mas.sh
brew install mas
EOT

## brew cask installs

# Install Atom
cat << 'EOT' > install-atom.sh
brew cask install atom
EOT

# Install iTerm2
cat << 'EOT' > install-iterm2.sh
brew cask install iterm2
EOT

# Install MacDown
cat << 'EOT' > install-macdown.sh
brew cask install macdown
EOT

# Install Google Chrome
cat << 'EOT' > install-google-chrome.sh
brew cask install google-chrome
EOT

# Install Alfred
cat << 'EOT' > install-alfred.sh
brew cask install alfred
EOT

# Install Slack
cat << 'EOT' > install-slack.sh
brew cask install slack
EOT

# Install KeepingYouAwake
cat << 'EOT' > install-keepingyouawake.sh
brew cask install keepingyouawake
EOT

# Install AppCleaner
cat << 'EOT' > install-appcleaner.sh
brew cask install appcleaner
EOT

# Install The Unarchiver
cat << 'EOT' > install-the-unarchiver.sh
brew cask install the-unarchiver
EOT

# Move folder
cd ~ && cd scripts

# Create delete all script
cat << 'EOT' > delete.sh
cd ~ && rm -rf scripts
EOT

# Run all
cat << 'EOT' > run.sh
# settings
for file in `\find ./settings/ -name '*.sh'`; do
    sh $file
done

cd dependencies
sh install-xcode.sh
sh install-homebrew.sh
sh install-rbenv.sh
sh install-pyenv.sh
sh install-nodebrew.sh
cd ..

# install
for file in `\find ./installers/ -name '*.sh'`; do
    sh $file
done

# update
brew upgrade
brew cask upgrade
EOT

sh run.sh
```
