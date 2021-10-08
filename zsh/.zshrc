HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000

setopt autocd autolist beep notify SHARE_HISTORY
unsetopt nomatch

bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

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

if hash direnv 2>/dev/null; then eval "$(direnv hook zsh)"; fi
if hash rbenv 2>/dev/null; then eval "$(rbenv init -)"; fi

if [ "$(uname)" == "Darwin" ]; then
    export PATH="$HOME/.serverless/bin:$PATH"
    alias luamake=/Users/pedram/projects/lua-language-server/3rd/luamake/luamake
fi

eval "$(starship init zsh)"
if [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
