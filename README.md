## env

    $ ENVPATH=.../env
    $ ln -s $ENVPATH/dotemacs ~/.emacs 
    $ ln -s $ENVPATH/bashrc ~/.bashrc
    $ ln -s $ENVPATH/gitignore ~/.gitignore
    $ ln -s $ENVPATH/bashrc_paths ~/.bash_paths
    $ ln -s $ENVPATH/matplotlibrc ~/.config/matplotlib/matplotlibrc
    $ ln -s $ENVPATH/gitconfig ~/.gitconfig

## Emacs

    $ sudo apt-get install pyflakes

## Working with Git                                                                               
                                                                                               
Use

    $ git config --list

to check.

### Auto-completion

    $ git clone git://git.kernel.org/pub/scm/git/git.git
    $ cp git/contrib/completion/git-completion.bash ~/.git-completion.bash


and place ``source ~/.git-completion.bash`` in your ``.bashrc`` file.

### svn2git

Converting from svn ignoring branches, tags and merges.

    $ git svn clone --authors-file=authors-transform.txt --trunk=trunk/path/in/svn-repo --branches=branches svn-repo-url repo-from-svn.git
    $ git clone --bare file://path/to/repo-from-svn.git repo.git

### Pull Request

    $ git request-pull master ssh://genie.nist.gov/`pwd` | mailx email@email -s "stuff"

## Setting Up Python

http://pedrokroger.net/2010/07/configuring-emacs-as-a-python-ide-2/

## Ubuntu Setup

### Workspace switcher

http://www.randomhacks.co.uk/how-change-ubuntu-unity-window-switcher-back-to-old-style/
