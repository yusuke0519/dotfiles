alias toD='cd ~/Dropbox/Research/Analysis/data'
alias Kuniya='cd ~/Dropbox/Research/Analysis/data/Kuniya/ROUTE1/Analysis'
alias Hoshi='cd ~/Dropbox/Research/Analysis/data/Hoshi/ROUTE1/Analysis'
alias Ikeda='cd ~/Dropbox/Research/Analysis/data/Ikeda/ROUTE1/Analysis'
alias Oshida='cd ~/Dropbox/Research/Analysis/data/Oshida/ROUTE1/Analysis'
alias Goto='cd ~/Dropbox/Research/Analysis/data/Goto/ROUTE1/Analysis'
alias Takami='cd ~/Dropbox/Research/Analysis/data/Takami/ROUTE1/Analysis'
alias rd4='ssh iwasawa@133.11.90.86'

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
export MANPATH=$MANPATH:/opt/local/man:/usr/local/share/man


alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

alias ll='ls -a -F'

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

#予測入力させる
#autoload predict-on
#zle -N predict-on
#zle -N predict-off
#bindkey '^X^P' predict-on
#bindkey '^O' predict-off
#zstyle ':predict' verbose true

#入力途中の履歴補完を有効化する
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

#入力途中の履歴補完
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

#インクリメンタルサーチの設定
#bindkey "^R" history-incremental-search-backward
#bindkey "^S" history-incremental-search-forward

#履歴のインクリメンタル検索でワイルドカード利用可能
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

#プロンプト関係
PROMPT="[%n@%m %~]%(!.#.$) "
#PROMPT2="%n %_%%"
#SPROMPT="%r is correct? [n,y,a,e]: "
#RPROMPT="[%l/zsh]"

#ヒストリーサイズ設定
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
PATH=${PATH}:~/bin

#ヒストリの一覧を読みやすい形に変更
HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] "

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
#直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups
#TABで順に補完候補を切り替える
setopt auto_menu
#補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1



### Prompt ###
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


#Python関連　
#
PYTHONPATH=~/Wheelchair/Python/lib/:$PYTHONPATH
export PYTHONPATH


#SSH 関連
alias ssh-ylab='ssh iwasawa@YLabMacPro.1284357760.members.btmm.icloud.com'

#TMUX関連
alias tma='tmux attach'
alias tmd='tmux detach'

