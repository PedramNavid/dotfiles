# Plugin {{{
source <(antibody init)
antibody bundle djui/alias-tips
antibody bundle robbyrussell/oh-my-zsh
antibody bundle ohmyzsh/ohmyzsh path:plugins/common-aliases
antibody bundle ohmyzsh/ohmyzsh path:plugins/docker
antibody bundle ohmyzsh/ohmyzsh path:plugins/git
antibody bundle ohmyzsh/ohmyzsh path:plugins/kubectl
antibody bundle ohmyzsh/ohmyzsh path:plugins/rust
antibody bundle ohmyzsh/ohmyzsh path:plugins/systemd
antibody bundle ohmyzsh/ohmyzsh path:plugins/ubuntu
antibody bundle ohmyzsh/ohmyzsh path:plugins/archlinux
antibody bundle ohmyzsh/ohmyzsh path:plugins/pip
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-completions
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle dracula/zsh

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

eval "$(starship init zsh)"

# }}}

# Environment  {{{

export EDITOR=nvim
export FZF_DEFAULT_COMMAND='rg --files'
export PATH=$PATH:$HOME/bin:$HOME/repos/lua-language-server/bin:$HOME/go/bin:$HOME/.local/bin

# }}}

# Aliases {{{
alias cdp="cd $HOME/projects"
alias cdd="cd $HOME/dotfiles"
alias vim="nvim"
alias swaprm="rm -rf ~/.local/share/nvim/swap"
alias zrc="nvim $HOME/.zshrc"
alias vrc="nvim $HOME/.config/nvim/init.lua"
alias cdv="cd $HOME/.config/nvim/init.lua"

[[ -f $HOME/dotfiles/alias.local ]] && source $HOME/dotfiles/alias.local
[[ -f $HOME/dotfiles/exports.local ]] && source $HOME/dotfiles/exports.local

# }}}


alias luamake=/home/pedram/repos/lua-language-server/3rd/luamake/luamake
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
autoload -U +X compinit && compinit
export AIRFLOW_HOME=~/projects/airflow
#
# vim: set nospell foldmethod=marker foldlevel=0:

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
