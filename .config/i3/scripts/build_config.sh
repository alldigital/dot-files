#!/bin/bash

HOSTNAME=$(hostname)

function build() {
    cd $HOME/.config/i3
    cat configs/config.base > config
    cat colors/colors colors/base >> config
    cat keybindings/* >> config
    cat modes/* >> config
    cat configs/config.${HOSTNAME} >> config
    cat configs/startup >> config
}

function reload() {
    # Things to do on theme change
    build
    killall -SIGUSR1 termite
    xrdb ~/.Xresources
    i3-msg reload
}

build
