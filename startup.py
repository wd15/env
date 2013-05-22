import tables
import tables as tb
try:
    import fipy
    import fipy as fp
except:
    pass
import numpy
import numpy as np
import scipy
import scipy as spy
import matplotlib.pyplot as plt


def gitCommand(cmd, verbose=False):    
    from subprocess import Popen, PIPE
    p = Popen(['git'] + cmd, shell=False, stdin=PIPE, stdout=PIPE, stderr=PIPE, close_fds=True)
    p.wait()
    out = p.stdout.read()
    if verbose:
        print out
        print p.stderr.read()
    return out

def gitCurrentCommit():
    return gitCommand(['log', '--oneline', '-1', '--abbrev=12', '--format="%h"']).strip().strip('"')


class _Prompt(object):
    def __str__(self):
        import datetime
        sha = gitCommand(['log', '--oneline', '-1', '--abbrev=12', '--format="%h"']).strip().strip('"')
        if len(sha) > 0:
            sha = ' ' + sha
        return  '[' + datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S") + sha + ']'
    
    
class _PromptIn(_Prompt):
    def __str__(self):
        return super(_PromptIn, self).__str__() + ' >>> '

    
class _PromptOut(_Prompt):
    def __str__(self):
        return super(_PromptOut, self).__str__() + ' <<< '


_promptIn = _PromptIn()
_promptOut = _PromptOut()
