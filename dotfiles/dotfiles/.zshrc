# References
# OhMyZsh: https://github.com/robbyrussell/oh-my-zsh
# Powerlevel9k: https://github.com/bhilburn/powerlevel9k
# Powerline fonts: https://github.com/powerline/fonts
# Awesome Terminal Fonts: https://github.com/gabrielelana/awesome-terminal-fonts
# ZSH Syntax Highlighting: https://github.com/zsh-users/zsh-syntax-highlighting
#
# For more plugins search this repo: https://github.com/unixorn/awesome-zsh-plugins


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
#ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME=powerlevel10k/powerlevel10k
POWERLEVEL9K_MODE="awesome-fontconfig"
# POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs command_execution_time time context)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=8

POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''

POWERLEVEL9K_TIME_FOREGROUND='245'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='245'
POWERLEVEL9K_STATUS_OK_FOREGROUND='green'
POWERLEVEL9k_STATUS_ERROR_FOREGROUND='red'
POWERLEVEL9k_STATUS_ERROR_FOREGROUND='red'

POWERLEVEL9K_TIME_BACKGROUND='clear'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='clear'
POWERLEVEL9K_STATUS_OK_BACKGROUND='clear'
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='clear'
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='clear'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='clear'

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	ruby
    # dnf
	composer
 	zsh-syntax-highlighting
    # laravel
  	# rvm
  	nvm
    # bgnotify
  	zsh-autosuggestions
  	history
   	# last-working-dir
   	# lein
	git
	# docker
	rbenv
  pyenv
  nodenv
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# source $HOME/Downloads/awesome-terminal-fonts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_STYLES[cursor]='bold'

ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green,bold'


if [[ "$(env |grep BASHPROFILELOADED)" == *"1"* ]] &&
	 [[ "$(declare -f nvm | grep nvm)" == *"nvm_"* ]] ; then
{
	if [[ -n "$DISPLAY+x"  ]] ; then
	{
    # echo "bash_profile loaded"
    BASHDISPLAY=$DISPLAY
	}
	fi
}
else
{
	[[ -r "$HOME/.bash_profile" ]] && . "$HOME/.bash_profile"
}
fi
# [[ -r "$HOME/.bash_profile" ]] && . "$HOME/.bash_profile"


# PK10 NEEDS TO BE THE LAST OTHER WISE IT DOES NOT WORK
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if ( env | grep WEZTERM_CONFIG_DIR  >/dev/null 2>&1 ) ||
   ( env | grep 'TERMINAL_EMULATOR=JetBrains-JediTerm'  >/dev/null 2>&1 ) ; then
{
  true
}
else
{
  [[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh
  true
}
fi
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

# [[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh
# autoload -U promptinit; promptinit
# prompt pure

