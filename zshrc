# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/nsoprala/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="geoffgarside"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  vi-mode
  tmux
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

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

alias cli="ncs_cli -C -u admin"

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
alias jvisualvm="$JAVA_HOME/bin/jvisualvm"

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
