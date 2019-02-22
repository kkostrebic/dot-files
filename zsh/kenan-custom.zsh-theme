# Get the current ruby version in use with RVM:
# if which rvm-prompt &> /dev/null; then
#     RUBY_PROMPT_="%{$fg_bold[blue]%}(%{$fg[green]%}\$(rvm-prompt s i v g)%{$fg_bold[blue]%})%{$reset_color%}"
# fi

# if [ -e ~/.nvm/nvm.sh ]; then
#   NODE_PROMPT_="%{$fg_bold[blue]%}(%{$fg[green]%}\$(nvm current)%{$fg_bold[blue]%})%{$reset_color%}"
# fi

# USER_NAME_='%{'$'\033''[93m%}$(whoami)%{$reset_color%} '

GIT_PROMPT_="\$(git_prompt_info)%{$reset_color%}"
NEW_LINE='%{'$'\033''[93m%}$ %{$reset_color%}'

PROMPT="$GIT_PROMPT_$NEW_LINE"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ✗ "
ZSH_THEME_GIT_PROMPT_CLEAN=" "
