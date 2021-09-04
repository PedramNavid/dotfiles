zmodload zsh/zprof
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000

setopt autocd autolist beep notify SHARE_HISTORY
unsetopt nomatch

# zstyle :compinstall filename '/Users/pedram.navid/.zshrc'
# autoload -Uz compinit
# compinit

# Directories
# cd acts as pushd, without printing the dir stack
DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome

# Functions
fpath=($HOME/.zsh/completion $HOME/.zsh/functions $fpath)

# Sourced Files
source $HOME/.zsh/alias
source $HOME/.zsh/exports

if hash pyenv 2>/dev/null ; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

typeset -a ANTIGEN_CHECK_FILES=($HOME/dotfiles/zsh/.zshrc $HOME/dotfiles/antigen/.antigenrc)
source $HOME/antigen.zsh
antigen init $HOME/dotfiles/antigen/.antigenrc

if hash direnv 2>/dev/null; then eval "$(direnv hook zsh)"; fi
if hash rbenv 2>/dev/null; then eval "$(rbenv init -)"; fi

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"
