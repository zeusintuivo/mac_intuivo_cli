

# set -x  # DEBUG


# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi




if [[ "$(env |grep BASHPROFILELOADED)" == *"1"* ]] &&
	 ( ! command -v rbenv >/dev/null 2>&1 )  ; then
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
	[[ -r "~/.bash_profile" ]] && [ -n "$PS1" ] && . "~/.bash_profile"
}
fi
# [[ -r "~/.bash_profile" ]] && . "~/.bash_profile"


# PK10 NEEDS TO BE THE LAST OTHER WISE IT DOES NOT WORK
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if ( env | grep WEZTERM_CONFIG_DIR  >/dev/null 2>&1 ) ||
   ( env | grep 'TERMINAL_EMULATOR=JetBrains-JediTerm'  >/dev/null 2>&1 ) ; then
{
  true
}
else
{
	if  [[ "$(env |grep BASHPROFILELOADED)" != *"1"* ]] ; then 
	{
	  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
  	  true
	}
	fi
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

# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# autoload -U promptinit; promptinit
# prompt pure

