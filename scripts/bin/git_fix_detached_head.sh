BRANCH_NOW=$(date +"%Y%m%d%H%M%S")
git switch -c ${BRANCH_NOW}
git switch master
git merge ${BRANCH_NOW}
git branch -d ${BRANCH_NOW}
