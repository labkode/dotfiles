#/bin/bash

set -e

# clean previous plugin installations
rm -rf ~/.vim/

# install VIM plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install Plugins
vim +PlugInstall +qall

cp .tmux.conf ~
cp .vimrc ~

os=`uname -s`
echo "System is $os"

if [ "$os" = "Linux" ]; then
  sudo dnf install ripgrep -y
  sudo dnf install nodejs
  node -v
  npm -v
elif [ "$os" = "Darwin" ]; then
  # install brew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew install ripgrep
  brew install node@22
  node -v
  npm -v

  # config alacritty
  # cp ./alacritty.toml ~/
fi

