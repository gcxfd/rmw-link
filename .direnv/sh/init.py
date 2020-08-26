#!/usr/bin/env python3

from gitsrc import GITSRC, ROOT
from os.path import exists, join, dirname


def main():
  gitmodules = "gitmodules"
  if exists(join(ROOT, "."+gitmodules)):
    return

  li = []

  with open(join(ROOT, ".direnv/%s.ini" % gitmodules)) as f:
    for name in f:
      print(name)
      name = name.strip(" \n")
      if not name:
        continue
      txt = f"""[submodule "{name}"]
path = {name}
url = {GITSRC}/{name}.git"""
      li.append(txt)

  with open(join(ROOT, "."+gitmodules), "w") as out:
    out.write('\n'.join(li))


main()
