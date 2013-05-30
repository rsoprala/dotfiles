if [ ! -f $HOME/.bash_profile ]; then ln -s $PWD/bash_profile $HOME/.bash_profile; fi
if [ ! -f $HOME/.gitconfig ]; then ln -s $PWD/gitconfig $HOME/.gitconfig; fi
if [ ! -f $HOME/.screenrc ]; then ln -s $PWD/screenrc $HOME/.screenrc; fi
if [ ! -s $HOME/bin ]; then ln -s $PWD/bin $HOME/bin; fi

