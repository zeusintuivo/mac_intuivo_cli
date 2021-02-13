#! /bin/bash

# Homebrew
echo "---- Homebrew ----"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade --all --cleanup
brew -v

# git
echo "---- git ----" 
brew install git
git --version

# ispec-inc/mac-setup-one-command
echo "---- download setup files from github ----"
git clone https://github.com/ispec-inc/mac-setup-one-command.git


# change cask install dir
echo "---- change cask install directory ----"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"


# Memorize user pass
read -sp "Your Password: " pass;


# mas & Xcode
brew install mas
mas install 497799835  # Xcode (8.2.1)


# zsh
echo " ---- zsh ----"
brew install zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting colordiff
which -a zsh
echo $pass | sudo -S -- sh -c 'echo '/usr/local/bin/zsh' >> /etc/shells'
chsh -s /usr/local/bin/zsh


# vim 
echo " ---- Vim ----"
brew install vim --with-override-system-vi

echo " ---- Powerline ----"
git clone https://github.com/bhilburn/powerlevel9k.git ~/powerlevel9k
git clone https://github.com/powerline/fonts.git ~/fonts
~/fonts/install.sh

# ruby 
echo " ---- Ruby ----"
brew install rbenv
brew install ruby-build
rbenv --version
rbenv install -l
ruby_latest=$(rbenv install -l | grep -v '[a-z]' | tail -1 | sed 's/ //g')
rbenv install $ruby_latest
rbenv global $ruby_latest
rbenv rehash
ruby -v


# dotsfile
echo " ---- dotfiles ----"
sh -c "`curl -fsSL https://raw.githubusercontent.com/skwp/dotfiles/master/install.sh`"
cp ~/mac-setup-with-one-command/settings/zsh/private.zsh ~/.yadr/zsh/private.zsh
source ~/.zshrc

# wget
brew install wget
wget --version

###
### next command
###
while true; do
  read -p 'Now install Common Apps? [Y/n]' Answer
  case $Answer in
    '' | [Yy]* )
      $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/mac-setup-with-one-command/install-common.sh
      break;
      ;;
    [Nn]* )
      echo "Skip install"
      break;
      ;;
    * )
      echo Please answer YES or NO.
  esac
done;


while true; do
  read -p 'Now install Web Developer Apps? [Y/n]' Answer
  case $Answer in
    '' | [Yy]* )
      $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/mac-setup-with-one-command/install-web-dev.sh
      break;
      ;;
    [Nn]* )
      echo "Skip install"
      break;
      ;;
    * )
      echo Please answer YES or NO.
  esac
done;



while true; do
  read -p 'Now install iOS Developer Apps? [Y/n]' Answer
  case $Answer in
    '' | [Yy]* )
      $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/mac-setup-with-one-command/install-ios-dev.sh
      break;
      ;;
    [Nn]* )
      echo "Skip install"
      break;
      ;;
    * )
      echo Please answer YES or NO.
  esac
done;


while true; do
  read -p 'Now install Go Developer Apps? [Y/n]' Answer
  case $Answer in
    '' | [Yy]* )
      $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/mac-setup-with-one-command/install-go-dev.sh
      break;
      ;;
    [Nn]* )
      echo "Skip install"
      break;
      ;;
    * )
      echo Please answer YES or NO.
  esac
done;

