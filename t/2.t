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
grep -q initial $clone/README*

### ensure multi-args doesn't break this
sleep 1
git-add-to $repo init {a..c}
# verify that they're still there
[ -d $repo ] && [ -d $clone ]
# verify that they're newly created
ls -lt $products | sort | diff - <( ls -ult $products | sort )
grep -q initial $clone/README*

## c: update a non-empty repo
sleep 1
git-add-to $repo XXX
# verify that they aren't newly created
! ls -lt $products | sort | diff - <( ls -ult $products | sort )

pushd $clone
git reset --hard origin/master
git clean -dfx
grep XXX README*
popd

## d: check multiple commits

sleep 1
commits="XXX YYY ZZZ"
git-add-to $repo init $commits
# verify that they are newly created
for $c in $commits; do
  grep -q $c $clone/README*
done

rm -rf $products
