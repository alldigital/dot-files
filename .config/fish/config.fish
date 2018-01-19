fish_vi_key_bindings

if test $TERM = "eterm-256color";
    set fish_term24bit 0
else
    set -gx TERM xterm-256color
end

# emacs as my default editor
set -gx EDITOR "emacsclient -a vim -c -n"
set -gx VISUAL "emacsclient -a vim -c -n"

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

function sudobangbang --on-event fish_postexec
    abbr !! sudo $argv[1]
end