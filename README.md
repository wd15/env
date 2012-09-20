===
env
===

    $ ENVPATH=.../env
    $ ln -s ~/.emacs $ENVPATH/dotemacs
    $ ln -s ~/.bashrc $ENVPATH/bashrc
    $ sudo apt-get install pyflakes
    $ ln -s ~/.gitignore $ENVPATH/gitignore
    $ git config --global core.excludesfile ~/.gitignore

================                                                                               
Working with Git                                                                               
================                                                                               
                                                                                               
----------------                                                                               
First time setup                                                                               
----------------                                                                               

Update config

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

-------
svn2git
-------

Converting from svn ignoring branches, tags and merges.

    $ git svn clone --authors-file=authors-transform.txt --trunk=trunk/path/in/svn-repo --branches=branches svn-repo-url repo-from-svn.git
    $ git clone --bare file://path/to/repo-from-svn.git repo.git

------------
Pull Request
------------

    $ git request-pull master ssh://genie.nist.gov/`pwd` | mailx email@email -s "stuff"

-----------------
Setting Up Python
-----------------

http://pedrokroger.net/2010/07/configuring-emacs-as-a-python-ide-2/
