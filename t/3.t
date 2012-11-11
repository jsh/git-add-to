#!/bin/bash -eu

source testenv.sh

_testname ensure init is handled with multi-args
sleep 1
git-add-to $repo init {a..c}
# verify that they're still there
[ -d $repo ] && [ -d $clone ]
# verify that they're newly created
ls -lt $products | sort | diff - <( ls -ult $products | sort )
