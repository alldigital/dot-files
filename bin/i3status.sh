#!/usr/bin/zsh

cd $HOME
rm -f .i3status.conf
ln -sf .i3status.conf-`hostname` .i3status.conf
cd $HOME/.config/i3
rm -f config
ln -sf config-`hostname` config
