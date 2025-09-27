export EDITOR="nvim"
export VISUAL="$EDITOR"
export XDG_CONFIG_HOME="$HOME/.config"
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:/usr/local/texlive/2025/bin/x86_64-linux:$PATH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode disabled
DISABLE_AUTO_TITLE="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh
[ "$(tty)" = "/dev/tty1" ] && exec sway-run
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias zshconfig="$EDITOR $HOME/.zshrc"
alias zshreload="source $HOME/.zshrc"
# zoxide - replacement to cd
eval "$(zoxide init --cmd cd zsh)"
# tmux_sessionizer
bindkey -s ^f "tmux_sessionizer.sh\n"

