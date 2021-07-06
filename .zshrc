# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ahmed/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/autojump/autojump.zsh 2>/dev/null
#source ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

plugins=(
  zsh-syntax-highlighting 
  autojump
  zsh-autosuggestions
)

################## My Settings From Bash ##################################################################

export TERM="xterm-256color"              # getting proper colors
export HISTCONTROL=ignoredups:erasedups   # no duplicate entries
export ALTERNATE_EDITOR=""                # setting for emacsclient
export EDITOR="emacsclient -t -a ''"      # $EDITOR use Emacs in terminal
export VISUAL="emacsclient -c -a emacs"   # $VISUAL use Emacs in GUI mode

## Remove duplicate entries
setopt PUSHD_IGNORE_DUPS

# sets vim as manpager
export MANPAGER="/bin/sh -c \"col -b | vim --not-a-term -c 'set ft=man ts=8 nomod nolist noma' -\""

### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi


### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

### ALIASES ###

# root privileges
alias doas="doas --"
alias sudo='sudo '

# navigation
alias ..='cd ..'
alias ...='cd ../..'

# vim and emacs
alias vim=nvim
alias em="/usr/bin/emacs -nw"
alias emacs="emacsclient -c -a ''"

# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Suspend the system 
alias sus='systemctl suspend'                  # update only standard pkgs

# pacman and yay
alias up='sudo pacman -Syu'                  # update only standard pkgs
alias pac="sudo pacman -S"               # update only AUR pkgs
alias yup="yay -Syu "              # update standard pkgs and AUR pkgs
alias unlock="sudo rm /var/lib/pacman/db.lck"    # remove pacman lock
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages

# apt
alias install='sudo apt install'                  # install standard pkgs
alias update='sudo apt update && sudo apt upgrade'                  # install standard pkgs
alias look='sudo apt search'                  # search standard pkgs

# flatpak
alias fpak='flatpak install flathub'

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

#use all cores
alias uac="sh ~/.bin/main/000*"

#hardware info --short
alias hw="hwinfo --short"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# adding flags
alias cp="cp -i"                          # confirm before overwriting something
alias mv="mv -i"
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias lynx='lynx -cfg=~/.lynx/lynx.cfg -lss=~/.lynx/lynx.lss -vikeys'
alias vifm='./.config/vifm/scripts/vifmrun'

# shutdown or reboot
alias ssn="sudo shutdown now"
alias sr="sudo reboot"

# Merge Xresources
alias merge='xrdb -merge ~/.Xresources'

# Python
alias py='python'

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# gpg encryption
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "
alias ytv-best="youtube-dl -f bestvideo+bestaudio "

# the terminal rickroll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

#git bare dotfiles repo
alias add-d='config add -u'
alias stat-d='config status'
alias com-d='config commit -m'
alias config="/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME"
alias push-d='config push git@github.com:Ahmed-Al-Balochi/dotfiles.git'

# git coding repo
alias add-c='git add -u'
alias stat-c='git status'
alias com-c='git commit -m'
alias push-c='git push git@github.com:Ahmed-Al-Balochi/Coding'

# Make packages file on Ubuntu
alias makePKG=dpkg-query -f '${binary:Package}\n' -W > packages_list.txt

# termbin
alias tb="nc termbin.com 9999"

# My Pushd dirs
alias ds="dirs -v"
alias dc="dirs -c"
alias pd="pushd"
pushd ~/Downloads
pushd ~/.config/awesome
pushd ~/.config/qtile
pushd ~/.config/qtile/scripts
pushd ~/Coding/CPP/CC/Assignments/
pushd ~/Coding/JAVA/ACP_lab/
pushd ~/

# Function to make a directory and cd into it
function mkcd() { mkdir "$1" && cd "$1"; }
Then:
mkcd /path/to/projectB
pwd # saved keystroke

### RANDOM COLOR SCRIPT ###
colorscript random
source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/powerlevel10k/powerlevel10k.zsh-theme
