#!/usr/bin/env xonsh

from os.path import dirname,abspath,join,isdir,basename
from os import listdir

ROOT = dirname(abspath(__file__))
DIR_Li = tuple(i for i in listdir(ROOT) if isdir(i) and not i.startswith('.'))

with open(join(ROOT,".direnv/push.config")) as f:
  for git in f:
    git = git.strip()
    if not git:
      continue
    for dirname in DIR_Li:
      gitsrc = f"{git}/{dirname}.git"
      cd @(ROOT)/@(dirname)
      print(gitsrc)
      git push -f @(gitsrc) master &

    gitsrc = f"{git}/rmw-link.git"
    print(gitsrc)
    cd @(ROOT)
    git push -f @(gitsrc) master&

wait
