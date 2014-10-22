posix-scripts
=============

Clone into the home directory:

```
git clone git@github.com:mattyclarkson/posix-scripts.git ~/.posix_scripts
git --git-dir=${HOME}/.posix_scripts/.git --work-tree=${HOME}/.posix_scripts submodule update --init
```

bashrc
------

Add the following to `~/.bashrc`:

```
if [ -f ~/.posix_scripts/bashrc ]; then
  # Grab the newest posix scripts at least once a week
  if hash stat 2>&- && hash find 2>&- && hash git 2>&- && \
      ! stat $(find ~/.posix_scripts/.git -name FETCH_HEAD -mtime -7) > /dev/null 2>&1; then
    echo -n Updating POSIX scripts...
    cd ${HOME}/.posix_scripts
    git pull -p > /dev/null
    git submodule update --init > /dev/null
    cd -
    echo Done!
  fi

  # Source the Bash run commands
  . ~/.posix_scripts/bashrc
fi
```

vimrc
-----

Add the following to '~/.vimrc'

```
let HOME=expand('<sfile>:p:h')
if filereadable($HOME . '/.posix_scripts/rc.vim')
  source $HOME/.posix_scripts/rc.vim
endif
```

gitconfig
---------

Add the following to `~/.gitconfig`:

```
[include]
	path=.posix_scripts/gitconfig
```
