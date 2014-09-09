posix-scripts
=============

Clone into the home directory:

```shell
git clone git@github.com:mattyclarkson/posix-scripts.git ~/.posix_scripts
```

bashrc
------

Add the following to `~/.bashrc`:

```shell
if [ -f ~/.posix_scripts/bashrc ]; then
	. ~/.posix_scripts/bashrc
fi
```
