remote_mango='upstream'
remote_committer='origin'
committer_branch='ibmf_custom'
test_branch='ibm_current'

usage="Usage: $0 COMMITTER_REMOTE COMMITTER_BRANCH"

if [ ! -z "$1" -a "$1" == "-h" ]
then
echo -e "$usage" ;
exit ;
fi

if [ ! -z "$1" ]
then
remote_committer="$1" ;
fi

if [ ! -z "$2" ]
then
committer_branch="$2" ;
fi

echo 'Cleaning up'
git reset --hard

echo 'Fetching remotes'
git fetch $remote_mango
git fetch $remote_committer
git checkout $test_branch

echo 'Updating local branch'
git pull $remote_mango $test_branch

echo 'Performing test merge'
git merge --no-commit --no-ff $remote_committer/$committer_branch

echo 'Changes to commit:'
git status -s

