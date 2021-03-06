posix-scripts
=============

Install with the following:

```
git clone git@github.com:mattyclarkson/posix-scripts.git ~/.posix-scripts
cd ~/.posix-scripts
git submodule update --init
```

bashrc
------

Add the following to `~/.bashrc`:

```
if [ -f ~/.posix-scripts/bashrc ]; then
  # Grab the newest posix scripts at least once a week
  if hash stat 2>&- && hash find 2>&- && hash git 2>&- && \
      ! stat $(find ~/.posix-scripts/.git -name FETCH_HEAD -mtime -7) > /dev/null 2>&1; then
    echo -n Updating POSIX scripts...
    cd ${HOME}/.posix-scripts
    git pull -p > /dev/null
    git submodule update --remote --rebase > /dev/null
    cd -
    echo Done!
  fi

  # Source the Bash run commands
  . ~/.posix-scripts/bashrc
fi
```

vimrc
-----

Add the following to '~/.vimrc'

```
let HOME=expand('<sfile>:p:h')
if filereadable($HOME . '/.posix-scripts/rc.vim')
  source $HOME/.posix-scripts/rc.vim
endif
```

gitconfig
---------

Add the following to `~/.gitconfig`:

```
[include]
	path=.posix-scripts/gitconfig
```

npmrc
-----

Add the following to `~/.npmrc`:

```
prefix=${HOME}/.npm-global-packages
```
