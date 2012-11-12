#!/bin/bash -eu

source testenv.sh

_testname happy path

_testname make an empty repo
rm -rf $products
git-add-to $repo init
[ -d $repo ] && [ -d $clone ]
[ -x $clone/README ] && ! [ -s $clone/README* ]
cd $clone
git show | grep -q initial
cd ~-

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

cd $clone
git reset -q --hard origin/master
git clean -dfx
grep -q XXX README*
cd ~-

_testname check multiple commits

commits="XXX YYY ZZZ"
git-add-to $repo init $commits
for commit in $commits; do
  grep -q $commit $clone/README*
done
