# Disable access control
xhost +SI:localuser:$USER

# Themes, etc
# gnome-settings-daemon &

# Keyboard
exec setxkbmap -option caps:backspace -option shift:both_capslock -option 'grp:alt_space_toggle' "us,ru(winkeys)" &
xcape -e 'Control_L=Escape'

# Fallback cursor
xsetroot -cursor_name left_ptr

# Keyboard repeat rate
xset r rate 300 60

# Notifications
exec dunst -config ~/.config/dunst/dunstrc &

# status bar
exec conky | dzen2 -p -dock -ta r -fn "Input Mono Compressed-10:Medium" &
# Start Emacs
exec dbus-launch --exit-with-session emacs -f "(exwm-enable)"
# exec emacs
