pip3 install virtualenvwrapper
# Sometimes this on sierra may fail so confirm `brew install python` runs and try `sudo pip install --ignore-installed virtualenvwrapper`
# .zshrc contains WORKON_HOME and PROJECT_HOME

export VIRTUALENVWRAPPER_PYTHON=`which python3`
source /usr/local/bin/virtualenvwrapper.sh

# postactivate
#
# PS1="$_OLD_VIRTUAL_PS1"
# PROMPT="$PROMPT%{${fg_bold[yellow]}%}pyEnv:%{${fg_bold[white]}%}(%{${fg[green]}%}`basename \"$VIRTUAL_ENV\"`%{${fg_bold[white]}%}) %{${reset_color}%}"


# postmkvirtualenv
#
# pip install pep8
# pip install pycodestyle
# pip install pip_autoremove
# pip install pip_chill
