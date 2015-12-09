# apt-getで必要なものをインストール 
sudo apt-get install git gcc make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev
sudo apt-get install zsh
sudo apt-get install vim-athena  # vimを+luaにする
sudo apt-get install exuberant-ctags  # vim tagbarを使うため

# pyenv
git clone git://github.com/yyuu/pyenv.git ~/.pyenv
pyenv install anaconda-2.4.0
pyenv global anaconda-2.4.0

# rbenv
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# submoduleを追加
git submodule init .vim/bundle/neobundle.vim
git submodule update .vim/bundle/neobundle.vim
git submodule init .zsh/zsh-completions
git submodule update .zsh/zsh-completions
git submodule init .zsh/plugins/zaw
git submodule update .zsh/plugins/zaw

# gitのユーザを追加
git config --global user.email "iwasawa@weblab.t.u-tokyo.ac.jp"
git config --global user.name "Yusuke IWASAWA"

