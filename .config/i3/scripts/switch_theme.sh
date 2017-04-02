#!/bin/bash
 
DARK=$HOME/.dark

function reload() {
        # Things to do on theme change
        killall -SIGUSR1 termite
        cd $HOME/.config/i3
        cat config.base colors config.`hostname` > config
        xrdb ~/.Xresources
        i3-msg reload
}

if [ -f $DARK ]; then

        # Dark theme, switching to light
        cd $HOME
        rm -f $DARK
        # Create links to light resources
        ln -sf $HOME/.vim/theme-light $HOME/.vim-theme
        ln -sf $HOME/.tmux.light $HOME/.tmux.conf
        ln -sf $HOME/.Xresources-light $HOME/.Xresources
        ln -sf $HOME/.config/i3/colors.light $HOME/.config/i3/colors
        ln -sf $HOME/.config/i3blocks/base16-solarized.light.pm $HOME/.config/i3blocks/base16.pm
        ln -sf $HOME/.config/i3blocks/base16-solarized.light.sh $HOME/.config/i3blocks/base16.sh
        ln -sf $HOME/.config/mc/solarized-light.ini $HOME/.config/mc/solarized.ini
        ln -sf $HOME/.config/termite/solarized-light $HOME/.config/termite/config
        reload
        notify-send "Switched to light theme" 
        notify-send "Use set background in Vim and change appearance in mc to apply changes"
else
        # Light theme, switch to dark
        cd $HOME
        touch $DARK
        # Create links to dark resources
        ln -sf $HOME/.vim/theme-dark $HOME/.vim-theme
        ln -sf $HOME/.tmux.dark $HOME/.tmux.conf
        ln -sf $HOME/.Xresources-dark $HOME/.Xresources
        ln -sf $HOME/.config/i3/colors.dark $HOME/.config/i3/colors
        ln -sf $HOME/.config/i3blocks/base16-solarized.dark.pm $HOME/.config/i3blocks/base16.pm
        ln -sf $HOME/.config/i3blocks/base16-solarized.dark.sh $HOME/.config/i3blocks/base16.sh
        ln -sf $HOME/.config/mc/solarized-dark.ini $HOME/.config/mc/solarized.ini
        ln -sf $HOME/.config/termite/solarized-dark $HOME/.config/termite/config
        reload
        notify-send "Switched to dark theme"
        notify-send "Use set background in Vim and change appearance in mc to apply changes"
fi
