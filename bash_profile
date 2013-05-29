# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

set -o vi

PATH=$PATH:$HOME/bin

export PATH

# http://twiki.corp.yahoo.com/view/Devel/Yroot
PS1="["
PS1="$PS1\[\e[36m\]\u\[\e[0m\]"
PS1="$PS1@"
if [ "x$YROOT_NAME" != "x" ]; then
  # Yroot Indicator
  PS1="$PS1\[\e[32;40m\]$YROOT_NAME\[\e[0m\]"
  PS1="$PS1@"
fi
PS1="$PS1\[\e[34;1m\]\h\[\e[0m\]"
PS1="$PS1 \w]"
PS1="$PS1\\$ "

alias yr="yroot --local-home"
