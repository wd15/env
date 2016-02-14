## Docker

To test that this works, install Docker using ...

and run the Docker deamon

    $ sudo docker build -t env-test .
    $ sudo docker run -i -t env-test /bin/bash



## Automate



The `setupenv.bash` should do a lot of the stuff below.

## env

    $ ENVPATH=.../env
    $ ln -s $ENVPATH/bashrc ~/.bashrc
    $ ln -s $ENVPATH/gitignore ~/.gitignore
    $ ln -s $ENVPATH/bashrc_paths ~/.bash_paths
    $ ln -s $ENVPATH/gitconfig ~/.gitconfig

## Emacs

    $ sudo apt-get install pyflakes
    $ ln -s $ENVPATH/dotemacs ~/.emacs 
    $ cp -rf $ENVPATH/emacs.d ~/.emacs.d

## Install Anacoda and IPython

and set thest paths, run matplotlib and ipython then set

    $ ln -s $ENVPATH/matplotlibrc ~/.config/matplotlib/matplotlibrc
    $ ln -s $ENVPATH/ipython_config.py ~/.ipython/profile_default/ipython_config.py
    $ ln -s $ENVPATH/custom.js ~/.ipython/profile_default/static/custom/custom.js
    $ ln -s $ENVPATH/ipython_notebook_config.py ~/.ipython/profile_default/ipython_notebook_config.py
    $ openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.pem -out mycert.pem
    $ cp mycert.pem /home/wd15/.ipython/profile_default

Add the spellchecker to ipython profile:

http://www.damian.oquanta.info/posts/a-poor-man-spell-checker-for-the-ipython-notebook.html

Add

http://undefd.kaihola.fi/2013/10/25/emacs-keybindings-for-ipython-notebook-and-firefox.html

## Working with Git                                                                               
                                                                                               
Use

    $ git config --list

to check.

### Auto-completion

    $ git clone git://git.kernel.org/pub/scm/git/git.git
    $ cp git/contrib/completion/git-completion.bash ~/.git-completion.bash


and place ``source ~/.git-completion.bash`` in your ``.bashrc`` file.

## Setting Up Python

http://pedrokroger.net/2010/07/configuring-emacs-as-a-python-ide-2/

## Ubuntu Setup

### Launcher

http://askubuntu.com/questions/9865/how-can-i-configure-unitys-launcher-auto-hide-behavior/31418#31418

### Launcher multiple screens

http://askubuntu.com/questions/107583/how-can-i-remove-duplicate-second-unity-launcher-on-a-dual-screen-setup

### Workspace switcher

http://www.randomhacks.co.uk/how-change-ubuntu-unity-window-switcher-back-to-old-style/

### Cut and Paste from keepass

Install ```xsel``` and ```autocutsel```. In the "Startup Applications" tool put ```autocutsel -s PRIMARY``` call that "Autocutsel PRIMARY". Also add ```autocutsel``` but with no arguments and call that "Autocutsel". Both are needed.

### Firefox

 * Sync firefox
 * Install keysnail (not installed with a sync)
 * 
## SSH keys

https://help.github.com/articles/generating-ssh-keys/
