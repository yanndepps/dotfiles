# Created by Zap installer
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "Freed-Wu/fzf-tab-source"

# ---
# Python
alias python='/usr/bin/python3'

# DOOM-EMACS
export PATH=~/.config/emacs/bin:$PATH

# lvim cli
export PATH="$HOME/.local/bin":$PATH

# fzf-tab
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'

# sources
source /usr/share/nvm/init-nvm.sh
source "$HOME/.cargo/env"
