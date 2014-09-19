if [ "`id -gn`" = "`id -un`" -a `id -u` -gt 99 ]; then
        umask 002
else
        umask 022
fi

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

LD_LIBRARY_EXTRA="/usr/site/lib:"$HOME/$arch_path/lib:/usr/local/lib
if [ -z "$LD_LIBRARY_PATH" ]; then
  export LD_LIBRARY_PATH=$LD_LIBRARY_EXTRA
else
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LD_LIBRARY_EXTRA
fi

if [ "$PS1" ]; then

    # enable color support of ls and also add handy aliases

    eval `dircolors -b`
    alias ls='ls --color=auto'
    alias a2ps='a2ps -s1 --medium=Letter -o -'
    alias ll='ls -l'
    alias la='ls -A'
    alias l='ls -CF'
    alias dir='ls --color=auto --format=vertical'
    alias vdir='ls --color=auto --format=long'
    alias rm='rm -i'
    alias cp='cp -i'
    alias mv='mv -i'
    alias mkdir='mkdir -p'
    alias edit='emacs -nw'
    alias ipyn='ipython notebook --pylab=inline'
    alias matlab='/usr/local/MATLAB/R2013b/bin/matlab'

    PS1="[\\d \\t \\u@\\h:\\w]$ "
    PS1="\[\e[1;32m\]${PS1}\[\e[m\]"

    case $TERM in
    xterm*)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
        ;;
    *)
        ;;
    esac

fi

export ARCH=`uname -m`
export KERNEL=`uname -r`

unset MATPLOTLIBDATA
export FIPYROOT=svn+ssh://svn@code.matforge.org/fipy

unset mail

export CDPATH='.:~:~/git:~/hg'

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

export SVN_EDITOR='emacs -nw'
export EDITOR=emacs
export PATH=${HOME}/.cabal/bin:${PATH}
source ~/.git-completion.bash

export PATH="${HOME}/envs/default/bin:$PATH"

