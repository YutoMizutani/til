## All install script

```sh
sudo su
exit

# Add settings folder
cd ~ && mkdir scripts/settings && cd scripts/settings

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

# Add install script folder
cd ~ && mkdir scripts/dependencies && cd scripts/dependencies

# Install Xcode
cat << 'EOT' > install-xcode.sh
xcode-select --install
EOT

# Install ruby (rbenv, bundler)
cat << 'EOT' > install-ruby.sh
brew install rbenv ruby-build
rbenv r install $(rbenv install -l | grep -v - | tail -1)
gem install bundler
rbenv rehash
EOT

# Install Homebrew
cat << 'EOT' > install-homebrew.sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew upgrade --cleanup
brew install bash
export HOMEBREW_CASK_OPTS="--appdir=/Applications" >> .bashrc
source .bashrc
EOT

cat << 'EOT' > install-nodebrew.sh
brew install nodebrew
nodebrew setup
export PATH=/usr/local/var/nodebrew/current/bin:$PATH >> ~/.bash_profile
export PATH=$HOME/.nodebrew/current/bin:$PATH >> ~/.bash_profile
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
brew install zsh zsh-completions
echo /usr/local/bin/zsh | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
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

# Install Skitch
cat << 'EOT' > install-skitch.sh
brew cask install skitch
EOT

# Install Dropbox
cat << 'EOT' > install-dropbox.sh
brew cask install dropbox
EOT

# Install Kobito
cat << 'EOT' > install-kobito.sh
brew cask install kobito
EOT

# Install Vagrant
cat << 'EOT' > install-vagrant.sh
brew cask install vagrant
EOT

# Install VirtualBox
cat << 'EOT' > install-virtualbox.sh
brew cask install virtualbox
EOT

# Install cyberduck
cat << 'EOT' > install-cyberduck.sh
brew cask install cyberduck
EOT

# Install Alfred
cat << 'EOT' > install-alfred.sh
brew cask install alfred
EOT

# Install Gimp
cat << 'EOT' > install-gimp.sh
brew cask install gimp
EOT

# Install Cheatsheet
cat << 'EOT' > install-cheatsheet.sh
brew cask install cheatsheet
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

# Install The Unarchive
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
sh install-ruby.sh
sh install-homebrew.sh
sh install-nodebrew.sh
cd ..

# install
for file in `\find ./installers/ -name '*.sh'`; do
    sh $file
done

# update
brew upgrade --cleanup
brew cask upgrade
EOT
sh run.sh
```
