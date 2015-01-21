#!/bin/sh
DOTFILES=$(cd $(dirname $0) && pwd)

# submodule update
# ----------------------------------------------------------------------
cd $DOTFILES
git submodule update --init --recursive
cd - > /dev/null

for DOTFILES in .?*
do
    if [ $DOTFILES != '..' ] && [ $DOTFILES != '.git' ] && [ $DOTFILES != '.gitmodules' ]
    then
        ln -Fis "$PWD/$DOTFILES" $HOME
    fi
done