# Created by Zap installer
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/fzf"

# ---
# Python
alias python='/usr/bin/python3'

# DOOM-EMACS
export PATH=~/.config/emacs/bin:$PATH

# lvim cli
export PATH="$HOME/.local/bin":$PATH

# sources
source /usr/share/nvm/init-nvm.sh
source "$HOME/.cargo/env"
