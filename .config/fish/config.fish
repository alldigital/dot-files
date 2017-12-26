# Useful aliases {{{

alias c 'clear'
alias hl 'less -R'

# Setup Vi Mode
# function fish_user_key_bindings
# 	bind -M insert -m default kj backward-char force-repaint
# end
function my_vi_bindings
  fish_vi_key_bindings
  bind -M insert -m default kj backward-char force-repaint
end
set -g fish_key_bindings my_vi_bindings

# shorten often used commands
alias g 'git'

set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch green
set __fish_git_prompt_color_upstream_ahead yellow
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'


function fish_prompt
  set last_status $status


  switch $fish_bind_mode
    case "insert"
        set_color $fish_color_cwd
    case "default"
        set_color normal
  end

  printf '%s' (prompt_pwd)
  set_color green

  printf '%s ' (__fish_git_prompt)

  set_color normal
end
