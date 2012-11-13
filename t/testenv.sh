_testname() { echo == test: $*; }
die() { echo $* >&2; exit -1; }

repo=testrepo.git
clone=testrepo
products="$repo $clone"

trap '{ rm -rf $products; }' EXIT
trap '{ trap - EXIT; }' ERR
