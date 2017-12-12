#!/bin/bash

HOSTNAME=$(hostname)

I3=$HOME/.config/i3

function build() {
    cd ${I3}
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
