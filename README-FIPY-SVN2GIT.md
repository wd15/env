============
FiPy svn2git
============

I made a number of attempts at this. Something changed during one of
these attempts that cleaned up a number of issues. I am not sure what
changed. Maybe the order of arguments in the initial clone. When I
tried cloning the first few times, there were issues with the tags and
issues with branches with names like `ticket:XXX` due to the colon. I
had to manually delete some of those branches in `.git` to make
progress. I tried to replicate the process but couldn't and it ended
up working. Anyway, I seem to have a working repository now. I did not
follow all of Jon's instructions regrading cleaning up branches that
have not got merge statements in the canonical form. Also not all the
tags are present for some reason, though we an easily find them with
`git log --all | grep tagging`. Anyway the steps are as follows.

    $ git svn clone --authors-file=authors.txt --trunk=trunk --tags=tags --branches=vendor --branches=branches --branches=sandbox $FIPYROOT fipy-from-svn

The first time I attempted this it took forever for some reason to do
with the `--tags`, the second time I made `tags` a branch and it went
much faster. On the third attempt using the above command it no longer
had the `tags` issues. So strange.

    $ cd fipy-from-svn
    $ python guyersvngit.py

See <a href="guyersvngit.py">guyersvngit.py</a>. I had to add the
check for `None` on <a href="guyersvngit.py#L29">line 29</a>. This may
have screwed up two branches, but I'm not sure which ones so can't
check. Jon's magic here. Nothing works without these step

    $ git filter-branch --tag-name-filter cat -- --all

Get a lot of output but specifically `bad graft data:
6cb2e2b753cc83fecd28d2b40eebf5088091e020
a99ea16060a4e14aeada9004f7e1cfe4cf04371d 5299` doesn't look good. Next step

    $ git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
    $ rm .git/info/grafts

Now from http://git-scm.com/book/ch8-2.html

    $ cp -Rf .git/refs/remotes/tags/* .git/refs/tags/
    $ rm -Rf .git/refs/remotes/tag
    $ cp -Rf .git/refs/remotes/* .git/refs/heads/
    $ rm -Rf .git/refs/remotes

Move to the server

    $ ssh server
    $ mkdir /path/to/repo
    $ cd /path/to/repo
    $ git init --bare

back to `fipy-from-svn`

    $ git remote add origin server:/path/to/repo
    $ git push origin --all
    $ git push origin --tags

Clone a local version

    $ cd ..
    $ git clone server:/path/to/repo repo
    $ cd repo
    $ git fetch --tags

Inspecting:

    $ git tag
    version-2_0_3
    version-2_1
    version-2_1_1
    version-2_1_2
    version-2_1_3
    version-3_0

What happened to all the tags? They can always be resurrected with
little effort, but it seems strange. Next time I try this, I'll save
the log from the initial clone. It might help.

    $ git branch -r

seems to show a load of branches. Look at those weird bad graft data
things

    $ cd ../fipy-from-svn
    $ git log -1 6cb2e2b753cc83fecd28d2b40eebf5088091e020
    commit 6cb2e2b753cc83fecd28d2b40eebf5088091e020
    Author: Daniel Wheeler <>
    Date:   Mon Nov 28 19:29:15 2011 +0000

        merged log:branches/documentation@4992:4994 to source:branches/version-2_1@4994, Patanker -> Patankar
    
        git-svn-id: svn+ssh://code.matforge.org/fipy/branches/version-2_1@4995 d80e17d7-ff13-0410-a124-85740d801063
    $ git log -1 a99ea16060a4e14aeada9004f7e1cfe4cf04371d
    commit a99ea16060a4e14aeada9004f7e1cfe4cf04371d
    Author: Jonathan E. Guyer <>
    Date:   Fri Oct 7 20:10:46 2011 +0000

        Fixed TeX for ticket:346
    
    
        git-svn-id: svn+ssh://code.matforge.org/fipy/branches/version-2_1@4801 d80e17d7-ff13-0410-a124-85740d801063

Going back to `repo`.

    $ cd ../repo
    $ git log --all --grep=Patanker
    commit 47c253b45e258e1e79fc7f0f3a81ab67ce5d2a8c
    Author: Daniel Wheeler <daniel.wheeler2@gmail.com>
    Date:   Mon Nov 28 19:29:15 2011 +0000

        merged log:branches/documentation@4992:4994 to source:branches/version-2_1@4994, Patanker -> Patankar
    
        git-svn-id: svn+ssh://code.matforge.org/fipy/branches/version-2_1@4995 d80e17d7-ff13-0410-a124-85740d801063

    commit 4bce60a7cb19a5461fac3c927da33503dec3ba10
    Author: Daniel Wheeler <daniel.wheeler2@gmail.com>
    Date:   Mon Nov 28 15:18:40 2011 +0000

         * Patanker -> Patankar
    
    
    
        git-svn-id: svn+ssh://code.matforge.org/fipy/branches/documentation@4994 d80e17d7-ff13-0410-a124-85740d801063

Those commits have different SHAs now! Not sure if that is bad or
good.