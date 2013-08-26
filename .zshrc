export EDITOR=vim
export LANG=ja_JP.UTF-8
export KCODE=u
export AUTOFEATURE=true

bindkey -v

setopt no_beep
setopt auto_cd
setopt auto_pushd
setopt correct
setopt magic_equal_subst
setopt prompt_subst
setopt notify
setopt equals

autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
zstyle :compinstall filename '/Users/eternie/.zshrc'
# 補完の際大文字・小文字の区別をしない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

setopt extended_glob
unsetopt caseglob
# マッチしたコマンドのヒストリ表示 (Ctrl-P, Ctrl-N)
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# End of lines added by compinstall
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

### Prompt ###
# プロンプトに色を付ける
autoload -U colors; colors

# 一般ユーザ時
tmp_prompt="%{${fg[cyan]}%}%m[%~]%# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt="%{${fg[green]}%}[%T]%{${reset_color}%}"
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

### Title (user@hostname) ###
case "${TERM}" in
kterm*|xterm*|)
precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}\007"
}
;;  
esac

alias ll='ls -l'
alias nave=~/.settings/nave/nave.sh
export PATH=/usr/local/bin:/usr/local/sbin:$(echo $PATH | sed 's!/usr/local/bin:!!' | sed 's!/usr/local/sbin:!!')

