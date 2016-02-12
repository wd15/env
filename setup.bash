ENVPATH=$PWD

for file in bashrc gitignore bash_paths gitconfig emacs; do     
    \rm -rf ~/.$file
    ln -s $ENVPATH/$file ~/.$file
done

#cp -rf $ENVPATH/emacs.d ~/.emacs.d



\rm -rf ~/.config/matplotlib/matplotlibrc 
ln -s $ENVPATH/matplotlibrc ~/.config/matplotlib/matplotlibrc

\rm -rf ~/.ipython/profile_default/ipython_config.py
\rm -rf ~/.ipython/profile_default/static/custom/custom.js
\rm -rf ~/.ipython/profile_default/ipython_notebook_config.py

ln -s $ENVPATH/ipython_config.py ~/.ipython/profile_default/ipython_config.py
ln -s $ENVPATH/custom.js ~/.ipython/profile_default/static/custom/custom.js
ln -s $ENVPATH/ipython_notebook_config.py ~/.ipython/profile_default/ipython_notebook_config.py
