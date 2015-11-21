# Let's start with some sensible defaults

# Ensure languages are set
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Ensure editor is set
export EDITOR=vim

#
# OS Detection
#

UNAME=`uname`

# Fallback info
CURRENT_OS='Linux'
DISTRO=''

if [[ $UNAME == 'Darwin' ]]; then
    CURRENT_OS='OS X'
else
    # Must be Linux, determine distro
    if [[ -f /etc/redhat-release ]]; then
        # CentOS or Redhat?
        if grep -q "CentOS" /etc/redhat-release; then
            DISTRO='CentOS'
        else
            DISTRO='RHEL'
        fi
    fi
fi

# Use zsh-completions if it exists
if [[ -d "/usr/local/share/zsh-completions" ]]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi

# Load Antigen
source ~/.antigen.zsh

antigen bundle alldigital/zsh-files

# Load various lib files
antigen bundle robbyrussell/oh-my-zsh lib/

#
# Antigen Theme
#

antigen theme alldigital/zsh-files themes/alldigital

#
# Antigen Bundles
#

antigen bundle git
antigen bundle tmuxinator
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle rupa/z


# Load various lib files
antigen bundle robbyrussell/oh-my-zsh lib/

#
# Antigen Theme
#

antigen theme alldigital/zsh-files themes/alldigital

#
# Antigen Bundles loaded
#

antigen apply


# Powerline 
powerline-daemon -q
. /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh


