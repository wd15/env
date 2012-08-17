=========
git-media
=========

Set up Virtualenv to work with gems.

     $ echo 'export GEM_HOME=$VIRTUAL_ENV' >> $VIRTUAL_ENV/bin/postactivate
     $ echo 'export GEM_PATH=""' >> $VIRTUAL_ENV/bin/postactivate

Install the following.

     $ gem install trollop
     $ gem install s3
     $ gem install ruby-atmos-pure
     $ gem install right_aws

Get git-media.

     $ git clone git://github.com/schacon/git-media.git
     $ cd git-media

Apply the following patch for issue #8.

     diff --git a/lib/git-media/filter-smudge.rb b/lib/git-media/filter-smudge.rb
     index 0a8c6d1..03451a9 100644
     --- a/lib/git-media/filter-smudge.rb
     +++ b/lib/git-media/filter-smudge.rb
     @@ -9 +9 @@ module GitMedia
     -      sha = STDIN.readline(64).strip # read no more than 64 bytes
     +      sha = STDIN.gets.chomp # read no more than 64 bytes

Install.
    
     $ gem build git-media.gemspec
     $ gem install git-media-0.1.1.gem

The following should setup git-media to work with a local cache.

     $ git config --global filter.media.clean "git-media filter-clean"
     $ git config --global filter.media.smudge "git-media filter-smudge"
     $ MEDIAEXT=...
     $ MEDIAPATH=.../$MEDIAEXT
     $ mkdir $MEDIAPATH
     $ git config --global git-media.transport "local"
     $ git config --global git-media.localpath "${MEDIAPATH}"
     $ git config –global media.auto-download false

In the git-repo.

     $ cd .../git-repo
     $ echo "*.media filter=media -crlf" > .gitattributes

Test is
   
     $ cd ..
     $ du -sk *
     $ cd git-repo
     $ git co -b testbranch
     $ git add hugefile.$MEDIAEXT
     $ git ci -m "adding huge file"
     $ git media sync
     $ git media clean
     $ git co master
     $ cd ..
     $ du -sk *

The repository should be no bigger and $MEDIAPATH should have a hash in it

     $ ls $MEDIAPATH
     
The following doesn't work without the patch

     $ cd git-repo
     $ git co testbranch
     $ git media sync

The huge file should be back in the repository with no errors and 

     $ git status

should have no staged files (without the patch the media file is always staged).