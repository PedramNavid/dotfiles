# Plugin {{{
source <(antibody init)

antibody bundle robbyrussell/oh-my-zsh
antibody bundle ohmyzsh/ohmyzsh path:plugins/git
antibody bundle ohmyzsh/ohmyzsh path:plugins/common-aliases
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle dracula/zsh

# }}}

# Keyboard Shorcuts {{{

bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search

# }}}

# Prompt and Settings {{{

eval "$(starship init zsh)"

# }}}

# Environment  {{{

export EDITOR=nvim
export FZF_DEFAULT_COMMAND='rg --files'

alias cdp="cd $HOME/projects"
alias cdd="cd $HOME/dotfiles"
alias vim="nvim"

[[ -f ~/.zsh/alias.local ]] && source (~/.zsh/alias.local)
[[ -f ~/.zsh/exports.local ]] && source (~/.zsh/exports.local)

# }}}

# vim: set nospell foldmethod=marker foldlevel=0: