#!/bin/sh

# Profile file. Runs on login.

export PATH="$PATH:$HOME/.scripts"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="linkhandler"
export TRUEBROWSER="firefox"
export READER="zathura"
export BIB="$HOME/Documents/LaTeX/uni.bib"

[ -f ~/.scripts/shortcuts.sh ] && ~/.scripts/shortcuts.sh

[ -f ~/.bashrc ] && source ~/.bashrc

# Start graphical server if i3 not already running.
if [ "$(tty)" = "/dev/tty1" ]; then
	pgrep -x i3 || exec startx
fi

# set resolution options for 4K ultrafine
xrandr --newmode "4096x2304"  813.00  4096 4440 4888 5680  2304 2307 2312 2386 -hsync +vsync
xrandr --addmode Virtual-1 4096x2304
xrandr --newmode "2880x1800"  442.00  2880 3104 3416 3952  1800 1803 1809 1865 -hsync +vsync
xrandr --addmode Virtual-1 2880x1800

# Switch escape and caps and use wal colors if tty:
sudo -n loadkeys ~/.scripts/ttymaps.kmap 2>/dev/null
wal -Rn


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init -)"
fi

eval "$(pyenv virtualenv-init -)"
