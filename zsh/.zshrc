# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
autoload -Uz compinit; compinit

# Node
# export PATH="/usr/local/bin/npm:/usr/local/bin/node:/usr/local/bin:$PATH"
# export PATH=$PATH:prefix/bin
# export NODE_PATH="/usr/local/lib/node_modules"



# Path to DOOM-EMACS
export PATH=~/.emacs.d/bin:$PATH

# LSP
# export PATH=$HOME/usr/local/bin/typescript-language-server:$PATH

# OF
# OF_ROOT=/Users/yanndepps/Documents/Kode/OF

# User configuration

# vim shit
export VISUAL=nvim
export EDITOR=nvim

# vim binding shit
# bindkey -v 
bindkey '^R' history-incremental-search-backward
bindkey '^P' up-history
bindkey '^N' down-history
export KEYTIMEOUT=1

# fzf shit
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # do i need this?
#export FZF_DEFAULT_COMMAND="rg --files --follow --hidden"

# more shit

export PATH="/usr/local/opt/llvm/bin:$PATH"
export LANG=en_US.UTF-8
