# autojump
alias j="autojump"
[[ -f `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

#for zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

autoload -Uz zmv
alias zmv='noglob zmv -W'

#autoload -U compinit
#compinit

autoload -Uz compinit
compinit -u

#auto cd
setopt auto_cd

#cd履歴 cd -
setopt auto_pushd

# ディレクトリ名の補完で末尾の / を自動的に付加
setopt auto_param_slash

#入力したコマンド名が間違っている場合には修正
setopt correct


#リスト1 先方予測機能を有効に設定 - この機能を使いこなることができるか?
autoload predict-on
predict-on

zle -N predict-on
zle -N predict-off
bindkey '^xp' predict-on    # C-xp 予測オン
bindkey '^x^p' predict-off  # C-xC-p 予測オフ

# autoload history-search-end
# zle -N history-beginning-search-backward-end history-search-end
# zle -N history-beginning-search-forward-end history-search-end


# zstyle ':completion:*' completer  _prefix
#zstyle ':completion:*' completer _expand _complete _match _prefix

setopt auto_list               # 補完候補を一覧で表示(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示(d)

#入力途中の履歴補完を有効化する
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

#入力途中の履歴補完
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# auto-fu.zsh
if [ -f ~/.zsh/auto-fu.zsh ]; then

source /Volumes/SHARED/projects/github/auto-fu.zsh/auto-fu.zsh
function zle-line-init () {
auto-fu-init
}
zle -N zle-line-init
fi



export LANG=ja_JP.UTF-8


####PATH 設定

# Android
# ANDROID_SDK_HOME="/Applications/adt-bundle-mac/sdk"
# export PATH=$ANDROID_SDK_HOME/platform-tools:$ANDROID_SDK_HOME/tools:$PATH

# AIR SDK
export PATH=/Volumes/SHARED/flex_sdk/4.8.0_air3.6/bin:$PATH

# homebrew 
export PATH=/usr/local/bin:$PATH

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH


#ruby rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# pyenv
export PATH="$HOME/.pyenv/shims:$PATH"



#source ~/.local/bin/bashmarks.sh
alias la="ls -a"

#sudo
alias npm="sudo npm"

# gulp
#alias gulp="gulp --require coffee-script/register"

# bundle
alias be="bundle exec"
# set terminal title including current directory
#
case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac


## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

# 通知センター
# Bash - Mavericksでターミナルからパイプで通知だけするワンライナー - Qiita [キータ]
# http://goo.gl/mnPjRv
alias pong='perl -nle '\''print "display notification \"$_\" with title \"Terminal\""'\'' | osascript'

# Macで時間のかかるコマンドが終わったら、自動で通知するzsh設定 - Qiita [キータ]
# http://goo.gl/VB5uw4
source /Volumes/SHARED/projects/github/zsh-notify/notify.plugin.zsh
export SYS_NOTIFIER="/usr/local/bin/terminal-notifier"
export NOTIFY_COMMAND_COMPLETE_TIMEOUT=10

# Vagrant for Parallels
export VAGRANT_DEFAULT_PROVIDER=parallels

# pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# gvm
source $HOME/.gvm/scripts/gvm
