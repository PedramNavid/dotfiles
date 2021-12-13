# Plugin {{{
source <(antibody init)

antibody bundle robbyrussell/oh-my-zsh
antibody bundle ohmyzsh/ohmyzsh path:plugins/git
antibody bundle ohmyzsh/ohmyzsh path:plugins/common-aliases
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle dracula/zsh

# }}}

# Prompt and Settings {{{

eval "$(starship init zsh)"
bindkey -v

# }}}

# Environment  {{{

export EDITOR=nvim

alias cdd="cd $HOME/dotfiles"
alias vim="nvim"

[[ -f ~/.zsh/alias.local ]] && source (~/.zsh/alias.local)
[[ -f ~/.zsh/exports.local ]] && source (~/.zsh/exports.local)

# }}}

# vim: set nospell foldmethod=marker foldlevel=0:
