HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000

setopt autocd autolist beep notify SHARE_HISTORY
unsetopt nomatch

# zstyle :compinstall filename '/Users/pedram.navid/.zshrc'
autoload -Uz compinit
compinit

# Directories
# cd acts as pushd, without printing the dir stack
DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome

# Functions
fpath=($HOME/.zsh/completion $HOME/.zsh/functions $fpath)

# Sourced Files
source $HOME/.zsh/alias
source $HOME/.zsh/exports

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

typeset -a ANTIGEN_CHECK_FILES=($HOME/dotfiles/zsh/.zshrc $HOME/dotfiles/antigen/.antigenrc)
source $HOME/antigen.zsh
antigen init $HOME/dotfiles/antigen/.antigenrc

eval "$(direnv hook zsh)"
eval "$(rbenv init -)"
