## Config for work
USERNAME=jharry
EXCLUDE_FILE="${HOME}/bin/config/resticExcludes.txt"

BACKUP_LOCATION=s3:https://itc-tn-01.methnet.org:9000/joe.backup/worktop
BACKUP_SRC="${HOME}"
TAGS="--tag 🕐 --tag laptop"

#RESTIC=${HOME}/.local/bin/restic
#PASS=${HOME}/.local/bin/pass
RESTIC=/usr/bin/restic
PASS=/usr/bin/pass



export RESTIC_PASSWORD=$($PASS computer/restic)
export AWS_ACCESS_KEY_ID=$($PASS computer/itc-tn-01/s3Access)
export AWS_SECRET_ACCESS_KEY=$($PASS computer/itc-tn-01/s3AccessSecret)
# Location of restic
#RESTIC=distrobox-enter restic -- /usr/bin/restic

#Retention settings
HOURS=12
DAYS=30
WEEKS=1
MONTHS=12

RUNBEFORE=""
RUNAFTER=""