#!/bin/bash -eux

git-add-to >/dev/null |& grep -q usage
git-add-to tree >/dev/null |& grep -q usage
