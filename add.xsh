#!/usr/bin/env xonsh

from gitsrc import GITSRC, ROOT

$RAISE_SUBPROC_ERROR = True

def main():
  if len($ARGS) <= 1:
    print('need repo name')
    return

  from os.path import dirname,join,exists

  DIR = dirname(__file__)
  cd @(DIR)

  repo = $ARG1
  if exists(repo):
    return
  src = join(GITSRC, repo+".git")
  echo @(src)
  git submodule add --force @(src)
  cd @(repo)
  direnv allow
  echo @(repo) >> @(ROOT)/.direnv/gitmodules.ini

main()
