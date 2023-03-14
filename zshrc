[[ -f $HOME/.alias ]] && source $HOME/.alias
[[ -f $HOME/.exports ]] && source $HOME/.exports
[[ -f $HOME/alias.local ]] && source $HOME/alias.local
[[ -f $HOME/exports.local ]] && source $HOME/exports.local
[[ -f $HOME/exports.local ]] && source $HOME/exports.local

# Antidote {{{
autoload -U +X compinit && compinit
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load
autoload -Uz promptinit && promptinit && prompt pure
# }}}

# Keyboard Shorcuts {{{
autoload edit-command-line
bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search
bindkey -M vicmd v edit-command-line

# }}}

# Prompt and Settings {{{

# eval "$(starship init zsh)"
# }}}


eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(luarocks path --bin)"

# vim: set nospell foldmethod=marker foldlevel=0:

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/pedram/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/pedram/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/pedram/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/pedram/google-cloud-sdk/completion.zsh.inc'; fi
