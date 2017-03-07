#!/usr/bin/env sh

# Let's hardwire the default notes path
notes_dir="$HOME/.notes"

list_notes()
{
    # Initialise and read config
    notes_dir=""
    conf=$HOME/.config/notes.conf

    if [ -f $conf ]; then
        . $conf
    fi

    if [ -z "$notes_dir" ]; then
        notes_dir="$HOME/.notes"
    fi

    cd "$notes_dir"
    # Find notes files, remove the leading path name
    find . -type f | sort | sed 's/.*\///'
}

note=$( (list_notes) | rofi -dmenu -i -hide-scrollbar -p "Select notes file:")

if [ -n "${note}" ]
then
    TERM=screen=256color termite --class="FTerm" --geometry=800x480 -e "emacsclient -t "${notes_dir}/${note}""
fi
