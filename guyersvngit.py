#!/usr/bin/env python

import re
from subprocess import Popen, PIPE

p = Popen('git rev-list --all --grep="merged log:"', shell=True,
          stdout=PIPE, close_fds=True)
      
shas = p.communicate()[0]
      
merge_patt = re.compile("merged log:(([a-zA-Z0-9_-]*[/]*)*)@[0-9]{1,4}:([0-9]{1,4})")
# merge_patt = re.compile("merged source:(([a-zA-Z0-9_-]*[/]*)*)@([0-9]{1,4})")
parent_patt = re.compile("parent ([a-f0-9]*)")

# patt = re.compile("merged log")

grafts = []
for commit in shas.strip().split("\n"):
    p = Popen('git cat-file commit ' + commit, shell=True,
              stdout=PIPE, close_fds=True)
          
    msg = p.communicate()[0]
    
    parents = parent_patt.search(msg[:msg.find("\n\n")]).groups(0)
    
    msg = msg[msg.find("\n\n"):]
    merge_patt_search = merge_patt.search(msg)

    if merge_patt_search is not None:
        branch, _, rev = merge_patt_search.groups(0)

        rev = "r" + rev

        if branch.startswith("trunk"):
            branch = ""
        else:
            branch = branch.split("/")[-1]
    #        if branch == "solar-constrain":
    #           branch = "solar-constraint"

        while True:
            p = Popen('git svn find-rev %s %s' % (rev, branch), shell=True,
                      stdout=PIPE, close_fds=True)

            sha = p.communicate()[0].strip()

            if sha == "":
                p = Popen('git svn log -%s:1 --limit=1 --oneline %s' % (rev, branch), shell=True,
                          stdout=PIPE, close_fds=True)

                rev = p.communicate()[0].split("|")[0].strip()
            else:
                break

        grafts.append(" ".join((commit,) + parents + (sha,)) + "\n")
    
f = open(".git/info/grafts", 'a')
f.writelines(grafts)
f.close()
