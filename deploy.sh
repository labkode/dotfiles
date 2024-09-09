#!/bin/sh

cp .vimrc ~/.vimrc
cp .tmux.conf ~/tmux.conf


git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
git clone https://github.com/wsdjeg/vim-fetch ~/.vim/pack/plugins/start/vim-fetch

