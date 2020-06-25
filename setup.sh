#"!/bin/sh

# [1] Vim plugins
git submodule init .vim/bundle/neobundle.vim
git submodule update .vim/bundle/neobundle.vim

# [2] ZSH plugins
git submodule init .zsh/zsh-completions
git submodule update .zsh/zsh-completions
git submodule init .zsh/plugins/zaw
git submodule update .zsh/plugins/zaw

# [3] Git Setting
git config --global user.email "iwasawa@weblab.t.u-tokyo.ac.jp"
git config --global user.name "Yusuke IWASAWA"

# [4] link
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.zsh ~/.zsh
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
