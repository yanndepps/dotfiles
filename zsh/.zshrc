# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

alias cpu-max='tuned-adm profile latency-performance'
alias cpu-balanced='tuned-adm profile balanced'
alias cpu-min='tuned-adm profile laptop-battery-powersave'

# Python EPFL alias 
alias python='/usr/bin/python3'

# Path to your oh-my-zsh installation.
export ZSH="/home/depps/.oh-my-zsh"

# Path to DOOM-EMACS
export PATH=~/.config/emacs/bin:$PATH

# helix runtime
# export HELIX_RUNTIME="/usr/lib/helix/runtime"

# lvim cli
export PATH="$HOME/.local/bin":$PATH

# where should I put you?
# bindkey -s ^f "tmux-sessionizer\n"

# Path to Zig
# export PATH=$PATH:~/zig
# export PATH=$PATH:~/zls

# Guile3
# export PATH=$PATH:/usr/bin/guile3

# LSP
# export PATH=$HOME/usr/local/bin/typescript-language-server:$PATH
#
# vim shit
# export VISUAL=nvim
# export EDITOR=nvim

# vim binding shit
# bindkey -v 
# bindkey '^R' history-incremental-search-backward
# bindkey '^P' up-history
# bindkey '^N' down-history
# export KEYTIMEOUT=1

# fzf shit
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_COMMAND="rg --files --follow --hidden"
export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --glob '!*/{.git,node_modules,venv}/**'"
export FZF_CTRL_T_COMMAND="rg --files --no-ignore-vcs --glob '!*/{.git,node_modules,venv}/**'"
export FZF_ALT_C_COMMAND="fd --type d --no-ignore-vcs --exclude node_modules --exclude .git --exclude venv"

# more shit

# export PATH="/usr/local/opt/llvm/bin:$PATH"
# export LANG=en_US.UTF-8

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/depps/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# ---
ZSH_THEME="lambda"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Which plugins would you like to load?
plugins=(
    fzf
    git
    history-substring-search
    colored-man-pages
    zsh-autosuggestions
    zsh-syntax-highlighting
    z
)

# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $ZSH/oh-my-zsh.sh
source /usr/share/nvm/init-nvm.sh
source "$HOME/.cargo/env"

