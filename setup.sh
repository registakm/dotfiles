#!/bin/sh
DOTFILES=$(cd $(dirname $0) && pwd)

FILELIST = '
.vim
.gitignore
.gitconfig
.vimrc
.zshrc
.zshenv
.zsh.d
.config
'

# create local settig file
cd ~
mkdir bin
touch ~/.vimrc.local
touch ~/.gitconfig.local

# stash old file
if [ ! -e ~/old_files ]; then
    mkdir ~/old_files
    for FILE in ${FILELIST};
    do
        mv ~/${FILE} ~/old_files/
    done
fi

# create symboliclink
for FILE in ${FILELIST};
do
    rm -rf ~/${FILE}
    ln -Fis ~/$DOTFILES/${FILE} ~/${FILE}
done


# submodule update
# ----------------------------------------------------------------------
cd $DOTFILES
git submodule update --init --recursive
cd - > /dev/null

# NeoBundleinstall 
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
vim +NeoBundleInstall! +qall


