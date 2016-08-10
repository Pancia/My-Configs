#INSTALLS
#.submodules
git pull && git submodule init &&
    git pull --recurse-submodules &&
    git submodule update --recursive
#.brew
hash brew || (ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)")
brew update
brew bundle -v
pip3 install neovim-remote
pip install --upgrade neovim

#GIT
#.config
ln -f gitconfig ~/.gitconfig
read -p 'git config user.email please: ' git_config_user_email
git config --global user.email "$git_config_user_email"
#.hooks
for i in $(ls ./git/hooks/*.tmpl); do
    echo "$i, $(basename $i .tmpl)"
    ln -f $i /usr/local/share/git-core/templates/hooks/$(basename $i .tmpl)
done

#FONTS
[[ -e fonts ]] || (git clone https://github.com/powerline/fonts.git && ./fonts/install.sh)

#*RC INSTALLS
cp .vimrc        ~/.vimrc
cp .vimperatorrc ~/.vimperatorrc
cp .agignore     ~/.agignore
cp .zshrc        ~/.zshrc
cp .zshenv       ~/.zshenv

#VIM
mkdir -p ~/.vim/undo
#.ftplugin
mkdir -p ~/.vim/ftplugin
for i in $(ls vim/ftplugin); do
    ln -f vim/ftplugin/$i ~/.vim/ftplugin/$i
done

#NVIM
mkdir -p ~/.config/nvim/ftplugin
for i in $(ls nvim); do
    ln -f nvim/$i ~/.config/nvim/$i
done
for i in $(ls nvim-ftplugin); do
    ln -f nvim-ftplugin/$i ~/.config/nvim/ftplugin/$i
done

#BIN
for i in $(ls bin); do
    ln -f bin/$i /usr/local/bin/$i
done

#ENGAGE
exec zsh
