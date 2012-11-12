#!/bin/bash -eu
# test forcing checkins to different times

source testenv.sh

_testname force commits at different times

git-add-to -t 1 testrepo.git init {1..5}
cd testrepo
[ $(git log | grep Date | wc -l) -eq 6 ]
