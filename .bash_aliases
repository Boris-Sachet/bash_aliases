alias cls='clear'
alias ..='cd ..'
alias mkdir='mkdir -pv' # Create parent dir and display the name of each folder created
alias diff='colordiff'
alias path='echo -e ${PATH//:/\\n}' # Display content of path
alias ports='netstat -tulanp' # Show open ports
alias wget='wget -c' # Continue partially downloaded file
alias df='df -h' # Human readable with 1024 powers
alias du='du -ch' # Total and human readable

# Update this project and re-source it
alias upalias='git -C ~/bash_aliases/ pull && . ~/bash_aliases/.bash_aliases'

# Update pip
uppip='pip install --upgrade pip'

# Do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'
 
# Confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
 
# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# If user is not root
if [ $UID -ne 0 ]; then
    alias apt='sudo apt'
    alias reboot='sudo reboot'
    alias update='sudo apt update'
    alias upgrade='sudo apt upgrade'
    alias svim='sudo vim'
fi

## pass options to free ##
alias meminfo='free -m -l -t'
 
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
 
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
 
## Get server cpu info ##
alias cpuinfo='lscpu'
## older system use /proc/cpuinfo ##
##alias cpuinfo='less /proc/cpuinfo' ##
 
## get GPU ram on desktop / laptop##
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

##############################################################################################
# OS SPECIFIC CONFIG
### Get os name via uname ###
# _myos="$(uname)"
### add alias as per os using $_myos ###
# case $_myos in
#    Linux) alias foo='/path/to/linux/bin/foo';;
#    FreeBSD|OpenBSD) alias foo='/path/to/bsd/bin/foo' ;;
#    SunOS) alias foo='/path/to/sunos/bin/foo' ;;
#    *) ;;
# esac

##############################################################################################
# DEFAULT BASHRC COPY
# set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#    xterm-color|*-256color) color_prompt=yes;;
#esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias ll='ls -all --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
