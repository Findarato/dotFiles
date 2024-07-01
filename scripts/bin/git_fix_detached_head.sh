BRANCH_NOW=$(date +"%Y-%m-%d_%H:%M:%S")
git switch -c ${BRANCH_NOW}
git switch master
git merge ${BRANCH_NOW}