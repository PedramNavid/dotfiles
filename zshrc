[[ -f $HOME/.alias ]] && source $HOME/.alias
[[ -f $HOME/.exports ]] && source $HOME/.exports
[[ -f $HOME/.alias.local ]] && source $HOME/.alias.local
[[ -f $HOME/.exports.local ]] && source $HOME/.exports.local

setopt autocd
setopt hist_ignore_space
setopt hist_ignore_dups

fpath+=~/.zfunc; autoload -Uz compinit; compinit

zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle :compinstall filename '$HOME/.zshrc'

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Keyboard Shortcuts
export ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
autoload edit-command-line
bindkey '^R' history-incremental-search-backward
bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search
bindkey -M vicmd v edit-command-line

# Antidote
if [[ -f /usr/share/zsh-antidote/antidote.zsh ]]; then
    source /usr/share/zsh-antidote/antidote.zsh
fi

if [[ -f ${ZDOTDIR:-~}/.antidote/antidote.zsh ]]; then
    source ${ZDOTDIR:-~}/.antidote/antidote.zsh
fi

if [ "$(uname)" = "Darwin" ]; then
    source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
fi
antidote load


# Needs to run after antidote
bindkey -v
bindkey '^j' autosuggest-accept
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

bindkey "^A" vi-beginning-of-line
bindkey "^P" up-line-or-search

source <(fzf --zsh)

# bun completions
[ -s "/Users/pedram/.bun/_bun" ] && source "/Users/pedram/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/pedram/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Added by Windsurf
export PATH="/Users/pedram/.codeium/windsurf/bin:$PATH"
