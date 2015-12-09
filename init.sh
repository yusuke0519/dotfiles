# apt-get$B$GI,MW$J$b$N$r%$%s%9%H!<%k(B 
sudo apt-get install git gcc make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev
sudo apt-get install zsh
sudo apt-get install vim-athena  # vim$B$r(B+lua$B$K$9$k(B
sudo apt-get install exuberant-ctags  # vim tagbar$B$r;H$&$?$a(B

# pyenv
git clone git://github.com/yyuu/pyenv.git ~/.pyenv
pyenv install anaconda-2.4.0
pyenv global anaconda-2.4.0

# rbenv
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# submodule$B$rDI2C(B
git submodule init .vim/bundle/neobundle.vim
git submodule update .vim/bundle/neobundle.vim
git submodule init .zsh/zsh-completions
git submodule update .zsh/zsh-completions
git submodule init .zsh/plugins/zaw
git submodule update .zsh/plugins/zaw

# git$B$N%f!<%6$rDI2C(B
git config --global user.email "iwasawa@weblab.t.u-tokyo.ac.jp"
git config --global user.name "Yusuke IWASAWA"

