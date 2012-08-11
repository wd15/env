===
env
===

 * ln -s ~/.emacs .../env/dotemacs
 * ln -s ~/.bashrc .../env/bashrc
 * sudo apt-get install pyflakes
 * Add .gitignore

================                                                                               
Working with Git                                                                               
================                                                                               
                                                                                               
----------------                                                                               
First time setup                                                                               
----------------                                                                               

Update config::
                                                                                   
  $ git config --global user.name "John Doe"                                                     
  $ git config --global user.email johndoe@example.com                                           
  $ git config --global core.editor emacs                                                        
  $ git config --global merge.tool vimdiff

Use::

  $ git config --list