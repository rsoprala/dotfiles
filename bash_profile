# .bash_profile

# Get the aliases and functions

# User specific environment and startup programs

set -o vi
export EDITOR=vim

PATH=$PATH:$HOME/bin

export PATH

alias less='less -R'                          # raw control characters
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
if [ `uname` != "Darwin" ]; then
    alias ls='ls -hF --color=tty'                 # classify files in colour
fi

function parse_git_branch {
  if [ -e `which git 2> /dev/null` ]; then
    BRANCH=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' | tr -d '* ')
    echo -n "$BRANCH"
    if [ "x$BRANCH" != "x" ]; then
      echo -n " [$(git st | sed -e '1d' | wc -l | awk '{print $1}')] "
    fi
  else
    echo ""
  fi
}

# http://twiki.corp.yahoo.com/view/Devel/Yroot
PS1="\e[0;31m\$(parse_git_branch)\e[m["
PS1="$PS1\[\e[36m\]\u\[\e[0m\]"
PS1="$PS1@"
if [ "x$YROOT_NAME" != "x" ]; then
  # Yroot Indicator
  PS1="$PS1\[\e[32;40m\]$YROOT_NAME\[\e[0m\]"
  PS1="$PS1@"
fi
PS1="$PS1\[\e[34;1m\]\h\[\e[0m\]"
PS1="$PS1 \w]"
PS1="$PS1\\n\\$ "
export PS1

alias yr="yroot --local-home"
alias api="yr opsdb_api"
alias ui="yr opsdb_ui"
alias sattach="grabssh; tmux attach-session"
alias screen="echo u wot"
alias fixssh="source $HOME/bin/fixssh"
alias src="cd $(cat ~/.project)"
alias grep="grep --color=always"
alias less="less -r"
alias mktags='ctags -f ./tags  --langmap="php:+.inc" --langmap="php:+.class" -h ".php.inc" -R --totals=yes --tag-relative=yes --PHP-kinds=+cf-v .'

function vimf {
    vim `find . -iname $1* -type f | tr '\r' ' '`
}

# default ot dev yroot
# if [ -x /home/y/bin/yroot -a "x$YROOT_NAME" == "x" ]; then yr dev; fi

# Append to ~/.bash_history instead of overwriting it -- this stops terminals
# from overwriting one another's histories.
[ ! -z $BASH_VERSION ] && shopt -s histappend
# Only load the last 1000 lines from your ~/.bash_history -- if you need an
# older entry, just grep that file.
HISTSIZE=1000
# Don't truncate ~/.bash_history -- keep all your history, ever.
unset HISTFILESIZE
# Add a timestamp to each history entry.
HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S  "
# Don't remember trivial 1- and 2-letter commands.
HISTIGNORE=?:??
# What it says.
HISTCONTROL=ignoredups
# Save each history entry immediately (protects against terminal crashes/
# disconnections, and interleaves commands from multiple terminals in correct
# chronological order).
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

function tcpdump_host {
  sudo tcpdump -i eth0 -A host $* and port 80
}

[ ! -z $BASH_VERSION ] && source ~/dotfiles/git-completion.bash
export NODE_PATH=/home/mhavener/local/lib/jsctags/:$NODE_PATH

if [ -d $(cat ~/.project) ]; then
    cd $(cat ~/.project)
fi
