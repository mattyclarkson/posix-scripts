# Set the editor
export EDITOR=vim

# Add this folder to the path so that the scripts can be found
export PATH="${PATH}:~/.posix_scripts"

# Remove duplicate history elements
export HISTCONTROL=erasedups

# Helpfully change directory to good directories
CDPATH=.:~/svn:~/git:~/git/gitlab

# Some helpful aliases
alias ..='cd ..'
alias ...='cd ../..'
alias path='echo ${PATH} | tr ":" "\n"'
alias gb=gnome-builder

# Show ambiguous matches on first tab
bind 'set show-all-if-ambiguous on'

# Search history on up/down arrows
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# This ignores file tab completion of hidden dirs/files
bind 'set match-hidden-files off'

# case-insensitive completion
bind 'set completion-ignore-case on'

# Prompt command
PS1="\[\e[31m\][\[\e[33m\]\W\[\e[31m\]]\[\e[0m\] "
PROMPT_COMMAND='echo -ne "\033]0;${PWD}"; echo -ne "\007"'
if [ -f ~/.posix_scripts/bash-git-prompt/gitprompt.sh ]; then
  GIT_PROMPT_ONLY_IN_REPO=1
  GIT_PROMPT_LEADING_SPACE=0
  Time12a="\$(date +%H:%M)"
  PathShort="\w"
  GIT_PROMPT_SEPARATOR="|"
  GIT_PROMPT_BRANCH="\[\e[35m\]"
  GIT_PROMPT_STAGED="\[\e[31m\]●"
  GIT_PROMPT_CONFLICTS="\[\e[31m\]✖ "
  GIT_PROMPT_CHANGED="\[\e[34m\]✚ "
  GIT_PROMPT_REMOTE=" "
  GIT_PROMPT_UNTRACKED="\[\e[36m\]…"
  GIT_PROMPT_STASHED="\[\e[34m\]⚑ "
  GIT_PROMPT_CLEAN="\[\e[32m\]✔"
  GIT_PROMPT_COMMAND_OK="\[\e[32m\]✔ "
  GIT_PROMPT_COMMAND_FAIL="\[\e[31m\]✘ "
  GIT_PROMPT_SYMBOLS_AHEAD="↑·"
  GIT_PROMPT_SYMBOLS_BEHIND="↓·"
  GIT_PROMPT_SYMBOLS_PREHASH=":"
  GIT_PROMPT_PREFIX=""
  GIT_PROMPT_SUFFIX=""
  GIT_PROMPT_START="\[\e[31m\][\[\e[33m\]\W\[\e[0m\]|"
  GIT_PROMPT_END="\[\e[31m\]]\[\e[0m\] "
  . ~/.posix_scripts/bash-git-prompt/gitprompt.sh
fi

# Set up global node packages
export NPM_GLOBAL_PACKAGES="${HOME}/.npm-global-packages"
export NODE_PATH="${NPM_GLOBAL_PACKAGES}/lib/node_modules:${NODE_PATH}"
export PATH="${NPM_GLOBAL_PACKAGES}/bin:${PATH}"
unset MANPATH
export MANPATH="${NPM_GLOBAL_PACKAGES}/share/man:$(manpath)"

# Remove duplicate paths
export PATH=`echo "${PATH}" | tr ":" "\n" | uniq | tr "\n" ":" | head -c -1`
export NODE_PATH=`echo "${NODE_PATH}" | tr ":" "\n" | uniq | tr "\n" ":" | head -c -1`
