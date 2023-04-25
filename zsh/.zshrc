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
export PATH=~/.emacs.d/bin:$PATH

# helix runtime
# export HELIX_RUNTIME="/usr/lib/helix/runtime"

# lvim cli
export PATH="$HOME/.local/bin":$PATH

# where should I put you?
bindkey -s ^f "tmux-sessionizer\n"

# Path to Processing
# export PATH=~/P5/:$PATH

# Path to pyenv
# export PATH="$HOME/.pyenv/bin:$PATH"

# Path to Zig
export PATH=$PATH:~/zig
# export PATH=$PATH:~/zls

# Guile3
# export PATH=$PATH:/usr/bin/guile3

# Guix
# export GUIX_LOCPATH="$HOME/.guix-profile/lib/locale"

# LSP
# export PATH=$HOME/usr/local/bin/typescript-language-server:$PATH
#
# vim shit
export VISUAL=nvim
export EDITOR=nvim

# vim binding shit
bindkey -v 
bindkey '^R' history-incremental-search-backward
bindkey '^P' up-history
bindkey '^N' down-history
export KEYTIMEOUT=1

# fzf shit
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_COMMAND="rg --files --follow --hidden"
export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --glob '!*/{.git,node_modules,venv}/**'"
export FZF_CTRL_T_COMMAND="rg --files --no-ignore-vcs --glob '!*/{.git,node_modules,venv}/**'"
export FZF_ALT_C_COMMAND="fd --type d --no-ignore-vcs --exclude node_modules --exclude .git --exclude venv"

# more shit

# export PATH="/usr/local/opt/llvm/bin:$PATH"
# export LANG=en_US.UTF-8
# starship prompt
# eval "$(starship init zsh)"

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/depps/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="lambda"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)
plugins=(
    fzf
    git
    history-substring-search
    colored-man-pages
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-z
)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


