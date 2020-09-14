#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color'
alias studio='nohup studio < /dev/null > /dev/null 2>&1 &'
alias sf='startxfce4'
alias renv='source ~/.bashrc'
alias importWallpapers='mv ~/.wallpapers/*.jpg /usr/share/backgrounds/xfce'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rs'
alias clean='pacman -Qdt'
alias reboot='sudo reboot -f'
alias poweroff='sudo poweroff -p'
alias open='thunar .'
alias start='thunar .'

PS1='| \w |\n\r >'

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec

#nohup dhcpcd eno1 < /dev/null > /dev/null 2>&1 &
