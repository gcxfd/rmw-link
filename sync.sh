#!/usr/bin/env bash

_DIR=$(cd "$(dirname "$0")"; pwd)
cd $_DIR

git submodule update --init --recursive
git submodule foreach --recursive "git checkout master"
git submodule foreach --recursive "git pull origin master --recurse-submodules"
git submodule foreach --recursive "direnv allow;bash .envrc"

