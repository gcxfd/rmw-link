#!/usr/bin/env bash

_DIR=$(dirname $(realpath "$0"))
cd $_DIR
npm version patch
sync
git push git@rmw.github.com:rmw-link/desktop.git master:release --force

