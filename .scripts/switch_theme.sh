#!/bin/bash
 
DARK=$HOME/.dark

if [ -f $DARK]; then

        # Dark theme, switching to light
        cd $HOME
        rm -f $DARK
        git checkout light
        reload
        nitify-send "Switched to light theme" 
        notify-send "Vim and mc should be restarted"
else
        # Light theme, switch to dark
        cd $HOME
        touch $DARK
        git checkout dark
        reload
        nitify-send "Switched to dark theme"
        notify-send " Vim and mc should be restarted"
fi

reload() {
        # Things to do on theme change
        killall -SIGUSR1 termite
        i3-msg reload
}
