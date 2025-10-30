export EDITOR="nvim"
export VISUAL="$EDITOR"
alias vim=nvim
alias vi=nvim

export XDG_CONFIG_HOME="$HOME/.config"
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:/usr/local/texlive/2025/bin/x86_64-linux:$PATH
export ZSH="$HOME/.oh-my-zsh"

export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway
export MOZ_ENABLE_WAYLAND=1
export WLR_NO_HARDWARE_CURSORS=1

export QT_QPA_PLATFORMTHEME=qt5ct

ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode disabled
DISABLE_AUTO_TITLE="true"

plugins=(git)
source $ZSH/oh-my-zsh.sh

alias config="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

alias zshconfig="$EDITOR $HOME/.zshrc"
alias zshreload="source $HOME/.zshrc"

# zoxide - replacement to cd
eval "$(zoxide init --cmd cd zsh)"
# tmux_sessionizer
bindkey -s ^f "tmux_sessionizer.sh\n"

# important exports for screen capture!
if [ "$(tty)" = "/dev/tty1" ]; then
	dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway
	systemctl --user start xdg-desktop-portal xdg-desktop-portal-wlr
	exec sway
fi

