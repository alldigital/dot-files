# Let's start with some sensible defaults

# Ensure languages are set
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Ensure editor is set
export EDITOR=vim

zsh_zplug() {
    [[ -d ~/.zplug ]] || {
        git clone https://github.com/b4b4r07/zplug ~/.zplug
        source ~/.zplug/zplug
        zplug update --self
    }

#	zplug plugin management
	source ~/.zplug/zplug

    has_plugin() {
        (( $+functions[zplug] )) || return 1
        zplug check "${1:?too few arguments}"
        return $status
    }

    # Let zplug manage inself
    zplug "b4b4r07/zplug"

    # Local loading
    #    zplug "~/.modules", from:local, nice:1, of:"*.sh"
    #    zplug "~/.zsh",     from:local, nice:2


    # Remote loading

    # My own tweaks
    zplug "alldigital/zsh-files"

    # Other b4b4r07 plugins
    zplug "b4b4r07/http_code", as:command, of:bin
    zplug "b4b4r07/zsh-vimode-visual"

    # Other plugins of interest
#    zplug "junegunn/fzf-bin",  as:command, from:gh-r, file:"fzf", frozen:1
#    zplug "peco/peco",         as:command, from:gh-r, file:"fzf", at:v0.3.5
    zplug "junegunn/fzf-bin",  as:command, from:gh-r, file:"fzf"

    # Support oh-my-zsh plugins and the like
    zplug "plugins/git",   from:oh-my-zsh

    # Substring search
    zplug "zsh-users/zsh-history-substring-search"
 
    # Completions
    zplug "zsh-users/zsh-completions"


    # Set priority to load command like a nice command
    # # e.g., zsh-syntax-highlighting must be loaded
    # # after executing compinit command and sourcing other plugins
    zplug "zsh-users/zsh-syntax-highlighting", nice:10


    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        else
            echo
        fi
    fi
#    zplug load --verbose
    zplug load
}

zsh_startup() {
    # Exit if called from vim
    [[ -n "$VIMRUNTIME" ]] && return

    zsh_zplug

    # Display Zsh version and display number
#    echo -e "\n$fg_bold[cyan]This is ZSH $fg_bold[red]${ZSH_VERSION}$fg_bold[cyan] - DISPLAY on $fg_bold[red]$DISPLAY$reset_color\n"
}

if zsh_startup; then
    # Important
    zstyle ':completion:*:default' menu select=2

    # Completing Groping
    zstyle ':completion:*:options' description 'yes'
    zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'
    zstyle ':completion:*' group-name ''

    # Completing misc
    zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
    zstyle ':completion:*' verbose yes
    zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
    zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'
    zstyle ':completion:*' use-cache true
    zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

    # Directory
    zstyle ':completion:*:cd:*' ignore-parents parent pwd
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

    # default: --
    zstyle ':completion:*' list-separator '-->'
    zstyle ':completion:*:manuals' separate-sections true

    # Menu select
    zmodload -i zsh/complist
    bindkey -M menuselect '^h' vi-backward-char
    bindkey -M menuselect '^j' vi-down-line-or-history
    bindkey -M menuselect '^k' vi-up-line-or-history
    bindkey -M menuselect '^l' vi-forward-char
    #bindkey -M menuselect '^k' accept-and-infer-next-history
fi

# Powerline 
powerline-daemon -q
. /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh


