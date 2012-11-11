#!/bin/bash -eu

source testenv.sh

_testname happy path

_testname make an empty repo
rm -rf $products
git-add-to $repo init
[ -d $repo ] && [ -d $clone ]
[ -x $clone/README ] && ! [ -s $clone/README* ]
pushd $clone
git show | grep -q initial
popd

_testname overwrite an existing repo
sleep 1
git-add-to $repo init
# verify that they're still there
[ -d $repo ] && [ -d $clone ]
# verify that they're newly created
ls -lt $products | sort | diff - <( ls -ult $products | sort )

_testname update a non-empty repo
sleep 1
git-add-to $repo XXX
# verify that they aren't newly created
! ls -lt $products | sort | diff - <( ls -ult $products | sort )

pushd $clone
git reset --hard origin/master
git clean -dfx
grep XXX README*
popd

_testname check multiple commits

commits="XXX YYY ZZZ"
git-add-to $repo init $commits
for commit in $commits; do
  grep -q $commit $clone/README*
done

_testname put repo in another directory

commits="0"
mkdir repositories
products+=" repositories"
git-add-to repositories/$repo init $commits
grep -q $commit $clone/README*
