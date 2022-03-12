  #          /\          /\         
  #         /  \        /  \    Ahmed Al Balochi AKA (AA) configs    
  #        / -- \      / -- \   YouTube: https://bit.ly/2DpALov
  #       / ---- \    / ---- \  Github: https://github.com/Ahmed-Al-Balochi/dotfiles.git  
  #      /        \  /        \  
# My bash config.

# PATH="$HOME/.local/bin${PATH:+:${PATH}}"  # adding .local/bin to $PATH

### EXPORT
export TERM="xterm-256color"              # getting proper colors
export HISTCONTROL=ignoredups:erasedups   # no duplicate entries
export ALTERNATE_EDITOR=""                # setting for emacsclient
export EDITOR="emacsclient -t -a ''"      # $EDITOR use Emacs in terminal
export VISUAL="emacsclient -c -a emacs"   # $VISUAL use Emacs in GUI mode

# sets vim as manpager
export MANPAGER="/bin/sh -c \"col -b | vim --not-a-term -c 'set ft=man ts=8 nomod nolist noma' -\""

### SET VI MODE IN BASH SHELL
set -o vi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### PROMPT
PS1='[\u@\h \W]\$ '

### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

### CHANGE TITLE OF TERMINALS
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac


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

# pacman and yay
alias up='sudo pacman -Syu'                  # update only standard pkgs
alias pac="sudo pacman -S"               # update only AUR pkgs
alias yup="yay -Syu "              # update standard pkgs and AUR pkgs
alias unlock="sudo rm /var/lib/pacman/db.lck"    # remove pacman lock
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages

# apt
alias apt='sudo apt install'                  # install standard pkgs
alias update='sudo apt update && sudo apt upgrade'                  # install standard pkgs

# flatpak
alias fpak='flatpak install flathub'

# Changing "ls" to "exa"
alias ls='ls -alh --group-directories-first' # my preferred listing
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

# git commands
alias branch='git branch'
alias checkout='git checkout'
alias gadd='git add -u'
alias gstat='git status'
alias gcom='git commit -m'
alias gpush='git push origin main'

# Make packages file on Ubuntu
alias makePKG="dpkg-query -f '${binary:Package}\n' -W > packages_list.txt"

# termbin
alias tb="nc termbin.com 9999"

### RANDOM COLOR SCRIPT ###
colorscript random

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

### Oracle User Settings ###
export ORACLE_BASE=/oracle
export ORACLE_HOME=/oracle/product/db
export ORACLE_SID=xdb
export ORACLE_INVENTORY=/oracle/inventory
export ORACLE_BASE ORACLE_SID ORACLE_HOME
export PATH=$ORACLE_HOME/bin:$PATH
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH
export EDITOR=emacs
export VISUAL=emacs

################################################################################

##  FUNCTIONS                                                                 ##

################################################################################



##

##	ARRANGE $PWD AND STORE IT IN $NEW_PWD

##	* The home directory (HOME) is replaced with a ~

##	* The last pwdmaxlen characters of the PWD are displayed

##	* Leading partial directory names are striped off

##		/home/me/stuff -> ~/stuff (if USER=me)

##		/usr/share/big_dir_name -> ../share/big_dir_name (if pwdmaxlen=20)

##

##	Original source: WOLFMAN'S color bash promt

##	https://wiki.chakralinux.org/index.php?title=Color_Bash_Prompt#Wolfman.27s

##

bash_prompt_command() {

	# How many characters of the $PWD should be kept

	local pwdmaxlen=25



	# Indicate that there has been dir truncation

	local trunc_symbol=".."



	# Store local dir

	local dir=${PWD##*/}



	# Which length to use

	pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))



	NEW_PWD=${PWD/#$HOME/\~}



	local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))



	# Generate name

	if [ ${pwdoffset} -gt "0" ]

	then

		NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}

		NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}

	fi

}









##

##	GENERATE A FORMAT SEQUENCE

##

format_font()

{

	## FIRST ARGUMENT TO RETURN FORMAT STRING

	local output=$1





	case $# in

	2)

		eval $output="'\[\033[0;${2}m\]'"

		;;

	3)

		eval $output="'\[\033[0;${2};${3}m\]'"

		;;

	4)

		eval $output="'\[\033[0;${2};${3};${4}m\]'"

		;;

	*)

		eval $output="'\[\033[0m\]'"

		;;

	esac

}







##

## COLORIZE BASH PROMT

##

bash_prompt() {



	############################################################################

	## COLOR CODES                                                            ##

	## These can be used in the configuration below                           ##

	############################################################################



	## FONT EFFECT

	local      NONE='0'

	local      BOLD='1'

	local       DIM='2'

	local UNDERLINE='4'

	local     BLINK='5'

	local    INVERT='7'

	local    HIDDEN='8'





	## COLORS

	local   DEFAULT='9'

	local     BLACK='0'

	local       RED='1'

	local     GREEN='2'

	local    YELLOW='3'

	local      BLUE='4'

	local   MAGENTA='5'

	local      CYAN='6'

	local    L_GRAY='7'

	local    D_GRAY='60'

	local     L_RED='61'

	local   L_GREEN='62'

	local  L_YELLOW='63'

	local    L_BLUE='64'

	local L_MAGENTA='65'

	local    L_CYAN='66'

	local     WHITE='67'





	## TYPE

	local     RESET='0'

	local    EFFECT='0'

	local     COLOR='30'

	local        BG='40'





	## 256 COLOR CODES

	local NO_FORMAT="\[\033[0m\]"

	local ORANGE_BOLD="\[\033[1;38;5;208m\]"

	local TOXIC_GREEN_BOLD="\[\033[1;38;5;118m\]"

	local RED_BOLD="\[\033[1;38;5;1m\]"

	local CYAN_BOLD="\[\033[1;38;5;87m\]"

	local BLACK_BOLD="\[\033[1;38;5;0m\]"

	local WHITE_BOLD="\[\033[1;38;5;15m\]"

	local GRAY_BOLD="\[\033[1;90m\]"

	local BLUE_BOLD="\[\033[1;38;5;74m\]"











	##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##

	  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##

	##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##







	##                          CONFIGURE HERE                                ##







	############################################################################

	## CONFIGURATION                                                          ##

	## Choose your color combination here                                     ##

	############################################################################

	local FONT_COLOR_1=$WHITE

	local BACKGROUND_1=$BLUE

	local TEXTEFFECT_1=$BOLD



	local FONT_COLOR_2=$WHITE

	local BACKGROUND_2=$CYAN

	local TEXTEFFECT_2=$BOLD



	local FONT_COLOR_3=$D_GRAY

	local BACKGROUND_3=$WHITE

	local TEXTEFFECT_3=$BOLD



	local PROMT_FORMAT=$WHITE_BOLD





	############################################################################

	## EXAMPLE CONFIGURATIONS                                                 ##

	## I use them for different hosts. Test them out ;)                       ##

	############################################################################



	## CONFIGURATION: BLUE-WHITE

	if [ "$HOSTNAME" = dell ]; then

		FONT_COLOR_1=$WHITE; BACKGROUND_1=$BLUE; TEXTEFFECT_1=$BOLD

		FONT_COLOR_2=$WHITE; BACKGROUND_2=$L_BLUE; TEXTEFFECT_2=$BOLD

		FONT_COLOR_3=$D_GRAY; BACKGROUND_3=$WHITE; TEXTEFFECT_3=$BOLD

		PROMT_FORMAT=$CYAN_BOLD

	fi



	## CONFIGURATION: BLACK-RED

	if [ "$HOSTNAME" = giraff6 ]; then

		FONT_COLOR_1=$WHITE; BACKGROUND_1=$BLACK; TEXTEFFECT_1=$BOLD

		FONT_COLOR_2=$WHITE; BACKGROUND_2=$D_GRAY; TEXTEFFECT_2=$BOLD

		FONT_COLOR_3=$WHITE; BACKGROUND_3=$RED; TEXTEFFECT_3=$BOLD

		PROMT_FORMAT=$RED_BOLD

	fi



	## CONFIGURATION: RED-BLACK

	#FONT_COLOR_1=$WHITE; BACKGROUND_1=$RED; TEXTEFFECT_1=$BOLD

	#FONT_COLOR_2=$WHITE; BACKGROUND_2=$D_GRAY; TEXTEFFECT_2=$BOLD

	#FONT_COLOR_3=$WHITE; BACKGROUND_3=$BLACK; TEXTEFFECT_3=$BOLD

	#PROMT_FORMAT=$RED_BOLD



	## CONFIGURATION: CYAN-BLUE

	if [ "$HOSTNAME" = sharkoon ]; then

		FONT_COLOR_1=$BLACK; BACKGROUND_1=$L_CYAN; TEXTEFFECT_1=$BOLD

		FONT_COLOR_2=$WHITE; BACKGROUND_2=$L_BLUE; TEXTEFFECT_2=$BOLD

		FONT_COLOR_3=$WHITE; BACKGROUND_3=$BLUE; TEXTEFFECT_3=$BOLD

		PROMT_FORMAT=$CYAN_BOLD

	fi



	## CONFIGURATION: GRAY-SCALE

	if [ "$HOSTNAME" = giraff ]; then

		FONT_COLOR_1=$WHITE; BACKGROUND_1=$BLACK; TEXTEFFECT_1=$BOLD

		FONT_COLOR_2=$WHITE; BACKGROUND_2=$D_GRAY; TEXTEFFECT_2=$BOLD

		FONT_COLOR_3=$WHITE; BACKGROUND_3=$L_GRAY; TEXTEFFECT_3=$BOLD

		PROMT_FORMAT=$BLACK_BOLD

	fi



	## CONFIGURATION: GRAY-CYAN

	if [ "$HOSTNAME" = light ]; then

		FONT_COLOR_1=$WHITE; BACKGROUND_1=$BLACK; TEXTEFFECT_1=$BOLD

		FONT_COLOR_2=$WHITE; BACKGROUND_2=$D_GRAY; TEXTEFFECT_2=$BOLD

		FONT_COLOR_3=$BLACK; BACKGROUND_3=$L_CYAN; TEXTEFFECT_3=$BOLD

		PROMT_FORMAT=$CYAN_BOLD

	fi





	##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##

	  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##

	##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##









	############################################################################

	## TEXT FORMATING                                                         ##

	## Generate the text formating according to configuration                 ##

	############################################################################



	## CONVERT CODES: add offset

	FC1=$(($FONT_COLOR_1+$COLOR))

	BG1=$(($BACKGROUND_1+$BG))

	FE1=$(($TEXTEFFECT_1+$EFFECT))



	FC2=$(($FONT_COLOR_2+$COLOR))

	BG2=$(($BACKGROUND_2+$BG))

	FE2=$(($TEXTEFFECT_2+$EFFECT))



	FC3=$(($FONT_COLOR_3+$COLOR))

	BG3=$(($BACKGROUND_3+$BG))

	FE3=$(($TEXTEFFECT_3+$EFFECT))



	FC4=$(($FONT_COLOR_4+$COLOR))

	BG4=$(($BACKGROUND_4+$BG))

	FE4=$(($TEXTEFFECT_4+$EFFECT))





	## CALL FORMATING HELPER FUNCTION: effect + font color + BG color

	local TEXT_FORMAT_1

	local TEXT_FORMAT_2

	local TEXT_FORMAT_3

	local TEXT_FORMAT_4

	format_font TEXT_FORMAT_1 $FE1 $FC1 $BG1

	format_font TEXT_FORMAT_2 $FE2 $FC2 $BG2

	format_font TEXT_FORMAT_3 $FC3 $FE3 $BG3

	format_font TEXT_FORMAT_4 $FC4 $FE4 $BG4





	# GENERATE PROMT SECTIONS

	local PROMT_USER=$"$TEXT_FORMAT_1 \u "

	local PROMT_HOST=$"$TEXT_FORMAT_2 \h "

	local PROMT_PWD=$"$TEXT_FORMAT_4 \${NEW_PWD} "

	local PROMT_INPUT=$"$PROMT_FORMAT "





	############################################################################

	## SEPARATOR FORMATING                                                    ##

	## Generate the separators between sections                               ##

	## Uses background colors of the sections                                 ##

	############################################################################



	## CONVERT CODES

	TSFC1=$(($BACKGROUND_1+$COLOR))

	TSBG1=$(($BACKGROUND_2+$BG))



	TSFC2=$(($BACKGROUND_2+$COLOR))

	TSBG2=$(($BACKGROUND_3+$BG))



	TSFC3=$(($BACKGROUND_3+$COLOR))

	TSBG3=$(($DEFAULT+$BG))





	## CALL FORMATING HELPER FUNCTION: effect + font color + BG color

	local SEPARATOR_FORMAT_1

	local SEPARATOR_FORMAT_2

	local SEPARATOR_FORMAT_3

	format_font SEPARATOR_FORMAT_1 $TSFC1 $TSBG1

	format_font SEPARATOR_FORMAT_2 $TSFC2 $TSBG2

	format_font SEPARATOR_FORMAT_3 $TSFC3 $TSBG3





	# GENERATE SEPARATORS WITH FANCY TRIANGLE

	local TRIANGLE=$'\uE0B0'

	local SEPARATOR_1=$SEPARATOR_FORMAT_1$TRIANGLE

	local SEPARATOR_2=$SEPARATOR_FORMAT_2$TRIANGLE

	local SEPARATOR_3=$SEPARATOR_FORMAT_3$TRIANGLE







	############################################################################

	## WINDOW TITLE                                                           ##

	## Prevent messed up terminal-window titles                               ##

	############################################################################

	case $TERM in

	xterm*|rxvt*)

		local TITLEBAR='\[\033]0;\u:${NEW_PWD}\007\]'

		;;

	*)

		local TITLEBAR=""

		;;

	esac







	############################################################################

	## BASH PROMT                                                             ##

	## Generate promt and remove format from the rest                         ##

	############################################################################

	#PS1="$TITLEBAR\n${PROMT_USER}${SEPARATOR_1}${PROMT_HOST}${SEPARATOR_2}${PROMT_PWD}${SEPARATOR_3}${PROMT_INPUT}"
  PS1="${PROMT_PWD}${SEPARATOR_3}${PROMT_INPUT}"







	## For terminal line coloring, leaving the rest standard

	none="$(tput sgr0)"

	trap 'echo -ne "${none}"' DEBUG

}









################################################################################

##  MAIN                                                                      ##

################################################################################



##	Bash provides an environment variable called PROMPT_COMMAND.

##	The contents of this variable are executed as a regular Bash command

##	just before Bash displays a prompt.

##	We want it to call our own command to truncate PWD and store it in NEW_PWD

PROMPT_COMMAND=bash_prompt_command



##	Call bash_promnt only once, then unset it (not needed any more)

##	It will set $PS1 with colors and relative to $NEW_PWD,

##	which gets updated by $PROMT_COMMAND on behalf of the terminal

bash_prompt

unset bash_prompt

#create a file called .bashrc-personal and put all your personal aliases
#in there. They will not be overwritten by skel.

[[ -f ~/.bashrc-personal ]] && . ~/.bashrc-personal

