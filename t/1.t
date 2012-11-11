#!/bin/bash -eu

git-add-to |& grep -q usage && true
git-add-to tree |& grep -q usage && true
