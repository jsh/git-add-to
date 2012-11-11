#!/bin/bash -eu

source testenv.sh

_testname put repo in a subdirectory
commit="0"
repodir=repositories
mkdir $repodir
products+=" $repodir"
git-add-to $repodir/testrepo.git init $commit
grep -q $commit $clone/README*

_testname put repo in separate directory
commit="1"
repodir=/tmp/repositories
products+=" $repodir"
git-add-to $repodir/testrepo.git init $commit
grep -q $commit $clone/README*

_testname give repo a file protocol
commit="2"
repodir=file://$PWD/repositories
products+=" $(basename $repodir)"
git-add-to $repodir/testrepo.git init $commit
grep -q $commit $clone/README*
