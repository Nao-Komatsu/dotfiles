#
# ~/.bashrc
#

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# Alias setting
alias ls='ls -aF --color=auto'
alias ll='ls -lh --color=auto'
alias df='df -h'

alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

alias su='su -'

# Environment variable

PS1="[\[\033[36m\]\u@\h \[\033[00m\]\W]\\$ "

HISTTIMEFORMAT='%F %T '
HISTSIZE=10000
HISTIGNORE=ls:history

export PS1 HISTTIMEFORMAT HISTSIZE HISTIGNORE
