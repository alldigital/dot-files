if test $TERM = "eterm-256color";
    set fish_term24bit 0
else
    set -gx TERM xterm-256color
end

set PATH $HOME/bin $PATH

function fish_mode_prompt
  # NOOP - Disable vim mode indicator
end

set __fish_git_prompt_show_informative_status 1
set __fish_git_prompt_hide_untrackedfiles 1
set __fish_git_prompt_showupstream "informative"
set __fish_git_prompt_color_branch brgreen
set __fish_git_prompt_color_dirtystate brred
set __fish_git_prompt_color_stagedstate brblue
set __fish_git_prompt_color_untrackedfiles $fish_color_normal
set __fish_git_prompt_color_cleanstate brgreen
set __fish_git_prompt_color_invalidstate brred
set __fish_git_prompt_color_upstream_ahead brmagenta
set __fish_git_prompt_color_upstream_behind brmagenta

# # Status Chars
set __fish_git_prompt_char_untrackedfiles "…"
set __fish_git_prompt_char_dirtystate "✚"
set __fish_git_prompt_char_stagedstate '●'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'
set __fish_git_prompt_char_upstream_prefix ""
set __fish_git_prompt_char_conflictedstate "✖"
set __fish_git_prompt_char_cleanstate "✔"

set __fish_prompt_normal (set_color normal)
function fish_prompt --description 'Write out the prompt'
    set -l last_status $status
    printf '%s' (string trim (__fish_vcs_prompt))
    set_color BDAE93
    printf '%s ' (prompt_pwd)
    set_color DD6F48
    echo -n "λ "
    set_color normal
end

#alias ls='exa --group-directories-first --sort=extension'
#alias rg="rg -M 200 -i -g '!archive-contents' --colors 'line:style:bold' --colors 'path:style:bold'"
#alias fzf='fzf --reverse'
