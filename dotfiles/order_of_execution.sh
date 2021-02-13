/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew
brew doctor

brew install node
  echo 'export PATH="/usr/local/opt/icu4c/bin:$PATH"' >> ~/.zshrc
  echo 'export PATH="/usr/local/opt/icu4c/sbin:$PATH"' >> ~/.zshrc

  echo 'export PATH="/usr/local/opt/icu4c/sbin:$PATH"' >> ~/.bashrc
  echo 'export PATH="/usr/local/opt/icu4c/bin:$PATH"' >> ~/.bashrc

echo ' export LDFLAGS="-L/usr/local/opt/icu4c/lib"' >> ~/.zshrc
echo '  export CPPFLAGS="-I/usr/local/opt/icu4c/include" '   >> ~/.zshrc

echo ' export LDFLAGS="-L/usr/local/opt/icu4c/lib"' >> ~/.bashrc
echo '  export CPPFLAGS="-I/usr/local/opt/icu4c/include" '   >> ~/.bashrc

brew install nodenv
 echo 'export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"' >> ~/.zshrc

 echo 'export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"' >> ~/.bashrc

  export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
  export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

brew install  rbenv 
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"
echo 'export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"' >> .zshrc 
echo 'export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"' >> .bashrc 
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
echo 'export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"'  >> .zshrc 
echo 'export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"'  >> .bashrc 

brew install the_platinum_searcher the_silver_searcher
brew unlink the_silver_searcher
brew link the_silver_searcher

./setup_mac.bash
echo from eval """$(wget --quiet --no-check-certificate  https://raw.githubusercontent.com/zeusintuivo/task_intuivo_cli/master/install.clis.bash -O -  2>/dev/null )"""
./install.clis.bash

echo from /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ptb/mac-setup/develop/mac-setup.command)"
echo from curl --location --silent   "https://github.com/ptb/mac-setup/raw/develop/mac-setup.command" |   source /dev/stdin 0
echo . mac-setup.command 
echo or source 'mac-setup.command' 0
source 'mac-setup.command' 0
init && install && config
# init_perms
# init_maskeep
# init_sudo
# init_updates
# config_rm_sudoers

echo from curl -O https://raw.githubusercontent.com/arunmathews/mac-setup/master/mac-setup.txt
bash mac-setup.txt


echo from curl -O https://raw.githubusercontent.com/coffe4u/mac-setup/master/setup.sh
bash setup.sh


echo from git clone https://github.com/donnemartin/dev-setup.git && cd dev-setup\
cd dev-setup
./.dots all


# clone
    git clone https://github.com/powerline/fonts.git --depth=1
    # install
    cd fonts
    ./install.sh
    # clean-up a bit
    cd ..
    rm -rf fonts