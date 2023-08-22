[[ -f $HOME/.alias ]] && source $HOME/.alias
[[ -f $HOME/.exports ]] && source $HOME/.exports
[[ -f $HOME/.alias.local ]] && source $HOME/.alias.local
[[ -f $HOME/.exports.local ]] && source $HOME/.exports.local

command_exists () {
    type "$1" &> /dev/null ;
}

# Zsh Options
setopt autocd
setopt hist_ignore_space
setopt hist_ignore_dups

# Up/down matches search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

setopt extended_glob
zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit

# Keyboard Shorcuts {{{
export ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
autoload edit-command-line
bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search
bindkey -M vicmd v edit-command-line

# }}}

# Prompt and Settings {{{
autoload -U promptinit; promptinit
if [ "$(uname)" = "Darwin" ]; then
  fpath+=("$(brew --prefix)/share/zsh/site-functions")
fi
prompt pure
zstyle :prompt:pure:git:stash show yes

# }}}

# Antidote
if [[ -f /usr/share/zsh-antidote/antidote.zsh ]]; then
    source /usr/share/zsh-antidote/antidote.zsh
else
    source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
fi
antidote load

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(luarocks path --bin)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# vim: set nospell foldmethod=marker foldlevel=0:
