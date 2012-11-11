_testname() { echo == test $*; }

repo=testrepo.git
clone=testrepo
products="$repo $clone"

trap '{ rm -rf $products; }' EXIT
trap '{ trap - EXIT; }' ERR
