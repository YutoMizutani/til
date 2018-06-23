## All install script

```sh
# Update
brew upgrade --cleanup
brew cask upgrade

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

# Move folder
cd ~ && cd scripts

# Create delete all script
cat << 'EOT' > delete.sh
cd ~ && rm -rf scripts
EOT

# Run all
cat << 'EOT' > run.sh
cd dependencies
sh install-xcode.sh
sh install-ruby.sh
sh install-homebrew.sh
sh install-nodebrew.sh
cd ..

for file in `\find ./installers/ -name '*.sh'`; do
    sh $file
done
EOT
sh run.sh
```
