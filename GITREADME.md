================
Working with Git
================

----------------
First time setup
----------------

$ git config --global user.name "John Doe"
$ git config --global user.email johndoe@example.com
$ git config --global core.editor emacs
$ git config --global merge.tool vimdiff

Use 

$ git config --list

to check.

---------------
Auto-completion
---------------

$ git clone git://git.kernel.org/pub/scm/git/git.git
$ cp git/contrib/completion/git-completion.bash ~/.git-completion.bash

and place ``source ~/.git-completion.bash`` in your ``.bashrc`` file.

-------
Aliases
-------

$ git config --global alias.co checkout
$ git config --global alias.br branch
$ git config --global alias.ci commit
$ git config --global alias.st status
$ git config --global alias.unstage 'reset HEAD --'
$ git config --global alias.last 'log -1 HEAD'
