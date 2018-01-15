if test $TERM = "eterm-256color";
    set fish_term24bit 0
else
    set -gx TERM xterm-256color
end

set PATH $HOME/bin $PATH
