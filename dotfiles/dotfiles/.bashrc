if [[ "$(env |grep BASHPROFILELOADED)" == *"1"* ]] && [[ "$(declare -f nvm | grep nvm)" == *"nvm_"* ]] ; then
if [[ -n "$DISPLAY+x"  ]] ; then	
# echo "bash_profile loaded"
BASHDISPLAY=$DISPLAY
fi
else 
[[ -r "$HOME/.bash_profile" ]] && . "$HOME/.bash_profile"

fi

