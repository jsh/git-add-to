#!/bin/bash -eux
# happy path

repo=testrepo.git
clone=testrepo

# make an empty tree
rm -rf ${clone}*
git-add-to $repo init
[ -d $repo ] && [ -d $clone ]

# b
sleep 1
git-add-to tree.git init
# verify that they're still there
[ -d tree ] && [ -d tree.git ]
# verify that they're newly created
ls -lt | diff - <(ls -ult)

rm -rf $repo $clone
