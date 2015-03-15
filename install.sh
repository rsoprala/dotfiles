git submodule init
git submodule update
if [ $PWD != $HOME/dotfiles ]; then echo "Lazy matt only made this work if its checked out at $HOME/dotfiles"; fi
if [ ! -d $HOME/.vim ]; then ln -s $PWD/vim $HOME/.vim; fi
if [ ! -f $HOME/.vimrc ]; then ln -s $PWD/vimrc $HOME/.vimrc; fi
if [ ! -f $HOME/.tmux.conf ]; then ln -s $PWD/tmux.conf $HOME/.tmux.conf; fi

if [ ! -s $HOME/bin ]; then ln -s $PWD/bin $HOME/bin; fi

echo "Dont forget to run :NeoBundleInstall in vim"
