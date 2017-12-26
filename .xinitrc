# Disable access control
xhost +SI:localuser:$USER

# Themes, etc
# gnome-settings-daemon &

# Keyboard
#exec setxkbmap -option caps:escape -option shift:both_capslock -option 'grp:alt_space_toggle' -option 'terminate:ctrl_alt_bksp' "us,ru(winkeys)" &
exec xkbcomp $HOME/.Xkeymap $DISPLAY &
exec xcape -e 'Control_L=Escape' &

# Turn off touchpad
exec $HOME /bin/touchpad.sh &

# Fallback cursor
xsetroot -cursor_name left_ptr
unclutter &

# Keyboard repeat rate
xset r rate 300 60

# Notifications
exec dunst -config ~/.config/dunst/dunstrc &

# status bar
exec conky | dzen2 -p -dock -ta r -fn "Input Mono Compressed-10:Medium" &
# Start Emacs
exec dbus-launch --exit-with-session emacs --eval "(exwm-enable)"
# exec emacs
