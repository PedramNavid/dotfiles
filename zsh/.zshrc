# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt autocd beep notify
unsetopt extendedglob nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/pedram.navid/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Functions
fpath=($HOME/.zsh/functions $fpath)
autoload git_current_branch

# Sourced Files
source $HOME/.zsh/alias
source $HOME/.zsh/exports
