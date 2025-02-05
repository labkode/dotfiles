#/bin/bash

set -e

os=`uname -s`
echo "System is $os"


# clean previous plugin installations
rm -rf ~/.vim/
rm -rf ~/.config/nvim/ && mkdir -p ~/.config/nvim/

if [ "$os" = "Linux" ]; then
  sudo dnf install ripgrep -y
  sudo dnf install nodejs
  sudo yum install -y neovim
  node -v
  npm -v
elif [ "$os" = "Darwin" ]; then
  # install brew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew install ripgrep
  brew install node@22
  brew install neovim
  brew install neovide
  node -v
  npm -v

  # config alacritty
  cp ./.alacritty.toml ~/.alacritty.toml
fi


# install VIM plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install NEOVIM plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install Plugins
vim +PlugInstall +qall
vim +PlugUpdate +qall

nvim +PlugInstall +qall
nvim +PlugUpdate +qall


cp .tmux.conf ~
cp .vimrc ~
cp .vimrc ~/.config/nvim/init.vim
