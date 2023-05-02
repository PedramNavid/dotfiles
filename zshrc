[[ -f $HOME/.alias ]] && source $HOME/.alias
[[ -f $HOME/.exports ]] && source $HOME/.exports
[[ -f $HOME/alias.local ]] && source $HOME/alias.local
[[ -f $HOME/exports.local ]] && source $HOME/exports.local

command_exists () {
    type "$1" &> /dev/null ;
}

# Zsh Options
setopt extended_glob
zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/pedram/.zshrc'
autoload -Uz compinit
compinit

# Keyboard Shorcuts {{{
autoload edit-command-line
bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search
bindkey -M vicmd v edit-command-line

# }}}

# Prompt and Settings {{{
autoload -U promptinit; promptinit
prompt pure
zstyle :prompt:pure:git:stash show yes

# }}}


# Antidote
if [[ -f /usr/share/zsh-antidote/antidote.zsh ]]; then
    source /usr/share/zsh-antidote/antidote.zsh
    antidote load
fi

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(luarocks path --bin)"

# vim: set nospell foldmethod=marker foldlevel=0:

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/pedram/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/pedram/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/pedram/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/pedram/google-cloud-sdk/completion.zsh.inc'; fi

# The following lines were added by compinstall

# End of lines added by compinstall
