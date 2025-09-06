#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

alias ls='ls --color=auto'
alias grep='grep --color=auto'
export PS1="\[\e[1;100m\]-\$?--[\t]\[\e[m\] \[\e[1;32m\]\w\[\e[m\]\n\[\e[1;31m\](\$(git branch 2>/dev/null | grep '^*' | colrm 1 2))\[\e[m\] > "

export LC_ALL=ru_RU.UTF-8
export LANG=ru_RU.UTF-8


# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=10000000000
export HISTFILESIZE=1000000000
export HISTCONTROL=ignoreboth:erasedups # don't show repeating commands
export HISTTIMEFORMAT='%d.%m.%y[%H:%M] ' # history format
export HISTIGNORE='ls:ps:history:tree*' # don't show ls ps history tree module
PROMPT_COMMAND='history -a' 


if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/wt/gcc-linaro-5.4.1-2017.05-x86_64_arm-linux-gnueabihf/bin

#auto complete

#make auto complete (need make)
complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' ?akefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make

#programs options auto complete (need bash-completion)
if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi
