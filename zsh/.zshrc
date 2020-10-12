HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000

PROMPT='%m %~> '
RPROMPT='%t'

setopt autocd autolist beep notify
unsetopt nomatch

zstyle :compinstall filename '/Users/pedram.navid/.zshrc'
autoload -Uz compinit
compinit


# Directories
# cd acts as pushd, without printing the dir stack
DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome

# Functions
fpath=($HOME/.zsh/functions $fpath)
autoload git_current_branch

# Sourced Files
source $HOME/.zsh/alias
source $HOME/.zsh/exports
