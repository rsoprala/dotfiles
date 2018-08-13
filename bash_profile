# .bash_profile

# Get the aliases and functions

# User specific environment and startup programs

set -o vi
export EDITOR=vim

PATH=$PATH:$HOME/bin:/usr/bin:/opt/local/bin:/usr/local/bin
export PATH=/usr/local/share/python:$PATH

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
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\](\t) $ "

#export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
alias jvisualvm="$JAVA_HOME/bin/jvisualvm"

alias sattach="grabssh; tmux attach-session"
alias screen="echo u wot"
alias fixssh="source $HOME/bin/fixssh"
alias grep="grep --color=always"
alias less="less -r"
alias mktags='ctags -f ./tags  --langmap="php:+.inc" --langmap="php:+.class" -h ".php.inc" -R --totals=yes --tag-relative=yes --PHP-kinds=+cf-v .'

#------custom alias --------
alias cli="ncs_cli -C -u admin"
#==========================
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

#source ~/ncs/current/ncsrc
alias ssh-168='ssh ncs@10.88.236.168'
#jenkins 2.7-ncs server connects to qa ASRs on virl
alias ssh-210='ssh ncs@10.88.236.210'
#jenkins 2.8-ncs server connects to qa ASRs on virl
alias ssh-138='ssh ncs@10.88.236.138'
# dev env
alias ssh-220='ssh ncs@10.88.236.220'
# jenkins instance
alias ssh-205='ssh ncs@10.88.236.205'
alias ssh-250='ssh ncs@10.88.236.250'
# ncs 4.4.1 instance for testing
alias ssh-211='ssh ncs@10.88.236.211'
# ncs 4.5 instance for testing
alias ssh-219='ssh ncs@10.88.236.219'
# ncs perf instnace to connect to virl ASRs
alias ssh-173='ssh pronghorn@10.88.236.173'

#alias mt-lab='sshfs cisco@198.18.134.4:ncs-run /Users/nsoprala/nso-guide/nso-advanced/lab'

alias mount-220='sshfs -oauto_cache,volname=lab-220,reconnect,workaround=all ncs@10.88.236.220: /Users/nsoprala/workspace/lab-220'
alias umount-220='umount -f /Users/nsoprala/workspace/lab-220'
alias mount-173='sshfs -oauto_cache,volname=lab-173,reconnect,workaround=all pronghorn@10.88.236.173: /Users/nsoprala/workspace/lab-173'
alias umount-173='umount -f /Users/nsoprala/workspace/lab-173'
alias mount-219='sshfs -oauto_cache,volname=lab-219,reconnect,workaround=all ncs@10.88.236.219: /Users/nsoprala/workspace/lab-219'
alias umount-219='umount -f /Users/nsoprala/workspace/lab-219'
alias mount-205='sshfs -oauto_cache,volname=lab-205,reconnect,workaround=all ncs@10.88.236.205: /Users/nsoprala/workspace/lab-205'
alias umount-205='umount -f /Users/nsoprala/workspace/lab-205'


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
