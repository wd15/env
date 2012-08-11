# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files for examples

# If this is a non-interactive shell, we still want to get
# the stuff (like $PATH) in /etc/profile if we haven't already

# set -x

if [ "`id -gn`" = "`id -un`" -a `id -u` -gt 99 ]; then
        umask 002
else
        umask 022
fi

# are we an interactive shell?
if [ "$PS1" ]; then
    case $TERM in
        xterm*)
            PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
            ;;
        *)
            ;;
    esac
    [ "$PS1" = "\\s-\\v\\\$ " ] && PS1="[\u@\h \W]\\$ "

    if [ -z "$loginsh" ]; then # We're not a login shell
        # Not all scripts in profile.d are compatible with other shells
        # TODO: make the scripts compatible or check the running shell by
        # themselves.
        if [ -n "${BASH_VERSION}${KSH_VERSION}${ZSH_VERSION}" ]; then
            for i in /etc/profile.d/*.sh; do
                if [ -x $i ]; then
                    . $i
                fi
            done
        fi
    fi
fi

unset loginsh



if [[ -z "$Environ_Sourced" && -f /etc/profile ]]
then
  source /etc/profile
fi


[ -n "$BASH_PATHS" ] || . $HOME/.bash_paths

# This is supposed to be set in bash-paths, and is, but for the KDM
# log-ins, it apparently doesn't get set -- maybe it's overwritten by
# someone?  Doing it again here means doing it twice, alas.
LD_LIBRARY_EXTRA="/usr/site/lib:"$HOME/$arch_path/lib
if [ -z "$LD_LIBRARY_PATH" ]; then
  export LD_LIBRARY_PATH=$LD_LIBRARY_EXTRA
else
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LD_LIBRARY_EXTRA
fi

# If running interactively, then:
if [ "$PS1" ]; then

    # enable color support of ls and also add handy aliases

    eval `dircolors -b`
    alias ls='ls --color=auto'
    alias a2ps='a2ps -s1 --medium=Letter -o -'
    alias addroot="su root -c '/usr/bin/ssh-add -c -t 12h /root/.ssh/id_rsa'"
    alias ll='ls -l'
    alias la='ls -A'
    alias l='ls -CF'
    alias dir='ls --color=auto --format=vertical'
    alias vdir='ls --color=auto --format=long'
    alias rmi='rm -i'
    alias cpi='cp -i'
    alias mvi='mv -i'
    alias mkdir='mkdir -p'
    alias edit='emacs -nw'

    # alias ssh-add='ssh-add ~/.ssh/identity ~/.ssh/id_dsa'
    # alias cvs="cvs -d :ext:reida@lurch.nist.gov:/users/langer/FE/CVSoof"

    # set a fancy prompt.  Use ISO 6429 color codes.
    PS1='\[\033[34m\]\h[\u]:\[\033[m\] '
    # PS1='\033[1m\h[\u]:\033[m '

    # If this is an xterm set the title to user@host:dir
    #case $TERM in
    #xterm*)
    #    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
    #    ;;
    #*)
    #    ;;
    #esac

fi

## set local python paths

export ARCH=`uname -m`
export KERNEL=`uname -r`

##export LATEXPATH=/users/wd15/latex
##export TEXINPUTS=.:${HOME}/latex:

##export MATPLOTLIBDATA=${HOME}/share/matplotlib
unset MATPLOTLIBDATA
##export FIPYROOT=svn+ssh://wd15@matforge.org/usr/local/svn-fipy-repos
export FIPYROOT=svn+ssh://svn@code.matforge.org/fipy

unset mail

## reset the memory limit to half the total to be safe
## use "limit vmemorylimit unlimited" to unset
##if ($HOST == benson) then
##    export HALFMEMLIMIT = `grep MemTotal /proc/meminfo | sed 's/kB/\/1.2/' | sed 's/MemTotal:/print/' | python`
##    limit vmemoryuse $HALFMEMLIMIT kbytes
##endif

export CDPATH='.:~:~/git:/users/wd15/work/matforge/fipy:/users/wd15/work/matforge/wd15:/users/wd15/work/matforge'
##export TEXMFCNF=/users/wd15/texmf/web2c

if [ `uname -n` == luggage ]; then
    alias mpirun='/opt/mpich/ch-p4/bin/mpirun'
fi

source /etc/bash_completion

if [[ -e /usr/local/lib/python2.5/site-packages/virtualenvwrapper-2.2-py2.5.egg ]]
then
    export VIRTUALENVWRAPPER=/usr/local/lib/python2.5/site-packages/virtualenvwrapper-2.2-py2.5.egg
elif [[ -e  /usr/local/stow/pycuda-0.93-libs/lib/python2.5/site-packages/virtualenvwrapper-2.2.1-py2.5.egg ]]
then
    export VIRTUALENVWRAPPER=/usr/local/stow/pycuda-0.93-libs/lib/python2.5/site-packages/virtualenvwrapper-2.2.1-py2.5.egg
elif [[ -e  /usr/local/lib/python2.5/site-packages/virtualenvwrapper-2.2.2-py2.5.egg ]]
then
    export VIRTUALENVWRAPPER=/usr/local/lib/python2.5/site-packages/virtualenvwrapper-2.2.2-py2.5.egg
elif [[ -e /usr/lib/python2.5/site-packages/virtualenvwrapper-2.6.1-py2.5.egg ]]
then 
    export VIRTUALENVWRAPPER=/usr/lib/python2.5/site-packages/virtualenvwrapper-2.6.1-py2.5.egg
else
    export VIRTUALENVWRAPPER=.
fi

export PYTHONPATH=${VIRTUALENVWRAPPER}

if [[ -f /usr/local/bin/virtualenvwrapper.sh ]]
then
    source /usr/local/bin/virtualenvwrapper.sh
elif [[ -f /usr/bin/virtualenvwrapper.sh ]]
then
    source /usr/bin/virtualenvwrapper.sh
fi
unset PYTHONPATH
export ARCH=`uname -m`
export FIPYBASE=${HOME}/Documents/python/fipy
export FIPYTRUNK=${FIPYBASE}/trunk

##if  [ `uname -n` == poole ]; then
##    ##workon poole
##else
##    ##workon $ARCH
##fi

export SVN_EDITOR='emacs -nw'
export EDITOR=emacs
##workon i686-coupled
##workon i686
##workon poole
###workon trunk-dbg

source ~/.git-completion.bash
