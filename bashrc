# Set the editor
export EDITOR=vim

# Remove duplicate paths
export PATH=`echo "${PATH}" | tr ":" "\n" | uniq | tr "\n" ":" | head -c -1`

# Remove duplicate history elements
export HISTCONTROL=erasedups

# Helpfully change directory to good directories
CDPATH=.:~/svn:~/git

# Some helpful aliases
alias ..='cd ..'
alias ...='cd ../..'
alias path='echo $PATH | tr ":" "\n"'

# Show ambiguous matches on first tab
bind 'set show-all-if-ambiguous on'

# This ignores file tab completion of hidden dirs/files (great for .svn dirs)
bind 'set match-hidden-files off'

# case-insensitive completion
bind 'set completion-ignore-case on'

# Prompt command
PS1="\[\e[47m\]\[\e[31m\][\[\e[32m\]\u \[\e[35m\]\W\[\e[31m\]]\[\e[0m\] "
PROMPT_COMMAND='echo -ne "\033]0;${PWD}"; echo -ne "\007"'
