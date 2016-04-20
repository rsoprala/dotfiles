# .bash_profile

# Get the aliases and functions

# User specific environment and startup programs

set -o vi
export EDITOR=vim

PATH=$PATH:$HOME/bin:/usr/bin
PATH=$PATH:/opt/local/bin
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

alias less='less -R'                          # raw control characters
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
if [ `uname` != "Darwin" ]; then
    alias ls='ls -hF --color=tty'                 # classify files in colour
else
    alias vim="/usr/local/bin/vim"
fi


function git_cibug {
  SYS=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' | tr -d '* ' | awk -F_ '{print $1}')
  BUG=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' | tr -d '* ' | awk -F_ '{print $2}')
  MSG="[$SYS $BUG] $@"
  eval "git commit -m '$MSG'"
}

parse_git_branch() {
       git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "



alias sattach="grabssh; tmux attach-session"
alias screen="echo u wot"
alias fixssh="source $HOME/bin/fixssh"
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
HISTSIZE=50000
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
