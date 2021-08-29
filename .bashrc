#     __               __  
#    / /_  ____ ______/ /_ 
#   / __ \/ __ `/ ___/ __ \
#  / /_/ / /_/ (__  ) / / /
# /_.___/\__,_/____/_/ /_/ 
#                         
# customized bashrc, v1.0

# if not running interactively, don't do anything
[[ $- != *i* ]] && return


###############################################################
# Preferred Applications
###############################################################
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/code
export TERMINAL=/usr/bin/urxvt
export BROWSER=/usr/bin/firefox-developer-edition


###############################################################
# Preferences
###############################################################

# history settings
HISTSIZE=3000
HISTFILESIZE=3000
export HISTTIMEFORMAT='%F, %T '
export HISTCONTROL=ignoreboth:erasedups


# case-independent autocompletion
bind "set completion-ignore-case on"

# shopt config
shopt -s cdspell
shopt -s dotglob
shopt -s cmdhist
shopt -s checkwinsize


###############################################################
# Prompt
###############################################################

PS1='\[$(tput setaf 6)\]['\
'\[$(tput setaf 12)\]\u'\
'\[$(tput setaf 4)\]@'\
'\[$(tput setaf 12)\]\h '\
'\[$(tput setaf 10)\]\W'\
'\[$(tput setaf 6)\]]\$ '\
'\[$(tput sgr0)\]'


###############################################################
# Aliases
###############################################################

if [ -f ~/.aliases ]; then
 	 . ~/.aliases
fi


###############################################################
# Scripts
###############################################################

# directory traverse script
up() {
  for _ in $(seq 1 $1);
    do 
        cd ..
    done
}

# archive extraction
ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1    ;;
      *.tar.gz)    tar xzf $1    ;;
      *.bz2)       bunzip2 $1    ;;
      *.rar)       unrar x $1    ;;
      *.gz)        gunzip $1     ;;
      *.tar)       tar xf $1     ;;
      *.tbz2)      tar xjf $1    ;;
      *.tgz)       tar xzf $1    ;;
      *.zip)       unzip $1      ;;
      *.Z)         uncompress $1 ;;
      *.7z)        7z x $1       ;;
      *.deb)       ar x $1       ;;
      *.tar.xz)    tar xf $1     ;;
      *.tar.zst)   unzstd $1     ;;
      *) echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# repeat commands
repeat() {
  local _
  for _ in $(seq $1); do
    eval "$2"
  done
}

# quickly backup something
bak() {
    echo "copying $1 to $1.bak"
    cp $1 $1.bak
}
