## Set variables from arguments

# parse args
usage="usage: $0 [-t <seconds>] <somerepo>.git [init] commit1 [commit2 ...]"

# flag ('-X') parsing
seconds=0
while getopts ":t:" opt; do
  case $opt in
    t) seconds=$OPTARG ;;
    \?) die $usage ;;
    :) die $usage ;;
  esac
done
shift $(( OPTIND - 1 ))

# now the other args
[ $# -lt 2 ] && die $usage

repo=${1:?$usage}
[ "${repo%.git}" = "$repo" ] && die $usage   # reponame must end in '.git'
repo=${repo#file://} # trim off "file://" if it's there

clone=$(basename ${repo/.git/}) # local copy

readme=README.$clone
shift

initialize_blank_repo="false"
if [ "$1" = "init" ]; then
  initialize_blank_repo="true"
  shift
fi

export commits=${*:-}
