HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000

setopt autocd autolist beep notify SHARE_HISTORY
unsetopt nomatch
path=(/Applications/SnowSQL.app/Contents/MacOS $path)

# zstyle :compinstall filename '/Users/pedram.navid/.zshrc'
autoload -Uz compinit
compinit

# Prompt
#
# Load the vcs_info function and set the prompt accordingly
# autoload -U colors && colors
# autoload -Uz vcs_info
# zstyle ':vcs_info:*' enable git
# zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:*' check-for-staged-changes true
# zstyle ':vcs_info:git:*' formats "%{$fg[yellow]%} %b %m%u%c%{$reset_color%}"
# zstyle ':vcs_info:git:*' actionformats "%{$fg[yellow]%} %b (%a) %m%u%c%{$reset_color%}"
# precmd() {
#     vcs_info
# }
# setopt prompt_subst

# PROMPT='%m %~> '
# RPROMPT='${vcs_info_msg_0_}%{$fg[cyan]%}[%t]%{$reset_color%}'

# Directories
# cd acts as pushd, without printing the dir stack

DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome

# Functions
fpath=($HOME/.zsh/completion $HOME/.zsh/functions $fpath)
# autoload git_current_branch
# autoload -Uz compinit && compinit -i

# Sourced Files
source $HOME/.zsh/alias
source $HOME/.zsh/exports

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

typeset -a ANTIGEN_CHECK_FILES=($HOME/dotfiles/zsh/.zshrc $HOME/dotfiles/antigen/.antigenrc)
source $HOME/antigen.zsh
antigen init $HOME/dotfiles/antigen/.antigenrc
