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
pip3 --no-cache-dir install autopep8
pip3 --no-cache-dir install pip-autoremove
pip3 --no-cache-dir install pycodestyle

# Global as well
pip3 --no-cache-dir install -e git://github.com/NdagiStanley/pip-chill.git#egg=pip-chill
