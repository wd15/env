# Development Environment

Repository to generate a dev environment using Ansible.

## Test with Docker

### Install Docker

https://docs.docker.com/engine/installation/linux/ubuntulinux/

### Test

Clone this repository.

    $ sudo service docker start
    $ sudo docker build -t env-test .
    $ sudo docker run -i -t env-test /bin/bash
    # su testuser
    # cd /home/testuser/git/env
    # ./setup.bash

Test it

    # su testuser
    # git config --list
    # emacs -nw

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

### SSH keys

https://help.github.com/articles/generating-ssh-keys/
