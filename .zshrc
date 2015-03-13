#alias情報の読み取り
source ~/.zsh.alias

export EDITOR=vim
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/git/bin
export PATH=$PATH:/local/bin
export PATH=$PATH:$HOME/dotfiles/bin
export PATH=$PATH:/sbin
export PATH=$PATH:/Developer/android-sdk/tools
export PATH=$PATH:/Applications/MATLAB_R2011b.app/bin
export PATH=$PATH:~/Dropbox/rubyModule
### android-sdk
export PATH="/Users/iwasawayuusuke/Downloads/adt-bundle-mac-x86_64-20130917/sdk/platform-tools:$PATH"
export PATH=$PATH:~/lib/pylearn2/pylearn2/scripts/

## Jobman
export PATH=$PATH:~/lib/Jobman/bin

## Handmade Python Scripts
export PATH=$PATH:~/GoogleDrive/Wheelchair2012Result/lib/

## Path for GPU
export PATH=$PATH:/Developer/NVIDIA/CUDA-6.5/bin/
export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-6.5/lib:$DYLD_LIBRARY_PATH
## Path for Manuals
export MANPATH=$MANPATH:/opt/local/man:/usr/local/share/man

# git用の設定
fpath=(~/.zsh/completion $fpath)

autoload -U compinit
compinit -u

########### 補完関係#############
#補完機能を使用する
autoload -U compinit promptinit
compinit
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
source ~/zsh_plugins/zaw/zaw.zsh
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
PROMPT="[%n@%m %~]%(!.#.$) "

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

# プロンプトに色を付ける
autoload -U colors; colors
# 一般ユーザ時
tmp_prompt="%{${fg[cyan]}%}%n%# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt="%{${fg[green]}%}[%~]%{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

# rootユーザ時(太字にし、アンダーバーをつける)
if [ ${UID} -eq 0 ]; then
  tmp_prompt="%B%U${tmp_prompt}%u%b"
  tmp_prompt2="%B%U${tmp_prompt2}%u%b"
  tmp_rprompt="%B%U${tmp_rprompt}%u%b"
  tmp_sprompt="%B%U${tmp_sprompt}%u%b"
fi

PROMPT=$tmp_prompt    # 通常のプロンプト
PROMPT2=$tmp_prompt2  # セカンダリのプロンプト(コマンドが2行以上の時に表示される)
RPROMPT=$tmp_rprompt  # 右側のプロンプト
SPROMPT=$tmp_sprompt  # スペル訂正用プロンプト
# SSHログイン時のプロンプト
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"


### Title (user@hostname) ###
case "${TERM}" in
kterm*|xterm*|)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}\007"
  }
  ;;
esac

### Ls Color ###
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}



# cdコマンド実行後、lsを実行する
function cd() {
  builtin cd $@ && ls;
}

#MacTexの関連
eval `/usr/libexec/path_helper -s`

#Python関連読み込み
source ~/.zsh.python

