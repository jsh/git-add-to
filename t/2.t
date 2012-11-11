#!/bin/bash -eux
# happy path

repo=testrepo.git
clone=testrepo
products="$repo $clone"

## a: make an empty repo
rm -rf $products
git-add-to $repo init
[ -d $repo ] && [ -d $clone ]

## b: overwrite an empty repo
sleep 1
git-add-to $repo init
# verify that they're still there
[ -d $repo ] && [ -d $clone ]
# verify that they're newly created
ls -lt $products | sort | diff - <( ls -ult $products | sort )

## c: update a non-empty repo
sleep 1
git-add-to $repo XXX
# verify that they aren't newly created
! ls -lt $products | sort | diff - <( ls -ult $products | sort )

## d: verity that there's a new commit
filemodified=README.$clone
pushd $clone
git reset --hard origin/master
git clean -dfx
grep XXX $filemodified
popd


rm -rf $products
