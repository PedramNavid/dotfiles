# Plugin {{{
source <(antibody init)
antibody bundle djui/alias-tips
antibody bundle robbyrussell/oh-my-zsh
antibody bundle ohmyzsh/ohmyzsh path:plugins/common-aliases
antibody bundle ohmyzsh/ohmyzsh path:plugins/git
antibody bundle ohmyzsh/ohmyzsh path:plugins/kubectl
antibody bundle ohmyzsh/ohmyzsh path:plugins/systemd
antibody bundle ohmyzsh/ohmyzsh path:plugins/ubuntu
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-completions
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
export PATH=$PATH:$HOME/bin:$HOME/repos/lua-language-server/bin:$HOME/go/bin:$HOME/.local/bin

alias cdp="cd $HOME/projects"
alias cdd="cd $HOME/dotfiles"
alias vim="nvim"
alias swaprm="rm -rf ~/.local/share/nvim/swap"

[[ -f $HOME/dotfiles/alias.local ]] && source $HOME/dotfiles/alias.local
[[ -f $HOME/dotfiles/exports.local ]] && source $HOME/dotfiles/exports.local

# }}}


alias luamake=/home/pedram/repos/lua-language-server/3rd/luamake/luamake
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
autoload -U +X compinit && compinit

# vim: set nospell foldmethod=marker foldlevel=0:
