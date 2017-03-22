pip install virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=~/Projects
source /usr/local/bin/virtualenvwrapper.sh

# postactivate
#
# PS1="$_OLD_VIRTUAL_PS1"
# _OLD_RPROMPT="$RPROMPT"
# RPROMPT="%{${fg_bold[white]}%}[Env: %{${fg[green]}%}`basename \"$VIRTUAL_ENV\"`%{${fg_bold[white]}%}]%{${reset_color}%} $RPROMPT
#

# postdeactivate
#
# RPROMPT="$_OLD_RPROMPT"
#