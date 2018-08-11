# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.bash_profile ]; then
	. ~/.bash_profile
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

alias ls='ls -aF --color=auto'
alias ll='ls -lh --color=auto'
alias df='df -h'

alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

alias su='su -'
