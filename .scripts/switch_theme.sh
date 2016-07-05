#!/bin/bash
 
DARK=$HOME/.dark

function reload() {
        # Things to do on theme change
        killall -SIGUSR1 termite
        cd $HOME/.config/i3
        cat config.base config.`hostname` > config
        i3-msg reload
}

if [ -f $DARK ]; then

        # Dark theme, switching to light
        cd $HOME
        rm -f $DARK
        git checkout light
        reload
        notify-send "Switched to light theme" 
        notify-send "Vim and mc should be restarted"
else
        # Light theme, switch to dark
        cd $HOME
        touch $DARK
        git checkout dark
        reload
        notify-send "Switched to dark theme"
        notify-send " Vim and mc should be restarted"
fi
