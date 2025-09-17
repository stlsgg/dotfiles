export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode disabled
DISABLE_AUTO_TITLE="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh
[ "$(tty)" = "/dev/tty1" ] && exec sway-run
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
