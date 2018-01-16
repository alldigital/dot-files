fish_vi_key_bindings

if test $TERM = "eterm-256color";
    set fish_term24bit 0
else
    set -gx TERM xterm-256color
end

# Override default prompt colors
set -g theme_color_scheme terminal2

set PATH $HOME/bin $PATH

function sudo
  if test "$argv" = !!
    eval command sudo $history[1]
  else
    command sudo $argv
  end
end

function time --description="Time just like in Bash"
  command time --portability $argv
end
