#!/usr/bin/zsh

cd $HOME
rm -f .i3status.conf
ln -sf .i3status.conf-`hostname` .i3status.conf
