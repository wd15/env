#!/bin/bash

if ! dpkg -s ansible > /dev/null; then
    sudo apt-get install -y ansible
fi

ansible-playbook setup.yml -i HOSTS --ask-sudo-pass
