# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

umask 022

# If this is a non-interactive shell, we still want to get
# the stuff (like $PATH) in /etc/profile if we haven't already
if [[ -z "$Environ_Sourced" && -f /etc/profile ]]
then
  source /etc/profile
fi

[ -r $HOME/.bash_paths ] && . $HOME/.bash_paths

[ -r $HOME/.bashrc ] && . $HOME/.bashrc
