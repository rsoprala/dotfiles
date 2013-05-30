# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

set -o vi
export EDITOR=vim

PATH=$PATH:$HOME/bin

export PATH

alias less='less -R'                          # raw control characters
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
alias ls='ls -hF --color=tty'                 # classify files in colour

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)\r/ \[\1\]/'
}

#export PS1="\$(parse_git_branch) \[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ "

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
alias api="yr opsdb_api"
alias ui="yr opsdb_ui"
alias sattach="grabssh; screen -d -R"
alias fixssh="source $HOME/bin/fixssh"


