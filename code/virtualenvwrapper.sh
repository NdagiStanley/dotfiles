pip3 install virtualenvwrapper
# Sometimes this on sierra may fail so confirm `brew install python` runs and try `sudo pip install --ignore-installed virtualenvwrapper`
# .zshrc contains WORKON_HOME and PROJECT_HOME

export VIRTUALENVWRAPPER_PYTHON=`which python3`
source /usr/local/bin/virtualenvwrapper.sh

# postactivate
# (Uncomment the lines below)
# NEWLINE='
# 👉 '

# PS1="$_OLD_VIRTUAL_PS1"
# local ret_status="%(?:%{$fg_bold[green]%}$RAFIKI_GOOD :%{$fg_bold[red]%}$RAFIKI_BAD )"
# PROMPT='${ret_status} %{$fg[cyan]%}% $USER@%m%{$reset_color%} %~ $(git_prompt_info)'


# PROMPT="$PROMPT%{${fg_bold[yellow]}%}pyEnv:%{${fg_bold[white]}%}(%{${fg[green]}%}`basename \"$VIRTUAL_ENV\"`%{${fg_bold[white]}%}) %{${reset_color}%} $NEWLINE "
# pip-chill

# (Uncomment till here)


# postmkvirtualenv
# (Uncomment the lines below)
# pip3 --no-cache-dir install autopep8
# pip3 --no-cache-dir install flake8
# pip3 --no-cache-dir install pip-autoremove
# pip3 --no-cache-dir install pip-chill

# (Uncomment till here)


# Global as well
pip3 --no-cache-dir install pydocstyle
pip3 --no-cache-dir install bpython
pip3 --no-cache-dir install ipdb
pip3 --no-cache-dir install pip-chill
pip2 --no-cache-dir install pip-chill
