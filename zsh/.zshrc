HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Functions
fpath=($HOME/.zsh/functions $fpath)
autoload git_current_branch

# Sourced Files
source $HOME/.zsh/alias
source $HOME/.zsh/exports
