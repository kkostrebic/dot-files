# Based on robbyrussell's theme. Example:
# @host ➜ currentdir rvm:(rubyversion@gemset) git:(branchname)

# Get the current ruby version in use with RVM:
if which rvm-prompt &> /dev/null; then
    RUBY_PROMPT_="%{$fg_bold[blue]%}(%{$fg[green]%}\$(rvm-prompt s i v g)%{$fg_bold[blue]%})%{$reset_color%}"
else
  if which rbenv &> /dev/null; then
    RUBY_PROMPT_="%{$fg_bold[blue]%}rbenv:(%{$fg[green]%}\$(rbenv version | sed -e 's/ (set.*$//')%{$fg_bold[blue]%})%{$reset_color%}"
  fi
fi

if [ -e ~/.nvm/nvm.sh ]; then
  NODE_PROMPT_="%{$fg_bold[blue]%}(%{$fg[green]%}\$(nvm current)%{$fg_bold[blue]%})%{$reset_color%}"
else 
  if which nodenv &> /dev/null; then
    NODE_PROMPT_="%{$fg_bold[blue]%}(%{$fg[green]%}\$(nodenv version-name)%{$fg_bold[blue]%})%{$reset_color%}"
  fi
fi

USER_NAME_='%{'$'\033''[93m%}$(whoami)%{$reset_color%} '

# FULL_PATH_='%{'$'\e''[96m%}$(pwd) '
# Get the host name (first 4 chars)
HOST_PROMPT_='%{'$'\e''[96m%}%c '
GIT_PROMPT_="%{$fg_bold[blue]%}\$(git_prompt_info) "
NEW_LINE="%{$fg_bold[blue]%}> %{$reset_color%}"

PROMPT="$USER_NAME_$HOST_PROMPT_$NODE_PROMPT_$RUBY_PROMPT_$GIT_PROMPT_
$NEW_LINE"

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
