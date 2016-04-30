#!/bin/bash

cd $HOME
mkdir -p .vim/bundle
cd $HOME/.vim/bundle
git clone git@github.com:Shougo/neobundle.vim.git
cd neobundle.vim
git checkout ver.3.0

