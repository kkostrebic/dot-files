# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# startx if DISPLAY is not set (X server not already started) and XDG_VTNR
# (virtual terminal) is the first one 
# NOTE: XDG_VTNR is set by pam_systemd (details `$ man pam_systemd`)
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
fi

# GIT environment variables for built-in (git) bash prompt customization
# shows * or a + for unstaged and staged changes, respectively
GIT_PS1_SHOWDIRTYSTATE=1
# shows % if there are any untracked files
GIT_PS1_SHOWUNTRACKEDFILES=1

# BASH prompt customization (https://bash-prompt-generator.org/)
PS1='\[\e[92m\]\u@\h\[\e[0m\]:\[\e[94m\]\w\[\e[91m\]$(__git_ps1 " (%s)")\[\e[0m\]\\$ '

# Make sure you have right permissions (write) to
# "/sys/class/backlight/**/brightness", one way is to change group ownership
# (i.e. set "video" group to it) 
adjust_brightness() {
    local change=$1
    local backlight_dir="/sys/class/backlight/gmux_backlight"
    local current=$(cat "$backlight_dir/brightness")
    local max=$(cat "$backlight_dir/max_brightness")
    local new=$((current + change))

    # Ensure new brightness is within valid range
    if [ $new -lt 0 ]; then
        new=0
    elif [ $new -gt $max ]; then
        new=$max
    fi

    echo $new > "$backlight_dir/brightness"
}

increase_brightness() {
  adjust_brightness 10
}

decrease_brightness() {
  adjust_brightness -10
}

# Aliases on directory level
set_local_aliases() {
  local tmp_file=$(mktemp)
  # if .bash_aliases file exists in the current directory
  #   - make alias commands using sed and regex
  #   - source alias commands
  if [[ -f ".bash_aliases" ]]; then
    # allowed chars for variable names in bash: [a-zA-Z_][a-zA-Z_0-9]*
    sed --regexp-extended "s/^([a-zA-Z_][a-zA-Z_0-9]*)='(.*)'$/alias \1='\2'/" .bash_aliases > "$tmp_file"

    source "$tmp_file"
    rm "$tmp_file"
  fi
}

unset_local_aliases() {
  local tmp_file=$(mktemp)
  # if .bash_aliases file exists in the current directory
  #   - make unalias commands using sed and regex and ignore errors
  #   - source unalias commands
  if [[ -f ".bash_aliases" ]]; then
    sed --regexp-extended "s/^([a-zA-Z_][a-zA-Z_0-9]*)='(.*)'$/unalias \1 2>\/dev\/null/" .bash_aliases > "$tmp_file"

    source "$tmp_file"
    rm "$tmp_file"
  fi
}

cd() {
  # Before changing directory, unset aliases from the old directory
  unset_local_aliases
  # Change directory
  builtin cd "$@"  
  # After changing directory, set aliases for the new directory
  set_local_aliases
}

