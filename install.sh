git submodule init
git submodule update
if [ $PWD != $HOME/dotfiles ]; then echo "Lazy matt only made this work if its checked out at $HOME/dotfiles"; fi
if [ ! -f $HOME/.bash_profile ]; then ln -s $PWD/bash_profile $HOME/.bash_profile; fi
if [ ! -f $HOME/.zprofile ]; then ln -s $PWD/bash_profile $HOME/.zprofile; fi
if [ ! -f $HOME/.gitconfig ]; then ln -s $PWD/gitconfig $HOME/.gitconfig; fi
if [ ! -f $HOME/.screenrc ]; then ln -s $PWD/screenrc $HOME/.screenrc; fi
if [ ! -d $HOME/.vim ]; then ln -s $PWD/vim $HOME/.vim; fi
if [ ! -f $HOME/.vimrc ]; then ln -s $PWD/vimrc $HOME/.vimrc; fi
if [ ! -f $HOME/.tmux.conf ]; then ln -s $PWD/tmux.conf $HOME/.tmux.conf; fi
if [ ! -d $HOME/.irssi ]; then ln -s $PWD/irssi $HOME/.irssi; fi
if [ ! -d $HOME/.ssh ]; then mkdir $HOME/.ssh; fi
if [ ! -f $HOME/.ssh/config ]; then ln -s $PWD/ssh_config $HOME/.ssh/config; fi
if [ ! -d $HOME/.subversion ]; then mkdir $HOME/.subversion; fi
if [ ! -f $HOME/.subversion/config ]; then ln -s $PWD/subversion_config $HOME/.subversion/config; fi
if [ ! -f $HOME/.gdbinit ]; then ln -s $PWD/gdbinit $HOME/.gdbinit; fi

if [ ! -s $HOME/bin ]; then ln -s $PWD/bin $HOME/bin; fi

echo "Dont forget to run :NeoBundleInstall in vim"
