
if [[ "$(env |grep BASHPROFILELOADED)" == *"1"* ]] &&
	 ( ! command -v rbenv >/dev/null 2>&1 )  ; then
{
 true 
}
else
{

# REF: https://scriptingosx.com/2017/04/about-bash_profile-and-bashrc-on-macos/
# So in macOS Terminal.app, before you even see a prompt, these scripts will be run:
#
# ###################### Order Bashes Mac
#
# /etc/profile
# /etc/bashrc
# /etc/bashrc_Apple_Terminal
# if it exists:
#  ~/.bash_profile
# # when ~/.bash_profile does not exists,
# ~/.bash_login
# # when neither ~/.bash_profile nor ~/.bash_login exist,
# ~/.profile
# # ~/bash_profile can optionally source
# ~/.bashrc
# # There is also a file
# ~/.inputrc, where you can setup certain command line input options. One common example for this is to enable case-insensitive tab-completion. You can find a list of more options here.
# # Finally, there is
# ~/.bash_logout which is run when a shell exits or closes.
# #
# chmod 700 ~/.bash_profile
# chmod 700 ~/.bashrc
#########################

# Add `~/bin` to the `$PATH`
export PATH="~/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

if [[ $(echo $0) == *"zsh" ]] ; then  # [[ $(which $SHELL) == *"zsh" ]] && 
    {
		# Case-insensitive globbing (used in pathname expansion)
		setopt -s nocaseglob;

		# Append to the Bash history file, rather than overwriting it
		setopt -s histappend;

		# Autocorrect typos in path names when using `cd`
		setopt -s cdspell;

		# Enable some Bash 4 features when possible:
		# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
		# * Recursive globbing, e.g. `echo **/*.txt`
		for option in autocd globstar; do
		    setopt -s "$option" 2> /dev/null;
		done;
    }
elif [[ $(echo $0) == *"bash" ]] ; then # [[ $(which $SHELL) == *"bash" ]] && 
    {
		# Case-insensitive globbing (used in pathname expansion)
		shopt -s nocaseglob;

		# Append to the Bash history file, rather than overwriting it
		shopt -s histappend;
		
		# Autocorrect typos in path names when using `cd`
		shopt -s cdspell;

		# Enable some Bash 4 features when possible:
		# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
		# * Recursive globbing, e.g. `echo **/*.txt`
		for option in autocd globstar; do
		    shopt -s "$option" 2> /dev/null;
		done;
		# Add tab completion for many Bash commands
		if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
		    source "$(brew --prefix)/share/bash-completion/bash_completion";
		elif [ -f /etc/bash_completion ]; then
		    source /etc/bash_completion;
		fi;

		# Enable tab completion for `g` by marking it as an alias for `git`
		if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
		    complete -o default -o nospace -F _git g;
		fi;
    }
fi


# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "~/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;


# IPython Notebook Spark integration, added by aws.sh
export SPARK_HOME='/usr/local/Cellar/apache-spark/1.4.1'
# Appending pyspark-shell is needed for Spark 1.4+
export PYSPARK_SUBMIT_ARGS='--master local[2] pyspark-shell'




# React Native
[[ -d "~/Library/Android/sdk" ]] &&  export ANDROID_HOME=~/Library/Android/sdk
[[ -d "$ANDROID_HOME/emulator" ]] && export PATH=$PATH:$ANDROID_HOME/emulator
[[ -d "$ANDROID_HOME/tools" ]] && export PATH=$PATH:$ANDROID_HOME/tools
[[ -d "$ANDROID_HOME/tools/bin" ]] && export PATH=$PATH:$ANDROID_HOME/tools/bin
[[ -d "$ANDROID_HOME/platform-tools" ]] && export PATH=$PATH:$ANDROID_HOME/platform-tools

#  REACT_EDITOR
( type webstorm >/dev/null 2>&1 ) && export REACT_EDITOR=WebStorm

# RVM
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
[[ -d "~/.rvm/bin" ]] && export PATH="$PATH:~/.rvm/bin"
[[ -s "~/.rvm/scripts/rvm" ]] && source "~/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


# RBENV
# eval "$(rbenv init -)"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# NODENV
# eval "$(nodenv init -)"
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi


# NVM
# export NVM_DIR="~/.nvm"
# [[ -d "~/.nvm" ]] && export NVM_DIR="~/.nvm"
# NVM Brew version
[[ -d "~/.nvm" ]] && export NVM_DIR="$(brew --prefix nvm)"
[[ -d "~/.nvm" ]] && . "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Cargo
[[ -s "~/.cargo/env" ]] &&  source "~/.cargo/env"

# MYCD
[[ -d "~/.mycd" ]] && . ~/.mycd/mycd.sh

# COMPOSER
# User specific aliases and functions # Linux Fedora
[[ -d "~/.config/composer/vendor/bin" ]] && export PATH="$PATH:~/.config/composer/vendor/bin"
# Composer # Mac
[[ -d "~/.composer/vendor/bin" ]] && export PATH=$PATH:"~/.composer/vendor/bin"

# PYENV
[[ -d "~/.pyenv/bin" ]] && export PATH="~/.pyenv/bin:$PATH"
[[ -d "~/.pyenv/bin" ]] && eval "$(pyenv init -)"
[[ -d "~/.pyenv/bin" ]] && eval "$(pyenv virtualenv-init -)"

# fzf: um fuzzy finder
[[ -f "~/.fzf.zsh" ]] && source ~/.fzf.zsh

# MONGO
[[ -d "~/_/mongo/bin" ]] && export PATH="~/_/mongo/bin:$PATH"

# fonts
[[ -d "~/.fonts" ]] && source ~/.fonts/*.sh

# BIN Local User defined sed first
[[ -d "/usr/local/bin" ]] && export PATH="/usr/local/bin:$PATH"

# MySQL installed from .app for mac
[[ -d "/usr/local/mysql/bin" ]] && export PATH="/usr/local/mysql/bin:$PATH"

# Makeinfo Textinfo From Homebrew
[[ -d "/usr/local/opt/texinfo/bin" ]] && export PATH="/usr/local/opt/texinfo/bin:$PATH"

# PKG_CONFIG
[[ -d "/usr/local/bin/pkg-config" ]] && export PKG_CONFIG="/usr/local/bin/pkg-config"
# [[ -d "/usr/local/lib/pkgconfig" ]] && export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
# [[ -d "/usr/local/lib/pkgconfig" ]] && export PKG_CONFIG_LIBDIR="/usr/local/lib/pkgconfig"

# Brew NCurses
[[ -d "/usr/local/opt/ncurses/lib" ]] && export LDFLAGS="-L/usr/local/opt/ncurses/lib"
[[ -d "/usr/local/opt/ncurses/include" ]] && export CPPFLAGS="-I/usr/local/opt/ncurses/include"
[[ -d "/usr/local/opt/ncurses/lib/pkgconfig" ]] &&  export PKG_CONFIG_PATH="/usr/local/opt/ncurses/lib/pkgconfig"

# Brew
[[ -d "/usr/local/sbin" ]] && export PATH="/usr/local/sbin:$PATH"

# Brew Make
[[ -d "/usr/local/opt/make/libexec/gnubin" ]] && export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"


export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/apr/bin:$PATH"
export PATH="/usr/local/opt/apr-util/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/openldap/bin:$PATH"
export PATH="/usr/local/opt/openldap/sbin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="/usr/local/opt/krb5/bin:$PATH"
export PATH="/usr/local/opt/krb5/sbin:$PATH"
export PATH="/usr/local/opt/libpq/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/apr/lib"
export CPPFLAGS="-I/usr/local/opt/apr/include"

export LDFLAGS="-L/usr/local/opt/openldap/lib"
export CPPFLAGS="-I/usr/local/opt/openldap/include"

  export LDFLAGS="-L/usr/local/opt/curl/lib"
  export CPPFLAGS="-I/usr/local/opt/curl/include"

  export LDFLAGS="-L/usr/local/opt/krb5/lib"
  export CPPFLAGS="-I/usr/local/opt/krb5/include"

  export LDFLAGS="-L/usr/local/opt/libpq/lib"
  export CPPFLAGS="-I/usr/local/opt/libpq/include"

export LDFLAGS="-L/usr/local/opt/icu4c/lib"
export CPPFLAGS="-I/usr/local/opt/icu4c/include" 

export PKG_CONFIG_PATH="/usr/local/opt/libpq/lib/pkgconfig"
export PKG_CONFIG_PATH="/usr/local/opt/krb5/lib/pkgconfig"
export PKG_CONFIG_PATH="/usr/local/opt/curl/lib/pkgconfig"
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"
export PKG_CONFIG_PATH="/usr/local/opt/apr/lib/pkgconfig"
# export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
# echo $(realpath $(brew --prefix openssl@1.1))
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/Cellar/openssl@1.1/1.1.1i"


# If you need to have libpq first in your PATH run:
#  echo 'export PATH="/usr/local/opt/libpq/bin:$PATH"' >> ~/.zshrc
#
# For compilers to find libpq you may need to set:
#  export LDFLAGS="-L/usr/local/opt/libpq/lib"
#  export CPPFLAGS="-I/usr/local/opt/libpq/include"
#
# For pkg-config to find libpq you may need to set:
#  export PKG_CONFIG_PATH="/usr/local/opt/libpq/lib/pkgconfig"

# If you need to have krb5 first in your PATH run:
#  echo 'export PATH="/usr/local/opt/krb5/bin:$PATH"' >> ~/.zshrc
#  echo 'export PATH="/usr/local/opt/krb5/sbin:$PATH"' >> ~/.zshrc
#
# For compilers to find krb5 you may need to set:
#  export LDFLAGS="-L/usr/local/opt/krb5/lib"
#  export CPPFLAGS="-I/usr/local/opt/krb5/include"
#
# For pkg-config to find krb5 you may need to set:
#  export PKG_CONFIG_PATH="/usr/local/opt/krb5/lib/pkgconfig"

# If you need to have curl first in your PATH run:
#  echo 'export PATH="/usr/local/opt/curl/bin:$PATH"' >> ~/.zshrc
#
# For compilers to find curl you may need to set:
#  export LDFLAGS="-L/usr/local/opt/curl/lib"
#  export CPPFLAGS="-I/usr/local/opt/curl/include"
#
# For pkg-config to find curl you may need to set:
#  export PKG_CONFIG_PATH="/usr/local/opt/curl/lib/pkgconfig"

# If you need to have openldap first in your PATH run:
#  echo 'export PATH="/usr/local/opt/openldap/bin:$PATH"' >> ~/.zshrc
#  echo 'export PATH="/usr/local/opt/openldap/sbin:$PATH"' >> ~/.zshrc
#
# For compilers to find openldap you may need to set:
#  export LDFLAGS="-L/usr/local/opt/openldap/lib"
#  export CPPFLAGS="-I/usr/local/opt/openldap/include"
#
#
# If you need to have apr first in your PATH run:
#  echo 'export PATH="/usr/local/opt/apr/bin:$PATH"' >> ~/.zshrc
#
# For compilers to find apr you may need to set:
#  export LDFLAGS="-L/usr/local/opt/apr/lib"
#  export CPPFLAGS="-I/usr/local/opt/apr/include"
#
# For pkg-config to find apr you may need to set:
#  export PKG_CONFIG_PATH="/usr/local/opt/apr/lib/pkgconfig"


export EDITOR=subl
export HOMEBREW_EDITOR=subl

# Bashrc
export BASHPROFILELOADED
typeset BASHPROFILELOADED="1"
# [[ -r "~/.bashrc" ]] && . "~/.bashrc"


# Alacritty terminal
env | grep ALACRITTY_LOG  >/dev/null 2>&1 && [[ -r "~/alacritty.bash" ]] && . "~/alacritty.bash"
env | grep ALACRITTY_LOG  >/dev/null 2>&1 && cd _/work/doctolib/projects/doctolib
env | grep ALACRITTY_LOG  >/dev/null 2>&1 && nodemon --exec $(pwd)/dev-env-setup/bin/setup-server-macos.sh --watch $(pwd)/dev-env-setup/bin/setup-server-macos.sh --watch $(pwd)/dev-env-setup/bin/generate_error.bash --watch ${HOME}/_/clis/execute_command_intuivo_cli/execute_boot_basic.sh --watch ${HOME}/_/clis/task_intuivo_cli/execute_as_sudo.sh --watch ${HOME}/_/clis/execute_command_intuivo_cli/struct_testing --watch ${HOME}/_/clis/execute_command_intuivo_cli/execute_command
env | grep ALACRITTY_LOG  >/dev/null 2>&1 && true || true

# Wezterm Terminal
# env | grep WEZTERM_CONFIG_DIR  >/dev/null 2>&1 && cd ~/_/itch/wezterm
# env | grep WEZTERM_CONFIG_DIR  >/dev/null 2>&1 && cargo fmt --all -- --check
# env | grep WEZTERM_CONFIG_DIR  >/dev/null 2>&1 && cd _/work/doctolib/projects/doctolib/dev-env-setup/
# env | grep WEZTERM_CONF_DIR && nodemon --exec $(pwd)/dev-env-setup/bin/setup-server-macos.sh --watch $(pwd)/dev-env-setup/bin/setup-server-macos.sh --watch $(pwd)/dev-env-setup/bin/generate_error.bash --watch ${HOME}/_/clis/execute_command_intuivo_cli/execute_boot_basic.sh --watch ${HOME}/_/clis/task_intuivo_cli/execute_as_sudo.sh --watch ${HOME}/_/clis/execute_command_intuivo_cli/struct_testing --watch ${HOME}/_/clis/execute_command_intuivo_cli/execute_command
# env | grep WEZTERM_CONFIG_DIR  >/dev/null 2>&1 && nur docto && head -10 ../README.md # | sed '/^\s*$/d' # delete empty lines
# env | grep WEZTERM_CONFIG_DIR  >/dev/null 2>&1 && cd ~/_/itch/wezterm
env | grep WEZTERM_CONFIG_DIR  >/dev/null 2>&1 && true || true
#  echo "
# nginx-conf/doctolib.conf:9 root /path/to/doctolib/public;
# /Users/benutzer/_/work/doctolib/projects/doctolib/dev-env-setup/nginx-conf/doctolib.conf
# /Users/benutzer/_/work/doctolib/projects/doctolib/dev-env-setup/nginx-conf/doctolib.conf:7
# /Users/benutzer/_/work/doctolib/projects/doctolib/dev-env-setup/nginx-conf/doctolib.conf:7:12
# # Doctolib Rails application

# [![Storybook](https://github.com/storybooks/brand/blob/master/badge/badge-storybook.svg)](https://doctolib.github.io/storybook)

#                 _ => false,
# Diff in /Users/benutzer/_/itch/wezterm/wezterm-gui/src/gui/termwindow.rs at line 3631:
# "
# Kitty Terminal
env | grep 'TERM=xterm-kitty'  >/dev/null 2>&1 && cd _/clis
env | grep 'TERM=xterm-kitty'  >/dev/null 2>&1 && true || true


# JetBrains Terminal
env | grep 'TERMINAL_EMULATOR=JetBrains-JediTerm'  >/dev/null 2>&1 && true || true


# Emacs
# alias em=emacs -nw
# Display current command at the top of terminal window or tab
# trap 'echo -ne "\033]2;$(history 1 | sed "s/^[0-9 ]* \+//")\007"' DEBUG


# MYCD
[[ -d "~/.mycd" ]] && . ~/.mycd/mycd.sh

cd $(pwd)  # Call cd to make sure .dir_bash_history is called here by mycd



}
fi

