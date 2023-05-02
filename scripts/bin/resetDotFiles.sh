git fetch origin/main

git reset --hard origin/main

git reflog expire --expire=now --all

git gc --prune=now --aggressive