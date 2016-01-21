# Let's start with some sensible defaults

# Ensure languages are set
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Ensure editor is set
export EDITOR=vim

# zplug plugin management
source ~/.zplug/zplug

# zplug check return true if all plugins are installed
# # Therefore, when it returns not true (thus false),
# # run zplug install
if ! zplug check; then
    zplug install
fi

# source and add to the PATH
    zplug load

# Plugins

# Let zplug manage inself
zplug "b4b4r07/zplug"

# My own tweaks
zplug "alldigital/zsh-files"

# Substring search
zplug "zsh-users/zsh-history-substring-search"
 
# Support oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh

# Set priority to load command like a nice command
# # e.g., zsh-syntax-highlighting must be loaded
# # after executing compinit command and sourcing other plugins
zplug "zsh-users/zsh-syntax-highlighting", nice:10

zplug load --verbose

# Powerline 
powerline-daemon -q
. /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh


