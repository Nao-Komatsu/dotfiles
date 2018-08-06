# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PS1="[\[\033[36m\]\u@\h \[\033[00m\]\W]\\$ "

HISTTIMEFORMAT='%F %T '
HISTSIZE=10000
HISTIGNORE=ls:history

export PS1 HISTTIMEFORMAT HISTSIZE
