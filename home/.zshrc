if [[ $- == *i* ]]; then
cat << "EOF"
  __  __       _     _ _   _                 
 |  \/  | __ _(_) __| | \ | |_   _ _ __ ___  
 | |\/| |/ _` | |/ _` |  \| | | | | '__/ _ \ 
 | |  | | (_| | | (_| | |\  | |_| | | | (_) |
 |_|  |_|\__,_|_|\__,_|_| \_|\__,_|_|  \___/

EOF
fi

## Enable completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' special-dirs true

# Fix eza completion
compdef _files eza

# Optional: also fix common aliases
compdef _files ls
compdef _files ll

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

# Better navigation
setopt AUTO_CD
setopt INTERACTIVE_COMMENTS

# Keybindings (sane defaults)
bindkey -e
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Plugins (from pacman)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf keybindings
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh

# Aliases
alias ls='eza --icons'
alias ll='eza -lah --icons'
alias cat='bat'
alias grep='rg'
alias find='fd'

# Starship prompt
eval "$(starship init zsh)"
