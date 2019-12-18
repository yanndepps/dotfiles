# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Node
# export PATH="/usr/local/bin/npm:/usr/local/bin/node:/usr/local/bin:$PATH"
# export PATH=$PATH:prefix/bin
# export NODE_PATH="/usr/local/lib/node_modules"


# Path to your oh-my-zsh installation.
export ZSH="/Users/yanndepps/.oh-my-zsh"

ZSH_THEME="spaceship"

# export SPACESHIP_VI_MODE_NORMAL=‡
# export SPACESHIP_VI_MODE_INSERT=…
export SPACESHIP_PROMPT_SEPARATE_LINE=false
export SPACESHIP_DIR_TRUNC=1

# Path to DOOM-EMACS
export PATH=~/.emacs.d/bin:$PATH

# LSP
export PATH=$HOME/usr/local/bin/typescript-language-server:$PATH

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git zsh-syntax-highlighting zsh-autosuggestion colorize
)

source $ZSH/oh-my-zsh.sh

# User configuration

# vim shit
export VISUAL=nvim
export EDITOR=nvim
# alias vim="nvim"
# alias vi="nvim"

# vim binding shit
bindkey -v 
bindkey '^R' history-incremental-search-backward
bindkey '^P' up-history
bindkey '^N' down-history
export KEYTIMEOUT=1

# fzf shit
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # do i need this?
export FZF_DEFAULT_COMMAND="rg --files --follow --hidden"

# more shit

source "/Users/yanndepps/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH="/usr/local/opt/llvm/bin:$PATH"
export LANG=en_US.UTF-8
