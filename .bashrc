#
# ~/.bashrc
#

# Source definitions by environments
if [ -f ~/.myconf ]; then
	. ~/.myconf
fi

# User specific aliases and functions

# Alias setting
alias ls='ls -aF --color=auto'
alias ll='ls -lh --color=auto'
alias df='df -h'
alias less='less -R'

alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

alias su='su -'

# Environment variable

COLOR="36"

PS1="[\[\033[${COLOR}m\]\$?\[\033[00m\]|\[\033[${COLOR}m\]\u@\h \[\033[00m\]\w]\n\\$ "

EDITOR=vim
PYTHONDONTWRITEBYTECODE=1

HISTTIMEFORMAT='%F %T '
HISTSIZE=50000
HISTIGNORE=ls:history

export PS1 EDITOR PYTHONDONTWRITEBYTECODE HISTTIMEFORMAT HISTSIZE HISTIGNORE
