# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Check for an interactive session
[ -z "$PS1" ] && return
alias vi='vim --noplugin'
alias l='ls -lhta -G'
alias ls='ls -G'
alias ll='ls -lht -G'
alias grep='grep --color'
alias cp='cp -i'
alias free='top -l 1 | head -n 10 | grep PhysMem'

set show-all-if-ambiguous on

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
export EDITOR="vim"
export VISUAL="vim"
export PYTHONIOENCODING=UTF-8

PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[0;32m\] '

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
source ~/.git-completion.bash
export PATH=/usr/local/share/python:$PATH
