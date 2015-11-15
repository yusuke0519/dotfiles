# 外部設定ファイルの読み込み
# 1. 環境変数
source ~/.zsh/.zsh.environment
# 2. alias
source ~/.zsh/.zsh.alias
# 3. Python
source ~/.zsh/.zsh.python
# 4. tmuxinatorを導入する時に必要なもの
source ~/.tmuxinator/tmuxinator.zsh
# 5. Prompt
source ~/.zsh/.zsh.prompt

########### 補完関係#############
#補完機能を使用する
# 補完機能
fpath=(~/.zsh/zsh-completions/src $fpath) 
autoload -U compinit
compinit -u

zstyle ':completion::complete:*' use-cache true
#zstyle ':completion:*:default' menu select true
zstyle ':completion:*:default' menu select=1

#大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#補完でカラーを使用する
autoload colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

#kill の候補にも色付き表示
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'

#zsh内蔵エディタを使う
autoload -U zcalc
autoload zed

# vimライクな操作設定
bindkey -v

########### 履歴関係#############
# 履歴保存場所
HISTFILE=$HOME/.zsh_history
# メモリに保存される履歴数
HISTSIZE=10000
# 履歴ファイルに保存される履歴数
SAVEHIST=1000000
# ???
PATH=${PATH}:~/bin
#直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups
#ヒストリの一覧を読みやすい形に変更
HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] "
# 全履歴を一覧表示する
function history-all { history -E 1 }
# 履歴の選択(Zawの設定)
function mkcd(){mkdir -p $1 && cd $1}
<<<<<<< HEAD
source $HOME/.zsh/plugins/zaw/zaw.zsh
=======
<<<<<<< HEAD
source ~/zsh_plugins/zaw/zaw.zsh
=======
source $HOME/.zsh/plugins/zaw/zaw.zsh
>>>>>>> 741156d1c8302484230e524e425fac0a175ceea4
>>>>>>> 4c3b8c9fbd57f490e9e81369b683e9e63547da13
bindkey '^h' zaw-history
bindkey '^g' zaw-git-branches
bindkey '^k' zaw-cdr
# 入力途中の履歴補完を有効化する
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
# 入力途中の履歴検索
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward
# 履歴を共有
setopt share_history
# インクリメンタルからの検索
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
#コマンド履歴検索設定
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups
# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify
# 余分な空白は詰めて記録
setopt hist_reduce_blanks  
# 古いコマンドと同じものは無視 
setopt hist_save_no_dups
# historyコマンドは履歴に登録しない
setopt hist_no_store
# 補完時にヒストリを自動的に展開         
setopt hist_expand
# 履歴をインクリメンタルに追加
setopt inc_append_history


########### プロンプト関係#############
#補完リストが多いときに尋ねない
LISTMAX=1000

#"|,:"を単語の一部とみなさない
WORDCHARS="$WORDCHARS|:"

########## その他設定 ##########
#ヒストリの保存
HISTFILE=~/.zhistory
HISTSIZE=100000
SAVEHIST=100000

#色を使う
setopt prompt_subst
#ビープ音を消す
setopt nobeep
#補完候補一覧でファイルの種別をマーク表示
setopt list_types
#補完候補を一覧表示
setopt auto_list
#TABで順に補完候補を切り替える
setopt auto_menu
#補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1


# cdコマンド実行後、lsを実行する
function cd() {
  builtin cd $@ && ls;
}
<<<<<<< HEAD
=======
<<<<<<< HEAD

#MacTexの関連
eval `/usr/libexec/path_helper -s`

#Python関連読み込み
source ~/.zsh.python

########### Git関連 #############
# vcs_infoロード    
autoload -Uz vcs_info    
# PROMPT変数内で変数参照する    
setopt prompt_subst    

# vcsの表示    
zstyle ':vcs_info:*' formats '%s][* %F{green}%b%f'    
zstyle ':vcs_info:*' actionformats '%s][* %F{green}%b%f(%F{red}%a%f)'    
# プロンプト表示直前にvcs_info呼び出し    
precmd() { vcs_info }    
# プロンプト表示    
PROMPT='[${vcs_info_msg_0_}]:%~/%f '    
=======
>>>>>>> 741156d1c8302484230e524e425fac0a175ceea4
>>>>>>> 4c3b8c9fbd57f490e9e81369b683e9e63547da13
