#!/bin/bash -eux
# happy path

repo=testrepo.git
clone=testrepo
products="$repo $clone"

# make an empty tree
rm -rf $products
git-add-to $repo init
[ -d $repo ] && [ -d $clone ]

# b
sleep 1
git-add-to $repo init
# verify that they're still there
[ -d $repo ] && [ -d $clone ]
# verify that they're newly created
ls -lt $products | sort | diff - <( ls -ult $products | sort )

rm -rf $products
