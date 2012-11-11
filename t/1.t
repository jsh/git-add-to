#!/bin/bash -eu

source testenv.sh

_testname bad args produce a usage message
git-add-to |& grep -q usage && true
git-add-to tree.git |& grep -q usage && true
git-add-to tree init |& grep -q usage && true
