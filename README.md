posix-scripts
=============

Clone into the home directory:

```
git clone git@github.com:mattyclarkson/posix-scripts.git ~/.posix_scripts
```

bashrc
------

Add the following to `~/.bashrc`:

```
if [ -f ~/.posix_scripts/bashrc ]; then
  . ~/.posix_scripts/bashrc
fi
```

vimrc
------

Add the following to '~/.vimrc'

```
let HOME=expand('<sfile>:p:h')
if filereadable($HOME . '/.posix_scripts/rc.vim')
  source $HOME/.posix_scripts/rc.vim
endif
```
