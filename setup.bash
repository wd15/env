#!/bin/bash

if ! dpkg -s ansible > /dev/null; then
    sudo apt-get install ansible
fi


