#!/bin/bash -eu

git-add-to |& grep -q usage && true
git-add-to tree.git |& grep -q usage && true
git-add-to tree init |& grep -q usage && true
