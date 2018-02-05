# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PS1="[\[\033[36m\]\u@\h \[\033[00m\]\W]\\$ "
PATH=$PATH:$HOME/.local/bin:$HOME/bin

HISTTIMEFORMAT='%F %T '
HISTSIZE=10000

export PS1 HISTTIMEFORMAT HISTSIZE PATH
